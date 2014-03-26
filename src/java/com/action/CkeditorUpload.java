/*
 * @author : karl
 * @creation : 2014-3-23 下午08:26:36
 * @description : 
 *
 */

package com.action;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.base.BaseAction;
import com.bean.FileInfo;
import com.service.FileService;
import com.util.EncoderHandler;
import com.util.G;
import com.util.Util;

public class CkeditorUpload extends BaseAction {

	protected File upload[];
	private String uploadContentType[];
	private String uploadFileName[];
	private String dirroot = null;
	private String dir = null;
	private String callback = null;

	private FileService fileService;

	private String destFileFileName;
	private String destFileFileNameExt;
	private int	   pathFlag=2;
	private String md5;
	private String sha1;
	private FileInfo fileInfo;

	private DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	private DateFormat dfFile = new SimpleDateFormat("yyyyMMddhhmmssSSS");

	@Override
	public String handle() throws Exception {
		JSONObject jsonmsg = upload();
		if(jsonmsg==null){
			return Util.NONE;
		}
		else{
			msg = "";
			request.setAttribute("json", jsonmsg.toString());
		}

		response.reset();
		//设置接收的编码格式    
		request.setCharacterEncoding("UTF-8");
		//设置发送的编码格式    
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// 设置字符编码为UTF-8, 这样支持汉字显示

	//	String callBackString=("<script>parent.window."+callback+"("+jsonmsg.toString()+")</script>");

		callback =ServletActionContext.getRequest().getParameter("CKEditorFuncNum"); 
		PrintWriter out = response.getWriter();
		if(callback!=null && !callback.equals("")){
			//			response.setContentLength(callBackString.length());
			JSONArray jsonEmployeeArray = JSONArray.fromObject(jsonmsg.get("data"));
			if(jsonEmployeeArray !=null && jsonEmployeeArray.size()>0){
				JSONObject msg = (JSONObject) jsonEmployeeArray.get(0);
				String callBackString = ("<script type=\"text/javascript\">");
				callBackString += ("window.parent.CKEDITOR.tools.callFunction("+ callback + ",'" + msg.getString("path") + "','')"); 
				callBackString += ("</script>");
				response.setBufferSize(callBackString.length());
				System.out.println("callback = "+callBackString);
				out.write(callBackString);
			}	
		}
		else{
			//	response.setContentLength(jsonmsg.toString().length());
			response.setBufferSize(jsonmsg.toString().length());
			out.write(jsonmsg.toString());
		}
		out.flush();
		out.close();

		return Util.NONE;
	}


	private JSONObject upload(){

		if(upload==null)
			return null;
		String path = ServletActionContext.getServletContext().getRealPath("/../"); 

		String wabappUploadDir = G.wabappUploadDir; 

		if(dir!=null && dir.length()>0 && !dir.startsWith(".") ){
			File dirFile = new File(path,dir);
			wabappUploadDir += "/"+dir;
		}

		path += wabappUploadDir;
		pathFlag = 2;//sub wabapp;

		System.out.println("dirroot="+dirroot);
		System.out.println("dir="+dir);

		if(dirroot!=null && dirroot.length()>1){
			File dirrootFile = new File(dirroot);
			dirrootFile.mkdirs();
			if(dirrootFile.exists()){
				path = dirrootFile.getAbsolutePath();
				pathFlag = 0;
			}
			if(dir!=null && dir.length()>0 && !dir.startsWith(".") ){
				File dirFile = new File(path,dir);
				path = dirFile.getAbsolutePath(); 
			}
		}

		// 写到指定路径  
		File dir = new File(path);  
		//判断指定的路径下是否有uplaod，如果没有，自动创建  
		if (!dir.exists()) {  
			dir.mkdirs();  
		}  

		JSONArray jsonEmployeeArray = new JSONArray();
		JSONObject jsonmsg = new JSONObject();
		int index = -1;
		int uploadedSum = 0 ;
		try {  
			for(int i = 0;i<upload.length;i++){  
				JSONObject json = new JSONObject();

				json.put("error", 0);
				json.put("msg", "");

				index  = uploadFileName[i].lastIndexOf(".");
				if(index>0)
					destFileFileNameExt =  uploadFileName[i].substring(index,  uploadFileName[i].length());
				else
					destFileFileNameExt = "";
				destFileFileName = dfFile.format(new Date())+"_"+i+destFileFileNameExt;

				md5  = EncoderHandler.FileMD5(upload[i]);
				sha1 = EncoderHandler.FileSHA1(upload[i]);
				try {
					fileInfo = fileService.query(md5, sha1);
					if(fileInfo!=null){
						// 检测文件是否存在
						String testFilePath =null;
						if(fileInfo.getPathFlag()==0)
							testFilePath = fileInfo.getPath();
						else if(fileInfo.getPathFlag()==1)
							testFilePath = ServletActionContext.getServletContext().getRealPath("/") + fileInfo.getPath();
						else if(fileInfo.getPathFlag()==2)
							testFilePath = ServletActionContext.getServletContext().getRealPath("/../") + fileInfo.getPath();
						File testFile =new File (testFilePath);
						if(testFile.exists())
						{
							//文件已经存在
							json.put("id", fileInfo.getId());
							json.put("fileName", uploadFileName[i]);
							json.put("fileSize", fileInfo.getFileSize());
							json.put("pathFlag", fileInfo.getPathFlag());
							json.put("path", fileInfo.getPath());
							jsonEmployeeArray.add(json);
							uploadedSum ++;
							continue;
						}else{
							//文件不存在，但在数据库中有记录，此时需要清除记录
							fileService.delete(fileInfo.getId());
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

				File dest = new File(dir, destFileFileName);
				FileUtils.copyFile(upload[i], dest);  

				if(pathFlag==2){//相对路径
					fileInfo = new FileInfo(uploadFileName[i], sha1, md5, dest.length(), destFileFileNameExt, pathFlag,
							wabappUploadDir +"/"+ destFileFileName, 0, 1);
				}
				else if(pathFlag==0){//绝对路径， 如FTP
					fileInfo = new FileInfo(uploadFileName[i], sha1, md5, dest.length(), destFileFileNameExt, pathFlag,
							dest.getAbsolutePath(), 0, 1);
				}
				try {
					fileService.add(fileInfo);
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					fileInfo = fileService.query(md5, sha1);
					if(fileInfo!=null){
						json.put("error", 0);//没有错误
						json.put("id", fileInfo.getId());
						json.put("fileName", uploadFileName[i]);
						json.put("pathFlag", fileInfo.getPathFlag());
						json.put("path", fileInfo.getPath());
						uploadedSum ++;
					}else{
						json.put("error", 0);//没有错误
						json.put("msg", "保存入库失败");
					}
					jsonEmployeeArray.add(json);

				} catch (Exception e) {
					e.printStackTrace();
					json.put("error", -1);//错误
					json.put("msg", "保存入库异常");
					jsonEmployeeArray.add(json);
				}

				FileWriter md5File = new FileWriter(dir+"/"+destFileFileName+".md5");
				md5File.write("FileName     : "+uploadFileName[i]+"\r\n");
				md5File.write("FileSize     : "+dest.length()+" byte\r\n");
				md5File.write("LastModified : "+df.format(new Date(dest.lastModified()))+"\r\n");
				md5File.write("MD5          : "+md5+"\r\n");
				md5File.write("SHA1         : "+sha1+"\r\n");
				md5File.close();

				System.out.println("uploaded file: "+uploadFileName[i]+" @ "+dest.getAbsolutePath());
			}  
		} catch (IOException e) {  
			e.printStackTrace();  
			return null;
		}  

		jsonmsg.put("error",  uploadedSum==upload.length? 0:-2);
		jsonmsg.put("msg", "");
		jsonmsg.put("data", jsonEmployeeArray);

		return jsonmsg;  
	}


	@Override
	public String add() throws Exception {
		return null;
	}

	@Override
	public String beforeAdd() throws Exception {
		return null;
	}

	@Override
	public String beforeUpdate() throws Exception {
		return null;
	}

	@Override
	public String delete() throws Exception {
		return null;
	}

	@Override
	public String query() throws Exception {
		return null;
	}

	@Override
	public String update() throws Exception {
		return null;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		return false;
	}

	@Override
	public String view() throws Exception {
		return null;
	}


	public File[] getUpload() {
		return upload;
	}


	public void setUpload(File[] upload) {
		this.upload = upload;
	}


	public String[] getFileContentType() {
		return uploadContentType;
	}


	public void setFileContentType(String[] fileContentType) {
		this.uploadContentType = fileContentType;
	}


	public String[] getFileFileName() {
		return uploadFileName;
	}


	public void setFileFileName(String[] fileFileName) {
		this.uploadFileName = fileFileName;
	}


	public String getDirroot() {
		return dirroot;
	}


	public void setDirroot(String dirroot) {
		this.dirroot = dirroot;
	}


	public String getDir() {
		return dir;
	}


	public void setDir(String dir) {
		this.dir = dir;
	}


	public String getCallback() {
		return callback;
	}


	public void setCallback(String callback) {
		this.callback = callback;
	}


	public FileService getFileService() {
		return fileService;
	}


	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}


	public String getDestFileFileName() {
		return destFileFileName;
	}


	public void setDestFileFileName(String destFileFileName) {
		this.destFileFileName = destFileFileName;
	}


	public String getDestFileFileNameExt() {
		return destFileFileNameExt;
	}


	public void setDestFileFileNameExt(String destFileFileNameExt) {
		this.destFileFileNameExt = destFileFileNameExt;
	}


	public int getPathFlag() {
		return pathFlag;
	}


	public void setPathFlag(int pathFlag) {
		this.pathFlag = pathFlag;
	}


	public String getMd5() {
		return md5;
	}


	public void setMd5(String md5) {
		this.md5 = md5;
	}


	public String getSha1() {
		return sha1;
	}


	public void setSha1(String sha1) {
		this.sha1 = sha1;
	}


	public FileInfo getFileInfo() {
		return fileInfo;
	}


	public void setFileInfo(FileInfo fileInfo) {
		this.fileInfo = fileInfo;
	}


	public DateFormat getDf() {
		return df;
	}


	public void setDf(DateFormat df) {
		this.df = df;
	}


	public DateFormat getDfFile() {
		return dfFile;
	}


	public void setDfFile(DateFormat dfFile) {
		this.dfFile = dfFile;
	}


	public String[] getUploadContentType() {
		return uploadContentType;
	}


	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}


	public String[] getUploadFileName() {
		return uploadFileName;
	}


	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

}

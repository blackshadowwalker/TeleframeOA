package com.action.system;

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

/**
 * 文件上传Action
 * 
 * @author karl
 * @date  2014-3-6上午09:45:47
 */

public class UploadAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	//form field
	private File file[];
	private String fileContentType[];
	private String fileFileName[];
	private String dirroot = null;
	private String dir = null;
	private String callback = null;

	private FileService fileService;

	private String destFileFileName;
	private String destFileFileNameExt;
	private int	   pathFlag=2; // 0: absolute path  1: current path sub project 	2: sub webapp
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

		String callBackString=("<script>parent.window."+callback+"("+jsonmsg.toString()+")</script>");
		
		response.reset();
		//设置接收的编码格式    
		request.setCharacterEncoding("UTF-8");
		//设置发送的编码格式    
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		// 设置字符编码为UTF-8, 这样支持汉字显示

		PrintWriter out = response.getWriter();
		if(callback!=null && !callback.equals("")){
//			response.setContentLength(callBackString.length());
			response.setBufferSize(callBackString.length());
			System.out.println("callback = "+callBackString);
			out.write(callBackString);
		}
		else{
//			response.setContentLength(jsonmsg.toString().length());
			response.setBufferSize(jsonmsg.toString().length());
			out.write(jsonmsg.toString());
		}
		out.flush();
		out.close();
		
		return Util.NONE;
	}

	private JSONObject upload(){

		String path = ServletActionContext.getServletContext().getRealPath("/"); 
		
		String wabappUploadDir = G.getUploadRootDir(); 
		
		if(wabappUploadDir.startsWith("/") || wabappUploadDir.startsWith("../")){
			pathFlag = 2;// 2: sub wabapp;
			path += "../";
		}else{
			pathFlag = 1;// 1: current path sub project 
		}
		if(dir!=null && dir.length()>0 && !dir.startsWith(".") ){
			File dirFile = new File(path,dir);
			wabappUploadDir += "/"+dir;
		}
		path += wabappUploadDir;
		
		System.out.println("dirroot="+dirroot);
		System.out.println("dir="+dir);
			
		if(dirroot!=null && dirroot.length()>1){
			File dirrootFile = new File(dirroot);
			dirrootFile.mkdirs();
			if(dirrootFile.exists()){
				path = dirrootFile.getAbsolutePath();
				pathFlag = 0; // 0: absolute path 
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
		if(file==null)
			return null;
		try {  
			for(int i = 0;i<file.length;i++){  
				JSONObject json = new JSONObject();
				
				json.put("error", 0);
				json.put("msg", "");
				
				index  = fileFileName[i].lastIndexOf(".");
				if(index>0)
				 	destFileFileNameExt =  fileFileName[i].substring(index,  fileFileName[i].length());
				else
					destFileFileNameExt = "";
				destFileFileName = dfFile.format(new Date())+"_"+i+destFileFileNameExt;
				
				md5  = EncoderHandler.FileMD5(file[i]);
				sha1 = EncoderHandler.FileSHA1(file[i]);
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
							json.put("fileName", fileFileName[i]);
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
				FileUtils.copyFile(file[i], dest);  
				
				if(pathFlag==2){//相对路径
					fileInfo = new FileInfo(fileFileName[i], sha1, md5, dest.length(), destFileFileNameExt, pathFlag,
							wabappUploadDir +"/"+ destFileFileName, 0, 1);
				}
				else if(pathFlag==0){//绝对路径， 如FTP
					fileInfo = new FileInfo(fileFileName[i], sha1, md5, dest.length(), destFileFileNameExt, pathFlag,
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
						json.put("fileName", fileFileName[i]);
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
				md5File.write("FileName     : "+fileFileName[i]+"\r\n");
				md5File.write("FileSize     : "+dest.length()+" byte\r\n");
				md5File.write("LastModified : "+df.format(new Date(dest.lastModified()))+"\r\n");
				md5File.write("MD5          : "+md5+"\r\n");
				md5File.write("SHA1         : "+sha1+"\r\n");
				md5File.close();
				
				System.out.println("uploaded file: "+fileFileName[i]+" @ "+dest.getAbsolutePath());
			}  
		} catch (IOException e) {  
			e.printStackTrace();  
			return null;
		}  
		
		jsonmsg.put("error",  uploadedSum==file.length? 0:-2);
		jsonmsg.put("msg", "");
		jsonmsg.put("data", jsonEmployeeArray);
		
		return jsonmsg;  
	}

	public File[] getFile() {
		return file;
	}

	public String[] getFileContentType() {
		return fileContentType;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public String getDirroot() {
		return dirroot;
	}

	public String getDir() {
		return dir;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public void setFileContentType(String[] fileContentType) {
		this.fileContentType = fileContentType;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public void setDirroot(String dirroot) {
		this.dirroot = dirroot;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public FileService getFileService() {
		return fileService;
	}

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	@Override
	public String add() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeAdd() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String beforeUpdate() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String query() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean validate(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}

package com.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.fastinfoset.Encoder;

public class FileUtil {

	
	public static String FormatSize(Double size){
		
		String ext=" byte";
		double  msize= 0.0;
		double b=1024;
		double kb = b * b;
		double mb = kb * b;
		double gb = mb * b;
		double tb = gb * b;

		if(size<b){
			msize = size;
			ext   = " byte";
		}else if(size<kb)
		{
			msize = size/1024;
			ext   = " KB";
		}
		else if(size<mb){
			msize = size/kb;
			ext   = " MB";
		}
		else if(size<gb){
			msize = size/mb;
			ext   = " GB";
		}
		else if(size<tb){
			msize = size/gb;
			ext   = " TB";
		}else{
			msize = size/tb;
			ext   = " PB";
		}

		return String.format("%.1f%s", msize, ext);
	}
	
	public static void main(String args[]){
		System.out.println(FileUtil.FormatSize(100.0));
		System.out.println(FileUtil.FormatSize(1005.0));
		System.out.println(FileUtil.FormatSize(2000.0));
		System.out.println(FileUtil.FormatSize(30000000000000000.0));
	}
	
	/**
	 * 下载文件 方式1
	 * @param filePath 文件全路径
	 * @param fileName 下载文件名称
	 * @param response
	 * @throws FileNotFoundException
	 */
	public static HttpServletResponse downloadLocalFile1(String filePath, String fileName, HttpServletResponse response) {
		try {
			// path是指欲下载的文件的路径。
			File file = new File(filePath);
			// 取得文件名。
			if(fileName==null)
				fileName = file.getName();
			// 取得文件的后缀名。
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();

			// 以流的形式下载文件。
			InputStream fis = new BufferedInputStream(new FileInputStream(filePath));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			response.addHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes()));
			response.addHeader("Content-Length", "" + file.length());
			response.setContentType("application/octet-stream");
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return response;
	}

	/**
	 * 下载文件 方式2
	 * @param filePath 文件全路径
	 * @param fileName 下载文件名称
	 * @param response
	 * @throws FileNotFoundException
	 */
	public void downloadLocalFile2(String filePath, String fileName, HttpServletResponse response) throws FileNotFoundException {
		File file = new File(filePath);
		// 取得文件名。
		if(fileName==null)
			fileName = file.getName();
		// 读到流中
		InputStream inStream = new FileInputStream(filePath);// 文件的存放路径
		// 设置输出的格式
		response.reset();
		response.setContentType("bin");
		response.addHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		// 循环取出流中的数据
		byte[] b = new byte[100];
		int len;
		try {
			while ((len = inStream.read(b)) > 0)
				response.getOutputStream().write(b, 0, len);
			inStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 下载网络文件
	 * @param response
	 * @throws MalformedURLException
	 */
	public void downloadNetFile(String urlFilePath, String savePath, HttpServletResponse response) throws MalformedURLException {
		// 下载网络文件
		int bytesum = 0;
		int byteread = 0;
		if(savePath==null)
		{
			savePath = urlFilePath.substring(urlFilePath.lastIndexOf("/")+1, urlFilePath.length());
		}

		URL url = new URL(urlFilePath);

		try {
			URLConnection conn = url.openConnection();
			InputStream inStream = conn.getInputStream();
			FileOutputStream fs = new FileOutputStream(savePath);

			byte[] buffer = new byte[1204];
			int length;
			while ((byteread = inStream.read(buffer)) != -1) {
				bytesum += byteread;
				System.out.println(bytesum);
				fs.write(buffer, 0, byteread);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 支持在线打开文件的一种方式
	 * @param filePath  	: 本地文件
	 * @param response      ：response
	 * @param showFileName  : 在线打开或下载的提示文件名称
	 * @throws Exception
	 */
	public static void OpenOnline(String filePath, HttpServletResponse response, String showFileName) throws Exception {
		Download(filePath, response, true, showFileName);
	}
	
	/**
	 * 下载文件/在线打开
	 * @param filePath
	 * @param response
	 * @param isOnLine
	 * @param showFileName
	 * @throws Exception
	 */
	public static void Download(String filePath, HttpServletResponse response, boolean isOnLine, String showFileName) throws Exception {
		File f = new File(filePath);
		if (!f.exists()) {
			response.sendError(404, "File not found!");
			return;
		}
		BufferedInputStream br = new BufferedInputStream(new FileInputStream(f));
		byte[] buf = new byte[1024];
		int len = 0;

		if(showFileName==null)
			showFileName = f.getName();
		showFileName = URLEncoder.encode(showFileName, Encoder.UTF_8);
		System.out.println("showFileName="+showFileName);
		response.reset(); // 非常重要
		
		response.setCharacterEncoding(Encoder.UTF_8);
		if (isOnLine) { // 在线打开方式
			URL u = new URL("file:///" + filePath);
			response.setContentType(u.openConnection().getContentType());
			response.setHeader("Content-Disposition", "inline; filename=\"" + showFileName + "\"");
			// 文件名应该编码成UTF-8
		} else { // 纯下载方式
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + showFileName + "\"");
		}
		OutputStream out = response.getOutputStream();
		while ((len = br.read(buf)) > 0)
			out.write(buf, 0, len);
		br.close();
		out.close();
	}
}

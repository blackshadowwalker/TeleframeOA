package com.action.system;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.base.BaseAction;
import com.base.FileUtil;
import com.base.qr.QRCodeUtil;
import com.util.Util;

public class qrservlet extends BaseAction {
	
	SimpleDateFormat fileNameTimeFormat= new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss-SSS");
	
	
	@Override
	public String handle() throws Exception {
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		String text = (String) request.getParameter("text");
		if(text==null)
		{
			return this.help(request, response);
		}else{
			
			String logoPath  = "";
			String thisPath = sc.getRealPath("/");
			String thisName = sc.getContextPath();
			thisPath = thisPath.replaceAll("\\\\", "/");
			
			String logUrl =request.getParameter("logo");
			if(logUrl!=null && !logUrl.isEmpty())
			{
				String localUrl = sc.getRealPath("/")+"temp/";
				File f= new File(localUrl);
				f.mkdir();
				localUrl +=  fileNameTimeFormat.format(new Date())+".png";
				if(FileUtil.DownloadImageByUrl(logUrl, localUrl))
					logoPath = localUrl;
			}else{
				logoPath = thisPath + (String) sc.getInitParameter("logo");
			}
			System.out.println("logoPath = "+logoPath);
			
			response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
	        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
	        response.setHeader("Cache-Control", "no-cache");
	        response.setDateHeader("Expire", 0);
			BufferedImage image;
			try {
				image = QRCodeUtil.encodeStream(text, logoPath, true);
				ImageIO.write(image, "JPEG", response.getOutputStream());
			} catch (Exception e) {
				e.printStackTrace();
			}
		//	System.out.println(qrImageRoot+"/"+qrServicePath+"/"+qrName);
			//response.getWriter().write("sucess");
		}
		
		return Util.NONE;
	}
	
	public String help(HttpServletRequest request, HttpServletResponse response){
		
		if(true)
			return Util.HELP;
		
		RequestDispatcher rd = request.getRequestDispatcher("modules/help/qrcode.jsp");   
		try {
			rd.forward(request,response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return Util.NONE;
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
	public boolean validate(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

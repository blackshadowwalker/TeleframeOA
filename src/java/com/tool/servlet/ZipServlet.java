package com.tool.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.AntZip;

public class ZipServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String thisPath = req.getContextPath();
		String requestUri = req.getRequestURI();
		String fileUri = requestUri.substring(thisPath.length()+1, requestUri.length() );
		System.out.println("fileUri="+fileUri);
		
		String realPath = req.getRealPath("/");
		
		String filePath = realPath+fileUri;
		filePath = filePath.replaceAll("\\\\", "/");
		
		System.out.println("filePath="+filePath);
		
		String unZipPath = AntZip.newInstance().unZip(filePath);
		
		String forwardUrl = "/"+fileUri.substring(0, fileUri.lastIndexOf("."));
		System.out.println("forwardUrl="+forwardUrl);
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		//req.getRequestDispatcher(forwardUrl).forward(req, resp);
		resp.sendRedirect(thisPath+forwardUrl);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

}

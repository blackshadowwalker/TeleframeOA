package com.util;


import java.io.File;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.multipart.FilePart;
import org.apache.commons.httpclient.methods.multipart.MultipartRequestEntity;
import org.apache.commons.httpclient.methods.multipart.Part;

public class Test
{
	public static void main(String args[])
	{
		String targetURL = null;// TODO 指定URL
		File targetFile = null;// TODO 指定上传文件

		targetFile = new File("D:\\desktop\\js.docx");
		targetURL = "http://127.0.0.1/oa/modules/file/UploadAction?"; //servleturl
		PostMethod postMethod = new PostMethod(targetURL);

		try
		{

			//通过以下方法可以模拟页面参数提交
			postMethod.setParameter("dir", "httpclientupload");
//			filePost.setParameter("pass", "1234");

			Part[] parts = { new FilePart("file", targetFile) };
			
			postMethod.setRequestEntity(new MultipartRequestEntity(parts,postMethod.getParams()));
			HttpClient client = new HttpClient();
			client.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
			int status = client.executeMethod(postMethod);
			if (status == HttpStatus.SC_OK)
			{
				System.out.println("上传成功");
				System.out.println(postMethod.getResponseBodyAsString());  
				// 上传成功
			}
			else
			{
				System.out.println("上传失败");
				// 上传失败
			}
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			postMethod.releaseConnection();
		}
	}
}
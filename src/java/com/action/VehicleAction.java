package com.action;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.List;

import javax.imageio.stream.ImageOutputStream;
import javax.servlet.ServletOutputStream;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.base.BaseAction;
import com.util.Util;

public class VehicleAction extends BaseAction {

	String actiontype;
	String hpzl;
	String hphm;
	String tj;
	String tj_val;
	String jdccode;

	String codeUrl = "http://117.36.53.122:9081/wfcx/imageServlet";

	@Override
	public String handle() throws Exception {
		
		if(method.equals("query")){
			return query();
		}else if(method.equals("code")){
			return GetCodeImage();
		}
		return Util.NONE;
	}
	
	public String query() throws IOException{
		String url = "http://117.36.53.122:9081/wfcx/query.do?actiontype=vioSurveil&hpzl="+hpzl+"&hphm="+hphm+"&tj="+tj+"&tj_val="+tj_val+"&jdccode="+jdccode;
		System.out.println(url);
		request.setAttribute("data", "");
		
		if((hpzl==null || hpzl.isEmpty()) || (hphm==null || hphm.isEmpty()) || (tj==null || tj.isEmpty())
				|| (tj_val==null || tj_val.isEmpty() )|| (jdccode==null || jdccode.isEmpty()) )
			return Util.LIST;
		
		HttpClient httpclient = new DefaultHttpClient();
		HttpGet get = new HttpGet(url);
		String sessionID = (String) session.get("vsessionID");
//		System.out.println("query sessionID="+sessionID);
		if(sessionID==null)
			return Util.LIST;
		
		get.setHeader("Cookie", sessionID);
		HttpResponse httpResponse = httpclient.execute(get);
		System.out.println(httpResponse.getStatusLine());
		String html = EntityUtils.toString(httpResponse.getEntity());

		Document doc = Jsoup.parse(html);
		Element head = doc.select("head").first(); 
		Element form = doc.select("form").first(); 
		
		if(head!=null && form!=null)
		{
			html = "<html>";
			html += head.toString().replaceAll("href=\"", "href=\"http://117.36.53.122:9081/wfcx/");
			html += "<body>"+form.toString()+"</body>";
			html += "</html>";
		}
//		System.out.println(html);
		
		request.setAttribute("data",html);
		session.remove("vsessionID");

		return Util.LIST;
	}

	public String GetCodeImage() throws ClientProtocolException, IOException{

		HttpClient httpclient = new DefaultHttpClient();
		HttpGet get = new HttpGet(codeUrl);
		HttpResponse httpResponse = httpclient.execute(get);

		List<Cookie> cookies = ((AbstractHttpClient) httpclient).getCookieStore().getCookies();

		Cookie cookie =null;
		if (cookies.isEmpty()) {
			System.out.println("Cookies is empty!");
		} else {
//			System.out.println("[ cookies ] = ");
			for (int i = 0; i < cookies.size(); i++) {
//				System.out.println(cookies.get(i).toString());
				cookie = cookies.get(i);
//				System.out.println(cookie.getValue());
			}
		}
		String sessionID = httpResponse.getFirstHeader("Set-Cookie").getValue();
		session.put("vehicleCookies", cookies);
		session.put("vehicleSessionID", cookie.getValue());
		session.put("vsessionID", sessionID);
		request.setAttribute("data", sessionID);
//		System.out.println("GetCodeImage sessionID="+sessionID);
		
		response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        InputStream is = httpResponse.getEntity().getContent();
        ServletOutputStream out = response.getOutputStream();
        BufferedOutputStream bos=new BufferedOutputStream(out);
        byte[] buf = new byte[128];
        int read = -1;
        while ((read = is.read(buf)) != -1) {
        	bos.write(buf, 0, read);
        }
        bos.close();

        return Util.NONE;


/*
		String gifPath = request.getRealPath("/temp/yzm/");
		File dir = new File(gifPath);
		if(!dir.exists())
			dir.mkdirs();
		double rand = Math.random()*1000000;
		String filename = Double.toString(rand)+".gif"; 
		String filePath = gifPath + filename;
		File storeFile = new File(filePath);  
		FileOutputStream output=null;
		output = new FileOutputStream(storeFile);
		httpResponse.getEntity().writeTo(output);
		output.close();
		System.out.println("Done! Saved to path: "+filePath);
		*/

		

	}

	public String getActiontype() {
		return actiontype;
	}

	public String getHpzl() {
		return hpzl;
	}

	public String getHphm() {
		return hphm;
	}

	public String getTj() {
		return tj;
	}

	public String getTj_val() {
		return tj_val;
	}

	public String getJdccode() {
		return jdccode;
	}

	public void setActiontype(String actiontype) {
		this.actiontype = actiontype;
	}

	public void setHpzl(String hpzl) {
		this.hpzl = hpzl;
	}

	public void setHphm(String hphm) {
		this.hphm = hphm;
	}

	public void setTj(String tj) {
		this.tj = tj;
	}

	public void setTj_val(String tjVal) {
		tj_val = tjVal;
	}

	public void setJdccode(String jdccode) {
		this.jdccode = jdccode;
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
	public String update() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String view() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

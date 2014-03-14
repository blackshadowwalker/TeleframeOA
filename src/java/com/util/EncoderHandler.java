/*
 * Auth: Karl
 * Date: 2013/12/31
 * Desp: Get File/Byte/String 's MD5
 * Function:
 * 		MD5Util.getFileMD5String(file);
		MD5Util.getMD5String(bytes);
		MD5Util.getMD5String(string);
 */

package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EncoderHandler {

	private static final Logger logger = LoggerFactory.getLogger(EncoderHandler.class);
	
	public static String DEFALUT = "MD5";
	public static String MD5 = "MD5";
	public static String SHA1 = "SHA1";

	protected static char hexDigits[] = { '0', '1','2', '3', '4', '5', '6', '7', '8', '9','a', 'b', 'c', 'd', 'e', 'f'};
	protected static MessageDigest messagedigest = null;
	static{
		try {
			messagedigest = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			logger.error("MD5FileUtil messagedigest初始化失败", e);
		}
	}
	/**
	 * 设置算法
	 * @param arg： MD5 / SHA1
	 */
	private static boolean SetAlgorithm(String arg){
		try {
			messagedigest = MessageDigest.getInstance(arg);
		} catch (NoSuchAlgorithmException e) {
			logger.error("MD5FileUtil messagedigest初始化失败", e);
			return false;
		}
		return true;
	}
	
	public static boolean checkPassword(String password, String md5PwdStr) {
		String s = MD5(password);
		return s.equals(md5PwdStr);
	}
	
	public static String Encode(String string, String algorithm){
		if(SetAlgorithm(algorithm))
			return Encode(string.getBytes());
		else
			return null;
	}
	
	public static String Encode(byte[] bytes){
		messagedigest.update(bytes);
		return bufferToHex(messagedigest.digest());
	}

	//sha1
	public static String SHA1(String string){
		if(SetAlgorithm(EncoderHandler.SHA1))
			return Encode(string.getBytes());
		else
			return null;
	}
	public static String FileSHA1(String path) throws IOException{
		return FileEncode(path, EncoderHandler.SHA1);
	}
	public static String FileSHA1(File file) throws IOException{
		return FileEncode(file, EncoderHandler.SHA1);
	}
	
	// md5 
	public static String MD5(String string){
		if(SetAlgorithm(EncoderHandler.MD5))
			return Encode(string.getBytes());
		else
			return null;
	}
	public static String FileMD5(String path) throws IOException{
		return FileEncode(path, EncoderHandler.MD5);
	}
	public static String FileMD5(File file) throws IOException{
		return FileEncode(file, EncoderHandler.MD5);
	}

	public static String FileEncode(String path) throws IOException{
		return FileEncode(path, EncoderHandler.DEFALUT);
	}
	public static String FileEncode(String path, String algorithm) throws IOException{
		File f = new File(path);
		if(!f.exists() || !f.canRead())
			return null;
		return FileEncode(f, algorithm);
	}
	public static String FileEncode(File file) throws IOException{
		return FileEncode(file, EncoderHandler.DEFALUT);
	}
	public static String FileEncode(File file, String algorithm) throws IOException{
		if(SetAlgorithm(algorithm)){
			FileInputStream in = new FileInputStream(file);
			FileChannel ch =in.getChannel();
			MappedByteBuffer byteBuffer =ch.map(FileChannel.MapMode.READ_ONLY, 0, file.length());
			messagedigest.update(byteBuffer);
			return bufferToHex(messagedigest.digest());
		}
		else
			return null;
	}

	private static String bufferToHex(byte bytes[]){
		return bufferToHex(bytes, 0,bytes.length);
	}

	private static String bufferToHex(byte bytes[], int m, int n){
		StringBuffer stringbuffer =new StringBuffer(2 * n);
		int k = m + n;
		for (int l = m; l< k; l++) {
			appendHexPair(bytes[l], stringbuffer);
		}
		return stringbuffer.toString().toUpperCase();
	}


	private static void appendHexPair(byte bt, StringBuffer stringbuffer) {
		char c0 = hexDigits[(bt& 0xf0) >> 4];
		char c1 = hexDigits[bt& 0xf];
		stringbuffer.append(c0);
		stringbuffer.append(c1);
	}


	public static void main(String[] args) throws IOException{

		String path = "E:/karl/Teleframe/Big Data/云计算核心技术剖析.pdf.pdf";
		long begin =System.currentTimeMillis();
		String md5 = FileEncode(path, MD5);
		String sha1 = FileEncode(path, SHA1);
		long end =System.currentTimeMillis();

		File file = new File(path);
		FileInputStream fis = null;
		fis = new FileInputStream(file);
		long size= fis.available();
		System.out.println("File Size="+size*1.0/1024/1024+" MB");

		System.out.println("MD5: "+md5 +" LENGHT="+md5.length());
		System.out.println("SHA1: "+sha1+" LENGHT="+sha1.length());
		System.out.println("time:"+((end-begin)/1000)+"s");

	}

}
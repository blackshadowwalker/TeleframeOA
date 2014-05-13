package com.util;

public class G {

	private static String uploadRootDir = "../download-center/upload";//文件上传根路径
	
	private static String defaultUserPhoto =  "images/user/default.gif";//用户默认头像

	
	
	
	// ============== getter and setter ================================
	
	public static String getUploadRootDir() {
		return uploadRootDir;
	}

	public static void setUploadRootDir(String uploadRootDir) {
		G.uploadRootDir = uploadRootDir;
	}

	public static String getDefaultUserPhoto() {
		return defaultUserPhoto;
	}

	public static void setDefaultUserPhoto(String defaultUserPhoto) {
		G.defaultUserPhoto = defaultUserPhoto;
	}



}

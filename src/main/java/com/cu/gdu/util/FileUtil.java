package com.cu.gdu.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUtil {
	
	
	
	public Map<String, String> fileUpload(MultipartFile uploadFile, HttpSession session, String folderName){
		
		String filePath = "/resources/upload/" + folderName + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());
		String absolutePath = session.getServletContext().getRealPath(filePath);
		
		File filePathDir = new File(absolutePath);
		if(!filePathDir.exists()) {
			filePathDir.mkdirs();
		}

		String originalName = uploadFile.getOriginalFilename();
		String ext = originalName.endsWith(".tar.gz") ? ".tar.gz" : originalName.substring(originalName.lastIndexOf("."));
		
		String filesystemName = UUID.randomUUID().toString().replace("-", "") + ext;
		
		try {
			uploadFile.transferTo(new File(filePathDir, filesystemName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("filePath", filePath);
		map.put("originalName", originalName);
		map.put("filesystemName", filesystemName);
		
		return map;
		
	}
	
}

package com.multi.liveAlone.party.bbsParty;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.sun.org.apache.bcel.internal.generic.NEW;

@Service
public class BbsPartyService {

	public JSONVO up(MultipartFile file, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		JSONVO jsonvo  = new JSONVO();
		
		String fileRoot = request.getContextPath();
		System.out.println(fileRoot);
		String originalFileName = file.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));

		String saveFileName = UUID.randomUUID() + extension;

		File targetFile = new File(fileRoot + saveFileName);

		try {

			InputStream fileStream = file.getInputStream();

			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			String url = "/liveAlone/resources/img/" + saveFileName; 
			
			jsonObject.addProperty("url", url );
			jsonObject.addProperty("responseCode", "succcess");
			System.out.println(jsonObject.toString());
			jsonvo.setUrl(url);
			jsonvo.setResponseCode("succcess");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			jsonvo.setResponseCode("error");
			e.printStackTrace();
		}
		return jsonvo;
	}

}

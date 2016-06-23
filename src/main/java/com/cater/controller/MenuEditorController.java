package com.cater.controller;

import java.io.*;
// import java.util.*;

import javax.servlet.http.HttpServletRequest;

//import org.apache.commons.fileupload.FileItem;
// import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Description:.
 *
 * @since June 20, 2016
 * 
 */
@Controller
@RequestMapping("/menueditor")
public class MenuEditorController
{
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String displayMenuEditorPage() {

		return "menueditor/menueditor";
	}

	@RequestMapping(value = "updateBaseMenuSource", method = RequestMethod.POST)
	public String updateBaseMenuSource(HttpServletRequest request, ModelMap modelMap) {

		String baseMenuSource = request.getParameter("baseMenuSource");
		String filePath = "C:/apps/workspace/CaterRequest/WebContent/resources/";
		String responseMessage = "base menu successfully updated";

		// update the base menu json file
		try {
			File currentMenuFile = new File(filePath + "current-menu.json");
			BufferedWriter output = new BufferedWriter(new FileWriter(currentMenuFile));
			output.write(baseMenuSource);
			output.close();
		}
		catch (Exception ex) {
			responseMessage = ex.getMessage();
		}

		modelMap.addAttribute("menu_source", responseMessage);

		return "menueditor/updateBaseMenuSource";
	}

	@RequestMapping(value = "uploadCustomeMenuSource", method = RequestMethod.POST)
	public String uploadCustomeMenuSource(HttpServletRequest request, ModelMap modelMap, @RequestParam("customMenuSource") MultipartFile customMenuSourceFile) {

		String fileContent = "empty source file";

		// handle file uploaded
		if ( ! customMenuSourceFile.isEmpty()) {
			try {
				fileContent = new String(customMenuSourceFile.getBytes());
			}
			catch (IOException ex) {}
		}

		modelMap.addAttribute("menu_source", fileContent);

		return "menueditor/uploadCustomeMenuSource";
	}
}

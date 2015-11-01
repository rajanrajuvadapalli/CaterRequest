package com.cater.controller;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = { "imagesproxy" })
public class ImagesProxyController {
	//@Value("${images.location}")
	//private String imagesBaseLocation;
	/*@Value("${profile.pic.folder}")
	private String profilePicFolder;*/

	@PostConstruct
	private void postConstruct() {
		//If a system property is set for images base location, it will override
		//the value set in the properties file
		//imagesBaseLocation = System.getProperty("images.location",
		//imagesBaseLocation);
		/*profilePicFolder = System.getProperty("profile.pic.folder",
				profilePicFolder);*/
	}

	/*@ResponseBody
	@RequestMapping(value = { "{cuisine}/{code}" }, method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] get(@PathVariable String cuisine, @PathVariable String code)
			throws IOException {
		String imageUrl = imagesBaseLocation + File.separator + cuisine
				+ File.separator + code + ".jpg";
		//Read file system
		File f = new File(imageUrl);
		InputStream in = FileUtils.openInputStream(f);
		return IOUtils.toByteArray(in);
	}*/

	/*@ResponseBody
	@RequestMapping(value = { "Restaurant_{id}" }, method = RequestMethod.GET, produces = MediaType.IMAGE_JPEG_VALUE)
	public byte[] getRestaurantPic(@PathVariable String id) throws IOException {
		String imageUrl = profilePicFolder + File.separator + "Restaurant_"
				+ id;
		//Read file system
		File f = new File(imageUrl + ".jpg");
		if (!f.exists()) {
			f = new File(imageUrl + ".jpeg");
		}
		if (!f.exists()) {
			f = new File(imageUrl + ".png");
		}
		if (!f.exists()) {
			f = new File(imageUrl + ".gif");
		}
		if (!f.exists()) {
			f = new File(profilePicFolder + File.separator + "not_found.jpg");
		}
		if (!f.exists()) {
			return new byte[1];
		}
		InputStream in = FileUtils.openInputStream(f);
		return IOUtils.toByteArray(in);
	}*/
}

package com.cater.menu;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.MappingJsonFactory;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class MenuDeserializer {
	/**
	 * Read json.
	 *
	 * @param f the f
	 * @return the menu
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public Menu readJSON(File f) throws IOException {
		if (f != null && f.exists()) {
			String json = FileUtils.readFileToString(f);
			return readJSON(json);
		}
		return null;
	}

	/**
	 * Read json.
	 *
	 * @param aString the a string
	 * @return the menu
	 * @throws JsonParseException the json parse exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public Menu readJSON(String aString) throws JsonParseException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.READ_ENUMS_USING_TO_STRING,
				true);
		JsonParser jp = new MappingJsonFactory(mapper)
				.createJsonParser(aString);
		//Menu menu = 
		return mapper.readValue(jp, Menu.class);
	}
}

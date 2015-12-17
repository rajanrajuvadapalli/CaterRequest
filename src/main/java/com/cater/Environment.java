package com.cater;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

/**
 * Description: 
 * Created: Dec 15, 2015
 * @author Hari 
 */
public class Environment {
	private static final Logger logger = Logger.getLogger(Environment.class);
	private String environment;
	private static Environment INSTANCE;

	private Environment() {
		environment = System.getProperty("cr.env");
		logger.debug("CaterRequest Environment: " + environment);
	}

	public static Environment getInstance() {
		if (INSTANCE == null) {
			synchronized (Environment.class) {
				INSTANCE = new Environment();
			}
		}
		return INSTANCE;
	}

	public static enum Types {
		LOCAL("LOCAL"), UAT("UAT"), PROD("PROD");
		private String val;

		Types(String val) {
			this.val = val;
		}

		String getVal() {
			return val;
		}
	}

	public static boolean isProd() {
		return StringUtils.equalsIgnoreCase(Types.PROD.getVal(), Environment.getInstance().environment);
	}

	public static boolean isUat() {
		return StringUtils.equalsIgnoreCase(Types.UAT.getVal(), Environment.getInstance().environment);
	}

	public static boolean isLocal() {
		return StringUtils.equalsIgnoreCase(Types.LOCAL.getVal(), Environment.getInstance().environment);
	}

	@Override
	public String toString() {
		return environment;
	}
}

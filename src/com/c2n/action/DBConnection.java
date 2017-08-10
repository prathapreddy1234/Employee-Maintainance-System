package com.c2n.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class DBConnection {
	public Properties loadproperties() throws Exception {
		// TODO Auto-generated method stub
		InputStream fi=this.getClass().getClassLoader().getResourceAsStream("jdbc.properties");
		Properties prop=new Properties();
		prop.load(fi);
		fi.close();
		return prop;
	}

}

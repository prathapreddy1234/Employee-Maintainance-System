package com.c2n.action;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

public class JasperReport {
	public static void main(String[] args) {
		JasperReport jasper=new JasperReport();
		jasper.generateOfferLetterReport();
	}
	
	public Map generateOfferLetterReport(){
		
//		String sourceFilePath = getFilePath("relieving_jasper_3.jrxml");
		String sourceFilePath = getFilePath("report1.jrxml");
		Map<String, String> map = new HashMap<String , String>();
		Connection conn = null;
 		try {
			conn = getConnection();
			UUID uuid = UUID.randomUUID();
			net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(sourceFilePath);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map,conn);
			
//			export to pdf format (.pdf)
			JasperExportManager.exportReportToPdfFile(jasperPrint,"C:/Users/Prathap/Desktop/jasper3_jars/test_output/"+uuid+".pdf");
//			export to excel format
			JRXlsExporter jrXlsExporter = new JRXlsExporter();
			jrXlsExporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
			jrXlsExporter.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, "C:/Users/Prathap/Desktop/jasper3_jars/test_output/"+uuid+".xls");
			jrXlsExporter.exportReport();
		} catch (SQLException  e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JRException e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
	public String getFilePath(String fileName){
	String path = this.getClass().getClassLoader().getResource("").getPath();
	System.out.println("....PATH..."+path);
	String jrxmlPath = null;	
	try {
			String fullPath = URLDecoder.decode(path, "UTF-8");
			String[] pathArray = new String[2];
			
			if(fullPath.contains("/Reports")){
				pathArray = fullPath.split("/Reports");
				jrxmlPath = pathArray[0] + "/Reports" + fileName;
			}else{
				pathArray = fullPath.split("/build/classes/");
				jrxmlPath = pathArray[0] + "/WebContent/Reports/" + fileName;
			}
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	System.out.println("....jrxmlPath..."+jrxmlPath);
		return jrxmlPath;
	}
	
	
	public Properties loadproperties() throws Exception 
	{
		// TODO Auto-generated method stub
		FileInputStream fi=new FileInputStream("D://jdbc.properties");
		Properties prop=new Properties();
		prop.load(fi);
		fi.close();
		return prop;
	}
	public Connection getConnection()throws SQLException{
		Properties prop;
		String url=null;
		String dbusername=null;
		String dbpassword=null;
		try {
			prop = loadproperties();
			String driver=prop.getProperty("driver");
			url=prop.getProperty("url");
			dbusername=prop.getProperty("usernamedb");
			dbpassword=prop.getProperty("passworddb");
			Class.forName(driver);	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return DriverManager.getConnection(url,dbusername,dbpassword);
	}
}

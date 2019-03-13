<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<%
	 request.setCharacterEncoding("UTF-8");
	 String realFolder = "";
	 int maxSize = 1024*1024*5;
	 String encType = "UTF-8";
	 
	 realFolder = "C:/Users/user/git/SpringProject2/finalProject/src/main/webapp/resources/IMAGE/placeAdd";
	 String filename = "";
	 
	 try{
		  MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, 
				  new DefaultFileRenamePolicy());
		
		  Enumeration<?> files = multi.getFileNames();

		  String file1 = (String)files.nextElement();
		  filename = multi.getFilesystemName(file1);
	 } catch(Exception e) {
	  	e.printStackTrace();
	 }
%>
/springProject/resources/IMAGE/placeAdd/<%=filename %>
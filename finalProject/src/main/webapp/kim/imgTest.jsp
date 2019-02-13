<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	 request.setCharacterEncoding("UTF-8");
	 String realFolder = "";
	 String filename1 = "";
	 int maxSize = 1024*1024*5;
	 String encType = "UTF-8";
	 String savefile = "/resources/IMAGE/placeAdd";
	 ServletContext scontext = getServletContext();
	 realFolder = scontext.getRealPath(savefile);
	 
	 String filename = "";
	 
	 out.print(realFolder + "<br>");
	 
	 try{
		  MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		  Enumeration<?> files = multi.getFileNames();

		  String file1 = (String)files.nextElement();
		  filename = multi.getFilesystemName(file1);
		  	  
	 } catch(Exception e) {
	  	e.printStackTrace();
	 }
	 
	 String fullpath = realFolder + "/" + filename;
	 out.print(fullpath + "^^1");
%>

<title>Insert title here</title>
</head>
<body>
<img src="/springProject/resources/IMAGE/placeAdd/<%=filename%>" width=512 height=384></img>

<a href="img.jsp">이미지확인</a>
</body>
</html>

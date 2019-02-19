<%@page import="com.itbank.springProject.db.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itbank.springProject.db.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
  
<!--jstl안될때  -->
<div>
<%
CommentDTO dto;
 ArrayList list = (ArrayList)request.getAttribute("list");
/*  System.out.print(list.size());
 System.out.print("몇번 넘어왔니"); */
%>
<%for(int i = 0; i<list.size(); i++){ 
    dto = (CommentDTO)list.get(i);
     int depth =  dto.getDepth()*20;
%>
<form id = "<%= dto.getBnum() %>">
       <div id="replyItem<%= dto.getBnum() %>" 
             style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <%= depth %>px; display: inline-block">    
            <%=dto.getId() %> <%= dto.getBdate() %>
            <input type="hidden" name= "parents"value="<%=dto.getParents() %>">
            <input type="hidden" name= "bnum" value="<%=dto.getBnum() %>">
            <button onclick="Delete('<%=dto.getBnum() %>')">삭제</button>
            <button onclick='return Update("<%=dto.getBnum() %>")'>수정</button>
            <button onclick='return Reply("<%= dto.getBnum()%>")'>댓글</button>
            <br/>
            <div id="reply<%= dto.getBnum() %>"><%=dto.getContent() %></div>
        </div><br/>
</form>
<%} %>
  
</div>  
    
    
    
    
    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="replyList"> 
    <c:forEach var="replylist" items="${replylist}" var="list">
   	 <form id="<c:out value="${list.reno}"/>">
        <div id="replyItem<c:out value="${list.reno}"/>" 
             style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replylist.redepth}"/>px; display: inline-block">    
            <c:out value="${list.rewriter}"/> <c:out value="${list.redate}"/>
            <a href="#" onclick="fn_replyDelete('<c:out value="${list.reno}"/>')">삭제</a>
            <a href="#" onclick="fn_replyUpdate('<c:out value="${list.reno}"/>')">수정</a>
            <a href="#" onclick="fn_replyReply('<c:out value="${list.reno}"/>')">댓글</a>
            <br/>
            <div id="reply<c:out value="${list.reno}"/>"><c:out value="${list.rememo}"/></div>
        </div><br/>
        </form>
    </c:forEach>
</div>
 --%>

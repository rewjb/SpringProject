<%@page import="com.itbank.springProject.db.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itbank.springProject.db.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<%--   <% ArrayList list = (ArrayList)request.getAttribute("list"); --%>
<!--     System.out.println("리스트 사이즈 몇????"+list.size()); -->
<%--   %> --%>
<%--   
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
</div>   --%>
<div id="replyList"> <!-- 해당 관광명소에대한 댓글 리스트를 뿌려주는곳  -->
    <c:forEach  items="${list}" var="list">
       <div class="jumbotron mt-3" id="replyItem<c:out value="${list.bnum}"/>" 
             style="border: 2px solid gray; width: 600px; height: auto; padding: 10px; margin-top: 5px; margin-left: <c:out value="${20*list.depth}"/>px; display: inline-block"> 
       <form id="<c:out value="${list.bnum}"/>">
             <c:set var="star" value="${list.star}" />
             <c:forEach begin="1"  end="${star}" >
         <img style="width: 30px; height: 30px;" src="/springProject/resources/IMAGE/star/star.png">  
             </c:forEach>
            <input type="hidden" name= "bnum"value="<c:out value="${list.bnum}"/>">
            <input type="hidden" name= "parents" value="<c:out value="${list.parents}"/>">
            <input type="hidden" name= "mid" value="<c:out value="${list.mid}"/>">
            <c:out value="${list.mid}"/> <c:out value="${list.bdate}"/>
            <br/>
            <div id="reply<c:out value="${list.bnum}"/>"><c:out value="${list.content}"/></div>
        </form>
            <button style="margin-right: 0;" class="btn btn-secondary my-2" onclick="return deleteComment('<c:out value="${list.bnum}"/>','<c:out value="${list.mid}"/>')">삭제</button>
            <button style="margin-right: 0;" class="btn btn-secondary my-2" onclick="return Update('<c:out value="${list.bnum}"/>','<c:out value="${list.mid}"/>')">수정</button>
            <button style="margin-right: 0;" class="btn btn-secondary my-2" onclick="return Reply('<c:out value="${list.bnum}"/>')">댓글</button>
        </div><br/>
    </c:forEach>
</div>

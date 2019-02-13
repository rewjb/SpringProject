<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

</head>
<body>
 <%@ include file="/UserMainHeader.jsp" %>
 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Project_save">
  Launch demo modal
</button>

<a data-toggle="modal" data-target="#Project_save">저장</a>
<a data-toggle="modal" data-target="#Project_place_delete">삭제</a>
<a data-toggle="modal" data-target="#Project_share">공유</a>

<!-- Modal -->
<div class="modal fade" id="Project_save" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
        현재 여행계획을 저장하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">저장</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="Project_place_delete" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
    선택하신 여행장소를 삭제하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">삭제</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="Project_share" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-body">
      현재 여행계획을 공유하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">공유</button>
      </div>
    </div>
  </div>
</div>




<tr>
<td>dd</td>
<td>dd</td>
</tr>
<div>dd</div>
<tr style="outline: 1px solid;">
<td style="outline: 1px solid;">dd</td>
<td style="outline: 1px solid;">dd</td>
</tr>


      
</body>
</html>
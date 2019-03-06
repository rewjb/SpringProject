<!-- 
마이 페이지 - 개인정보 수정 / 개인 계획서 리스트 / 명소 등록신청 / 선호태그 수정
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>마이페이지</title>
  <!-- header -->
  <%@ include file="/UserMainHeader.jsp"%>
</head>

<body>


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h3 class="display-4 pt-3" style="text-align: center; 
        	font-family: 'Do Hyeon', sans-serif; font-size: 30px;">
        	마이페이지</h3>
        <div class="list-group">
          <a href="#" class="list-group-item" style="color: black;">내정보 수정</a>
          <a href="#" class="list-group-item" style="color: black;">선호태그 수정</a>
          <a href="#" class="list-group-item" style="color: black;">내 계획서 리스트</a>
          <a href="#" class="list-group-item" style="color: black;">명소 등록신청</a>
          <a href="#" class="list-group-item" style="color: black;">Category 5</a>
        </div>
      </div>

      <div class="col-lg-9">

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
          <div class="card-body">
            <h3 class="card-title">Product Name</h3>
            <h4>$24.99</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
            4.0 stars
          </div>
        </div>

        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Product Reviews
          </div>
          <div class="card-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
            <small class="text-muted">Posted by Anonymous on 3/1/17</small>
            <hr>
            <a href="#" class="btn btn-success">Leave a Review</a>
          </div>
        </div>

      </div>

    </div>

  </div>
  <!-- /.container -->

  <!-- footer -->
<%@ include file="/UserMainFooter.jsp"%>

</body>

</html>

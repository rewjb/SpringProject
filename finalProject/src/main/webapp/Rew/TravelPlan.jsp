<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
 <%@ include file="/UserMainHeader.jsp" %>


 

 
 <!-- 최상위 컨테이너 -->
<div class="container">

  <!-- 페이지 큰 글자 제목 -->
  <h1 class="my-4">Plan your trip : 
    <small>I want the plan to be a good trip.</small>
  </h1>
  <!-- /.페이지 큰 글자 제목 -->

  <!-- 계획 툴 -->
  <div class="row" style="height:600px">

    <!-- 프로젝트 상세 기록 -->
    <div class="col-md-8" style="width: 750px;background: red;overflow:scroll;overflow-x:hidden; ">
    </div>
    <!-- /.프로젝트 상세 기록 -->

    <!-- 프로젝트 목록 + 관광명소 장바구니 -->
    <div class="col-md-4" style="padding: 0px">

				<!-- 프로젝트 목록 -->
				<div
					style="height: 40%; border: 5px ridge; overflow: scroll; overflow-x: hidden;">
					
					<table class="table table-striped" style="width: 100%;word-break:break-word;">
						<thead>
							<tr>
								<th style="vertical-align : middle;">검색</th>
								<th colspan="2"><input class="form-control" id="Project-Search"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>1</th>
								<td>Markdddddddddddddd</td>
								<td >Otto</td>
							</tr>
							<tr>
								<th>2</th>
								<td>Jacob</td>
								<td>Thornton</td>
							</tr>
							<tr>
								<th>3</th>
								<td>Larry</td>
								<td>the Bird</td>
							</tr>
						</tbody>
					</table>
					
					
				</div>
				<!-- /.프로젝트 목록 -->

				<!-- 관광명소 장바구니 -->
				<div
					style="height: 60%; border: 5px ridge; overflow: scroll; overflow-x: hidden;">

					<table class="table table-striped" style="width: 100%;word-break:break-word;">
						<thead>
							<tr>
								<th style="vertical-align : middle;">검색</th>
								<th colspan="2"><input class="form-control" id="Cart-Search"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<form>
								<th>1</th>
								<td alt="Cart-Content">Markdddddddddddddd</td>
								<input type="hidden" name="id">
								<td>Otto</td>
								</form>
							</tr>
							<tr>
								<form>
								<th>1</th>
								<td alt="Cart-Content">Markdddddddddddddd</td>
								<input type="hidden" name="id">
								<td>Otto</td>
								</form>
							</tr>
							<tr>
								<form>
								<th>1</th>
								<td alt="Cart-Content">Markdddddddddddddd</td>
								<input type="hidden" name="id">
								<td>Otto</td>
								</form>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- /.관광명소 장바구니 -->

			</div>
    <!-- /.프로젝트 목록 + 관광명소 장바구니 -->
    

  </div>
  <!-- /.계획 툴 -->

  <!-- Related Projects Row -->
  <h3 class="my-4">Popular projects</h3>

  <div class="row">

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

    <div class="col-md-3 col-sm-6 mb-4">
      <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
    </div>

  </div>
  <!-- /.row -->

</div>
<!-- /.최상위 컨테이너 -->
 
 
 
 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행계획서 상세페이지</title>
<style>
</style>
</head>
<body>
<%@ include file="/UserMainHeader.jsp"%>

  <section class="jumbotron text-center" style="padding: 10px;  height: 350px;" >
    <div id="recommendDiv" class="container" style="display: inline-block;text-align: center;">
      <h3 class="jumbotron-heading">당신을 위한 여행계획서!</h3>
      
      <div style="display: inline-block;">
			<c:forEach items="${favorProjectList}" var="favorProjectList" varStatus="Index">
				<c:choose>
					<c:when test="${Index.index < 3}">
						<div id="carouselExampleFade" alt="recommend_component"
							style="width: 350px; float: left; padding: 10px"
							class="carousel slide carousel-fade" data-ride="carousel">
							<div class="carousel-inner">
							    <c:set var="text" value="${favorProjectList.img}" />
                                <c:set var="img" value="${fn:split(text,'/')}" />
								<c:forEach var="imgNum" items="${img}" varStatus="index">
								
								 <c:choose>
								 <c:when test="${index.index==0}">
								<div class="carousel-item active" style="z-index: 1">
									<img style="height: 261px;"
										src="/springProject/resources/IMAGE/attractionsImg/${imgNum}">
								</div>
								 </c:when>
								 	<c:otherwise>
								<div class="carousel-item" style="z-index: 1">
									<img style="height: 261px;"
										src="/springProject/resources/IMAGE/attractionsImg/${imgNum}">
								</div> 
					                </c:otherwise>
								 </c:choose>
								</c:forEach>
							</div>
							<span class="btn btn-secondary"
								style="z-index: 2; position: relative; bottom: 50px; background-color: rgba(0, 0, 0, 0.6);">${favorProjectList.ptitle}</span>
						</div>
					</c:when>
					<c:otherwise>

					</c:otherwise>
				</c:choose>
			</c:forEach>
	</div>
	</div>
  </section>
	
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
      
<!--       allProjectList -->

      
       <c:forEach items="${allProjectList}" var="allProjectList" varStatus="Index">
         <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
						<!-- 슬라이드           -->
						<div id="carouselExampleFade" alt="temp" style="height: 261px"
							class="carousel slide carousel-fade" data-ride="carousel">
							<div class="carousel-inner">

									<c:set var="text" value="${allProjectList.img}" />
									<c:set var="img" value="${fn:split(text,'/')}" />
									<c:forEach var="imgNum" items="${img}" varStatus="index">
										<c:choose>
											<c:when test="${index.index==0}">
												<div class="carousel-item active">
													<img style="height: 261px;"
														src="/springProject/resources/IMAGE/attractionsImg/${imgNum}">
												</div>
											</c:when>
											<c:otherwise>
												<div class="carousel-item">
													<img style="height: 261px;"
														src="/springProject/resources/IMAGE/attractionsImg/${imgNum}">
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
						</div>
						<!-- /.슬라이드           -->
            <div class="card-body">
              <p class="card-text">${allProjectList.ptitle}</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">상세</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                  <small class="text-muted"><span>${allProjectList.mid}</span>이 작성</small>
              </div>
            </div>
          </div>
        </div>
       </c:forEach>
        
      </div>
    </div>
  </div>




		
</body>
</html>
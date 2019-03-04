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

<header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">About</h4>
          <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">Follow on Twitter</a></li>
            <li><a href="#" class="text-white">Like on Facebook</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
      <a href="#" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2" focusable="false" aria-hidden="true"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
        <strong>Album</strong>
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>

<main role="main">

  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">Album example</h1>
      <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p>
      <p>
        <a href="#" class="btn btn-primary my-2">Main call to action</a>
        <a href="#" class="btn btn-secondary my-2">Secondary action</a>
      </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
      
         <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
						<!-- 슬라이드           -->
						<div id="carouselExampleFade" alt="temp" style="height: 261px"
							class="carousel slide carousel-fade" data-ride="carousel">
							
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061903.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061916.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061968.jpg">
								</div>
							</div>
						</div>
						<!-- /.슬라이드           -->
            <div class="card-body">
              <p class="card-text">여행계획서 제목이 들어갈 자리!</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
						<!-- 슬라이드           -->
						<div id="carouselExampleFade" alt="temp" style="height: 261px"
							class="carousel slide carousel-fade" data-ride="carousel">
							
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061903.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061916.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061968.jpg">
								</div>
							</div>
						</div>
						<!-- /.슬라이드           -->
            <div class="card-body">
              <p class="card-text">여행계획서 제목이 들어갈 자리!</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
						<!-- 슬라이드           -->
						<div id="carouselExampleFade" alt="temp" style="height: 261px"
							class="carousel slide carousel-fade" data-ride="carousel">
							
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061903.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061916.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061968.jpg">
								</div>
							</div>
						</div>
						<!-- /.슬라이드           -->
            <div class="card-body">
              <p class="card-text">여행계획서 제목이 들어갈 자리!</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
        <div class="col-md-4">
          <div class="card mb-4 shadow-sm">
						<!-- 슬라이드           -->
						<div id="carouselExampleFade" alt="temp" style="height: 261px"
							class="carousel slide carousel-fade" data-ride="carousel">
							
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061903.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061916.jpg">
								</div>
								<div class="carousel-item">
									<img style="width: 100%;"
										src="/springProject/resources/IMAGE/attractionsImg/2014061968.jpg">
								</div>
							</div>
						</div>
						<!-- /.슬라이드           -->
            <div class="card-body">
              <p class="card-text">여행계획서 제목이 들어갈 자리!</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <form action="">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                  <input type="hidden" name="mid" value="13">
                  <input type="hidden" name="ptitle" value="13">
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        
        
        
      </div>
    </div>
  </div>

</main>



		
</body>
</html>
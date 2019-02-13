<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.margin-auto {
  	margin-left: auto; 
  	margin-right: auto;
  	margin-top: auto;
  	margin-bottom: auto;
}

</style>
<%@ include file="/UserMainHeader.jsp" %>
</head>
<!-- <body style="background: #e5ffeb;"> -->
<body style="background-image: url('/springProject/resources/IMAGE/placeAdd/bg.jpg');">

<div style="height: 20px;">
</div>

<div class="container marketing" style="background-color: rgba(255,255,255,0.8); border-radius: 1.0rem;">
<div class="col-12 pt-3">

<form action="selectAllMember">
  <fieldset>
    <legend class="display-4" style="text-align: center;">여행지 등록 신청</legend>
    <hr>
    <div class="card border-secondary mb-3 margin-auto" style="max-width: 50rem;">
	  <div class="card-header">이미지 등록</div>
	  <div class="card-body margin-auto">
	    <p class="card-text">
	    	<img src="/springProject/resources/IMAGE/placeAdd/imgAdd.png" width="100">
	    </p>
	  </div>
	</div>
	<hr>
    
    <div class="form-group">
      <label for="exampleSelect1">대륙</label>
      <select class="form-control" id="exampleSelect1">
        <option>1</option>
        <option>2</option>
        <option>3</option>
        <option>4</option>
        <option>5</option>
      </select>
    </div>
    <div class="form-group">
      <label for="exampleSelect2">도시</label>
		<input type="text" class="form-control" id="city" name="city" placeholder="Enter city">
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1">여행지 명</label>
      <input type="text" class="form-control" id="title" placeholder="Enter title">
    </div>
    <div class="form-group">
      <label for="exampleTextarea">Example textarea</label>
      <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
    </div>
    <fieldset class="form-group">
      <legend>Radio buttons</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
          Option one is this and that—be sure to include why it's great
        </label>
      </div>
      <div class="form-check">
      <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          Option two can be something else and selecting it will deselect option one
        </label>
      </div>
      <div class="form-check disabled">
      <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option3" disabled="">
          Option three is disabled
        </label>
      </div>
    </fieldset>
    <fieldset class="form-group">
      <legend>Checkboxes</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input class="form-check-input" type="checkbox" value="" checked="">
          Option one is this and that—be sure to include why it's great
        </label>
      </div>
      <div class="form-check disabled">
        <label class="form-check-label">
          <input class="form-check-input" type="checkbox" value="" disabled="">
          Option two is disabled
        </label>
      </div>
    </fieldset>
    <button type="submit" class="btn btn-primary">Submit</button>
  </fieldset>
</form>

</div>
</div>
</body>
</html>
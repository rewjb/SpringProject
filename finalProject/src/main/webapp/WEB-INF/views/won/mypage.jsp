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
	
	<%@ include file="mypageLeftBar.jsp" %>


      <div class="col-lg-9">
        <div>
        <legend class="display-4" style="text-align: center; font-family: 'Do Hyeon', sans-serif;">내정보 수정</legend>
        <hr style="width: 90%;">
    		<!-- 폼 전체 담아놓는 div -->
			<div style="padding-left: 5%; padding-right: 5%">
				<form id="infoForm" class="needs-validation" novalidate action="">
				<table>
					<tr style="height: 70px;">
						<td style="width: 70%;">
							<!-- column1. mid 부분 div : 수정 불가 -->
							<div class="mb-3" >
								<label for="mid"><span class="text-muted"> ID </span></label>
								<input type="text" id="mid" name="mid" class="form-control" value="" readonly="readonly">
							</div>
							<!-- column2. mname : 수정 불가 -->
							<div class="mb-2" >
								<label for="mname"><span class="text-muted"> user-name </span></label>
								<input type="text" id="mname" name="mname" class="form-control" value="" readonly="readonly">
							</div>
							<!-- column3. 프로필 사진 입력부분 -->
							<!-- 컨트롤러와 동작하는 hidden #mprofile이 있고 사용자에게 보이는부분(#inputFile, #mprofileImg)이 따로 존재함 -->
							<div class="mb-3">
								<label for="mprofile"><span class="text-muted">profile picture</span></label><br>
								<input type="file" class="form-control" id="inputFile" style="height: 45px; 
								vertical-align: middle;">
								
								<input type="hidden" id="mprofile" name="mprofile" value="" class="hidden">
							</div>
						</td>
						<td style= "vertical-align: bottom;">
							<!-- column3. 프로필 사진 미리보기 -->
							<div class="mb-3" style="text-align: center;">
								<img id="mprofileImg" style="width: 60%; height: 60%;"
									src="">
							</div>
						</td>
					</tr>
				</table>
				<br>
				<table style="width: 100%;">
					<tr>
						<td style="vertical-align: top; width: 45%; padding-right: 1%;">
							<!-- column4. mpw부분   -->
							<!-- 컨트롤러와 동작하는 hidden #mpw가 있고 사용자에게 보이는부분(#inputMpw,#cf)이 따로 존재함 -->
							<label for="password"><span class="text-muted">	PASSWORD </span></label> 
							<div class="form-group" style="width:100%;">
								<input type="text" id="inputMpw" class="form-control" required>
								<div id="feedback-mpw" class="feedback"></div>
								<input type="hidden" id="mpw" name="mpw" value="" class="hidden">
							</div>
						</td>
						<td style="vertical-align: top; width: 45%;">
							<!-- column4. mpw conform부분   -->
							<label for="password"><span class="text-muted">	CONFIRM </span></label>
							<div class="form-group" style="width:100%;">
								<input type="text" id="cf" class="form-control" required>
								<div id="feedback-cf" class="feedback"></div>
							</div>
						</td>
					</tr>
				</table>
				
				<!-- 기본정보 : 필수입력 / 추가정보 : 선택입력 구분해주는 선-->
				<br><hr class="mb-4" style="">

				<!-- column5.전화번호 입력부분 -->
				<table><tr>
					<td style="width: 40%; height: 100px; vertical-align: top;">
						<div class="form-group">
							<label for="mtel"><span class="text-muted">phone</span></label> 
							<input type="text" id="mtel"name="mtel" class="form-control" 
							placeholder="01012345678" value="">
							<div id="feedback-tel" class="feedback"></div>
						</div>
					</td>
					<td></td>
				</tr></table>
				
				<!-- column6,column7. 주소 입력부분 1,2 -->
				<div class="mb-3">
					<label for="address"><span class="text-muted">Address</span></label> 
					<input type="text" id="maddr1" name="maddr1" class="form-control" 
					placeholder="서울시 금천구 벚꽃로 244" value="">
				</div>
				<div class="mb-3">
					<input type="text" id="maddr2" name="maddr2" class="form-control" 
					placeholder="벽산디지털밸리 5차" value="">
				</div>
				
				<br><hr class="mb-4">
				
				<div class="row">
					<!-- column8. 성별선택 -->
					<div class="col-md-6 mb-3">
						<div class="d-block my-3">
							<label for="gender"><span class="text-muted">gender</span></label>
							<select class="custom-select d-block w-100" id="genderSelector" style="width: 100px;">
								<option value="OTHER">OTHER</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select>
							<input type="hidden" id="gender" name="gender" value="${memberDTO.gender}" class="hidden">
						</div>
					</div>
					<!-- column9. 연령대 -->
					<div class="col-md-6 mb-3">
						<div class="d-block my-3">
							<label for="ageGroup"><span class="text-muted">ageGroup</span></label>
							<select class="custom-select d-block w-100" id="agegroupSelector" style="width: 100px;">
								<option value="10s">10대</option>
								<option value="20s" selected="selected">20대</option>
								<option value="30s">30대</option>
								<option value="40s">40대</option>
								<option value="50s">50대</option>
								<option value="60s">60대</option>
								<option value="70s">70대</option>
								<option value="80s">80대 이상</option>
							</select>
							<input type="hidden" id="agegroup" name="agegroup" value="" class="hidden">
						</div>
					</div>
				</div>
				

				<hr class="mb-4"><br>
				
				<!-- column10. 최근 로그인한 날자 -->
				<input type="hidden" name="rdate" value="" class="hidden">
				
				<!-- 수정 / 삭제 버튼 -->
				<div class="row">
					<div class="col-md-6 mb-3" style="text-align: left;">
						<button class="btn btn-primary btn-lg btn-block" 
						id="updateBtn" name="updateBtn" type="button">수정</button>
					</div>
					<div class="col-md-6 mb-3" style="text-align: right;">
						<button class="btn btn-primary btn-lg btn-block" 
						id="deleteBtn" name="deleteBtn" type="button">삭제</button>
					</div>
				</div>
			</form>
			<!-- 아래쪽 공간 만들기 위한 div -->
			<div style="height: 80px;"></div>
		</div>
      </div>
    </div>
  </div>
  <!-- /.container -->
</div>
  <!-- footer -->
<%@ include file="/UserMainFooter.jsp"%>

</body>

</html>

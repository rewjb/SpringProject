<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sign-in</title>
<!-- header -->
<%@ include file="/UserMainHeader.jsp"%>
<script type="text/javascript">
	
</script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	
	<div class="container">
		<!-- 전체 div -->
		<div class="container" style="display: inline-block;">
			<!-- 폼 전체 담아놓는 div -->
			<div style="padding-left: 15%; padding-right: 15%">
				<!-- 위쪽 공간 만들기 위한 div -->
				<div style="height: 60px;"></div>
				<h4 class="mb-3" style="vertical-align:text-bottom;">Sign-up</h4>
				<!-- 공간 만들기 위한 div -->
				<div style="height: 40px;"></div>
				<form class="needs-validation" novalidate action="insertMember.do">
					<!-- column1. mid 부분 div -->
					<div class="mb-3">
						<label for="email">ID <span class="text-muted"></span></label>
						<input type="email" class="form-control" name="mid"	placeholder="you@example.com" required="required">
						<div class="invalid-feedback">Please enter a valid email address for shipping updates.</div>
					</div>
					
					<!-- column2. mpw부분   -->
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="password">PASSWORD</label> 
							<input type="password" class="form-control" id="password" name="mpw" required="required">
								<!-- 유효성 검사 -->
								<div class="invalid-feedback">TOO SHORT.</div>
								<div class="invalid-feedback">TOO SIMPLE.</div>
								<div class="invalid-feedback">SAME YOUR IMFOMATION.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="passwordC">CONFIRM</label> 
							<input type="password" class="form-control" id="passwordC" required="required">
							<!-- whn  - 클래스 명 새로 해서 동작 넣어주기 -->
							<div class="invalid-feedback">DIFFERENT</div>
						</div>
					</div>

					<!-- column3. mname -->
					<div class="mb-3">
						<label for="username">user-name</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">＠</span>
							</div>
							<input type="text" class="form-control" name="mname" placeholder="Username" required="required">
							<div class="invalid-feedback" style="width: 100%;">Your user-name is required.</div>
						</div>
					</div>
					
					<!-- column4. 프로필 사진 입력부분 -->
					<div class="mb-3">
						<label for="pPicture">profile picture<span class="text-muted"></span></label> 
						<input type="text" class="form-control" name="mprofile" placeholder="your profile picture" style="height: 45px">
						<div class="invalid-feedback">사진입력</div>
					</div>
					
					<!-- 기본정보 : 필수입력 / 추가정보 : 선택입력 구분해주는 선-->
					<br><hr class="mb-4" style=""><br>
					
					<!-- column5.전화번호 입력부분 -->
					<div class="mb-3">
					<label for="tel">phone <span class="text-muted"></span></label> 
					<input type="number" class="form-control" name="mtel" placeholder="01012345678">
					<div class="invalid-feedback"></div>
					</div><br>
					
					<!-- column6,column7. 주소 입력부분 1,2 -->
					<div class="mb-3">
						<label for="address">Address</label> 
						<input type="text" class="form-control" name="maddr1" placeholder="서울시 금천구 벚꽃로 244">
					</div>
					<div class="mb-3">
						<label for="address2">Address<span class="text-muted">(Optional)</span></label>
						<input type="text" class="form-control" name="maddr2" placeholder="벽산디지털밸리 5차">
					</div><br>

					<!-- column8. 성별선택 -->
					<div class="d-block my-3">
						<label for="gender">gender</label> 
						<select class="custom-select d-block w-100" name="gender">
							<option value="other" selected="selected">other</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
						</select>
					</div><br>
					
					<!-- column9. 연령대 -->
					<div class="d-block my-3">
						<label for="ageGroup">ageGroup</label>
						<select class="custom-select d-block w-100" name="agegroup">
							<option value="10">~10대</option>
							<option value="2030" selected="selected">20~30대</option>
							<option value="4050">40~50대</option>
							<option value="6070">60~70대</option>
							<option value="80">80대~</option>
						</select>
					</div><br><br>

					<hr class="mb-4">
					
					<!-- column10. 날자 -->
					<input type="hidden" name="rdate" value="SYSDATE">

					<!-- 회원가입 버튼 -->
					<button class="btn btn-primary btn-lg btn-block" type="submit">
					Sign-up</button>
				</form>
				<!-- 아래쪽 공간 만들기 위한 div -->
				<div style="height: 80px;"></div>
			</div>
		</div>
	</div>
	<%@ include file="/UserMainFooter.jsp"%>
	
</body>
</html>

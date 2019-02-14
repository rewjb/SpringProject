<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sign-in result</title>
</head>
<body>
	<!-- header -->
	<%@ include file="/UserMainHeader.jsp"%>
	
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
					<!-- column1. mid 부분 div -->
					<div class="mb-3">
						<label for="email" style="width: 100px;">ID : </label> ${memberDTO.mid }
					</div>
					
					<!-- column2. mpw부분   -->
					<div class="row">
					</div>

					<!-- column3. mname -->
					<div class="mb-3">
						<label for="username" style="width: 100px;">user-name : </label> ${memberDTO.mname }
					</div>
					
					<!-- column4. 프로필 사진 입력부분 -->
					<div class="mb-3">
						<%-- <img src="${memberDTO.mprofile}"> --%>
					</div>
					
					<!-- column5.전화번호 입력부분 -->
					<div class="mb-3">
					<label for="tel" style="width: 100px;">phone : </label>	${memberDTO.mtel } <br>
					</div>
					
					<!-- column6,column7. 주소 입력부분 1,2 -->
					<div class="mb-3">
						<label for="address" style="width: 100px;">Address</label> 
						${memberDTO.maddr1} <br>
						${memberDTO.maddr2}
					</div><br>

					<!-- column8. 성별선택 -->
					<div class="d-block my-3">
						<label for="gender" style="width: 100px;">gender : </label> ${memberDTO.gender}
					</div><br>
					
					<!-- column9. 연령대 -->
					<div class="d-block my-3">
						<label for="ageGroup" style="width: 100px;">ageGroup : </label> ${memberDTO.agegroup }
					</div><br><br>

					<hr class="mb-4">
					
					<!-- column10. 날자 -->
					가입날짜 : ${memberDTO.rdate}

				<!-- 아래쪽 공간 만들기 위한 div -->
				<div style="height: 80px;"></div>
			</div>
		</div>
	</div>
	<%@ include file="/UserMainFooter.jsp"%>
	
</body>
</html>
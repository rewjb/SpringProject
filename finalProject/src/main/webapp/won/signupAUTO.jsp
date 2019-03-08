<!-- 멤버 데이터들 DB로 입력해주는 페이지, 사이트랑 직접적인 상관은 없음 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			alert("1");
			$("button").click(function() {
				alert("2 : button");
				$.ajax({
					url:"/springProject/resources/json/member_MOCKDATA.json",
					dataType:"json",
					success: function(result){
						alert("3 : ajax success");
						$("#h1").text("성공")
						var list = result;
						$("#h2").text("리스트 크기:"+list.length)
						$(list).each(function(index,item) {
							console.log(index);
							var mid = item.mid;				//1
							var mpw = item.mpw;				//2
							var mname = item.mname;			//3
							var mprofile = item.mprofile;	//4
							var gender = item.gender;		//5
							var maddr1 = item.maddr1;		//6
							var maddr2 = item.maddr2;		//7
							var mtel = item.mtel;			//8
							var age = item.agegroup;		//9
							var age1 = Math.floor(age/10)*10
							var agegroup = age1 + "s"
							var rdate = item.rdate;			//10
							$("#mid").val(mid); console.log(mid);
							$("#mpw").val(mpw); console.log(mpw);
							$("#mname").val(mname); console.log(mname);
							$("#mprofile").val(mprofile); console.log(mprofile);
							$("#mtel").val(mtel); console.log(mtel);
							$("#maddr1").val(maddr1); console.log(maddr1);
							$("#maddr2").val(maddr2); console.log(maddr2);
							$("#gender").val(gender); console.log(gender);
							$("#agegroup").val(agegroup); console.log(agegroup);
							$("#rdate").val(rdate); console.log(rdate);
							
							var form = $("#form").serialize();
			               
							$.ajax({
								url : "insertMember",
								type : "POST",
								data : form,
								success : function(result) {
									console.log(result+"--- 0:성공 / 1:실패");
								}//end success
							});//end ajax
							
							$("#append").append("<h6>"+mid+"-"+mpw+"-"+mname+"-"+mprofile+"-"+gender+"-"+maddr1+"-"+maddr2+"-"+mtel+"-"+agegroup+"-"+rdate+"<h6>");
							
							
						})//end list.each
					}//success function
				});//ajax
			});//click
		});//ready
	</script>
</head>
<body>
	<button>버튼</button> ☜멤버 데이터 입력<br>
	<h3 id="h1"></h3>
	<h3 id="h2"></h3>
	<h3 id="h3"></h3>
	<div>
		<form id="form">
			<input type="text" id="mid" name="mid"><br>		
			<input type="text" id="mpw" name="mpw"><br>
			<input type="text" id="mname" name="mname"><br>
			<input type="text" id="mprofile" name="mprofile"><br>
			<input type="text" id="mtel" name="mtel"><br>
			<input type="text" id="maddr1" name="maddr1"><br>
			<input type="text" id="maddr2" name="maddr2"><br>
			<input type="text" id="gender" name="gender"><br>
			<input type="text" id="agegroup" name="agegroup"><br>
			<input type="text" id="rdate" name="rdate"><br>
		</form>
	</div>
	<div id = "append">
	</div>

</body>
</html>
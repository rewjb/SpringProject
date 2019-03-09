<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
body {
line-height: 0px;
}

#div1 {
position: relative;
height:90px;
text-align: center;
vertical-align: middle;
}

#div1:after {
	background-image: url('/springProject/resources/IMAGE/sky2.jpg');
    top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.3!important;
    filter:alpha(opacity=50);
    z-index:-1;
    content:"";
    width: 100%;
    height: 100%;
    border-radius: 1.0rem;
}

.city_quickmenu .cityListLayer {
    z-index: 20;
    position: absolute;
    top: 0;
    left: 0;
    display: none;
    width: 1090px;
    background: #FFF;
    transition: all 0.3s;
}

.city_quickmenu .tourCityBox {
    margin-bottom: 0;
}

.tourCityBox h1, .tourCityBox .area {
    display: block;
    font: 500 15px/41px "Noto Sans KR";
    color: #232323;
    text-align: center;
    margin: 0 0 7px;
    background: #f7f7f7;
}

.tourCityBox .cityList {
    display: table-cell;
    width: 180px;
    padding: 0 0 13px;
    border-left: 1px solid #e5e5e5;
}

.tourCityBox .cityList:first-child {
    border-left: none;
}

/* .cityList img{
width: 70px;
height: 50px;
} */

.tourCityBox a {
    display: block;
    height: 36px;
    font: normal 14px/37px "Noto Sans KR";
    color: #232323;
    vertical-align: middle;
    padding: 0 0 0 30px;
}

.tourCityBox a img {
    width: 30px;
    margin-right: 10px;
    vertical-align: middle;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap core CSS -->
  <link href="/springProject/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/springProject/resources/bootstrap/css/modern-business.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
  <script src="/springProject/resources/bootstrap/vendor/jquery/jquery.min.js"></script>
  <script src="/springProject/resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <script type="text/javascript" src="/springProject/resources/JS/jquery.min.js"></script>
  <script type="text/javascript">
	
  	$(function() {
  		
  		$("#cityList").mouseenter(function() {
  			$("#cityList").css("display", "none");
  			$(".cityListLayer").css("display", "block");		
  		})
  		
  		$(".cityListLayer").mouseleave(function() {
  			$("#cityList").css("display", "block");
  			$(".cityListLayer").css("display", "none");		  			
  		})	  		
  	})

  </script>
</head>
<body>
<%@ include file="/UserMainHeader.jsp" %>
  
  	<!-- 메인 슬라이드 -->
    <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('/springProject/resources/IMAGE/banner1.jpg')">
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>Example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
          </div>
        </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('/springProject/resources/IMAGE/banner2.jpg')">
        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
          </div>
        </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('/springProject/resources/IMAGE/banner3.jpg')">
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>One more for good measure.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
          </div>
        </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>
  
  <div class="container marketing">
  
  <!-- 지역 리스트  -->
	  <div>
	  	<img src="/springProject/resources/IMAGE/continents.jpg" id="cityList">
	  </div>
	  
	  	<div class="cityListLayer" style="display: none;">
		<div class="tourCityBox">
			<div class="cityList">
				<span class="area">아시아</span><a
					href="http://www.tourtips.com/dest/city/1001_hongkong"
					data-id="1001" data-code="HKG" data-eng="hongkong" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_HKG.gif" alt="홍콩 국기">홍콩</a><a
					href="http://www.tourtips.com/dest/city/1008_macau" data-id="1008"
					data-code="MFM" data-eng="macau" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_MFM.gif" alt="마카오 국기">마카오</a><a
					href="http://www.tourtips.com/dest/city/1002_osaka" data-id="1002"
					data-code="OSA" data-eng="osaka" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_OSA.gif" alt="오사카 국기">오사카</a><a
					href="http://www.tourtips.com/dest/city/1003_fukuoka"
					data-id="1003" data-code="FUK" data-eng="fukuoka" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_FUK.gif" alt="후쿠오카 국기">후쿠오카</a><a
					href="http://www.tourtips.com/dest/city/1005_tokyo" data-id="1005"
					data-code="TYO" data-eng="tokyo" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_TYO.gif" alt="도쿄 국기">도쿄</a><a
					href="http://www.tourtips.com/dest/city/1051_okinawa"
					data-id="1051" data-code="OKA" data-eng="okinawa" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_OKA.gif" alt="오키나와 국기">오키나와</a><a
					href="http://www.tourtips.com/dest/city/1004_taipei" data-id="1004"
					data-code="TPE" data-eng="taipei" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_TPE.gif" alt="타이베이 국기">타이베이</a><a
					href="http://www.tourtips.com/dest/city/1034_kaohsiung"
					data-id="1034" data-code="KHH" data-eng="kaohsiung" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_KHH.gif" alt="가오슝 국기">가오슝</a><a
					href="http://www.tourtips.com/dest/city/1035_taichung"
					data-id="1035" data-code="TXG" data-eng="taichung" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_TXG.gif" alt="타이중 국기">타이중</a><a
					href="http://www.tourtips.com/dest/city/1006_beijing"
					data-id="1006" data-code="BJS" data-eng="beijing" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_BJS.gif" alt="베이징 국기">베이징</a><a
					href="http://www.tourtips.com/dest/city/1007_shanghai"
					data-id="1007" data-code="SHA" data-eng="shanghai" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_SHA.gif" alt="상하이 국기">상하이</a><a
					href="http://www.tourtips.com/dest/city/1033_qingdao"
					data-id="1033" data-code="TAO" data-eng="qingdao" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_TAO.gif" alt="칭다오 국기">칭다오</a><a
					href="http://www.tourtips.com/dest/city/1039_huangshan"
					data-id="1039" data-code="HSH" data-eng="huangshan" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_HSH.gif" alt="황산 국기">황산</a><a
					href="http://www.tourtips.com/dest/city/1045_zhangjiajie"
					data-id="1045" data-code="DYG" data-eng="zhangjiajie"
					data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_DYG.gif" alt="장가계 국기">장가계</a><a
					href="http://www.tourtips.com/dest/city/1048_xian" data-id="1048"
					data-code="SIA" data-eng="xian" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_SIA.gif" alt="서안 국기">서안</a>
			</div>
			<div class="cityList">
				<span class="area">동남아시아</span><a
					href="http://www.tourtips.com/dest/city/1009_singapore"
					data-id="1009" data-code="SIN" data-eng="singapore" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_SIN.gif" alt="싱가포르 국기">싱가포르</a><a
					href="http://www.tourtips.com/dest/city/1010_bangkok"
					data-id="1010" data-code="BKK" data-eng="bangkok" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_BKK.gif" alt="방콕 국기">방콕</a><a
					href="http://www.tourtips.com/dest/city/1013_phuket" data-id="1013"
					data-code="HKT" data-eng="phuket" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_HKT.gif" alt="푸껫 국기">푸껫</a><a
					href="http://www.tourtips.com/dest/city/1054_huahin" data-id="1054"
					data-code="HHQ" data-eng="huahin" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_HHQ.gif" alt="후아힌 국기">후아힌</a><a
					href="http://www.tourtips.com/dest/city/1012_cebu" data-id="1012"
					data-code="CEB" data-eng="cebu" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_CEB.gif" alt="세부 국기">세부</a><a
					href="http://www.tourtips.com/dest/city/1011_boracay"
					data-id="1011" data-code="KLO" data-eng="boracay" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_KLO.gif" alt="보라카이 국기">보라카이</a><a
					href="http://www.tourtips.com/dest/city/1043_manila" data-id="1043"
					data-code="MNL" data-eng="manila" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_MNL.gif" alt="마닐라 국기">마닐라</a><a
					href="http://www.tourtips.com/dest/city/1032_kotakinabalu"
					data-id="1032" data-code="BKI" data-eng="kotakinabalu"
					data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_BKI.gif"
					alt="코타 키나발루 국기">코타 키나발루</a><a
					href="http://www.tourtips.com/dest/city/1040_penang" data-id="1040"
					data-code="PEN" data-eng="penang" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_PEN.gif" alt="페낭 국기">페낭</a><a
					href="http://www.tourtips.com/dest/city/1041_kualalumpur"
					data-id="1041" data-code="KUL" data-eng="kualalumpur"
					data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_KUL.gif"
					alt="쿠알라룸푸르 국기">쿠알라룸푸르</a><a
					href="http://www.tourtips.com/dest/city/1042_laos" data-id="1042"
					data-code="LA1" data-eng="laos" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_LA1.gif" alt="라오스 국기">라오스</a><a
					href="http://www.tourtips.com/dest/city/1046_danang" data-id="1046"
					data-code="DAD" data-eng="danang" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_DAD.gif" alt="다낭 국기">다낭</a><a
					href="http://www.tourtips.com/dest/city/1049_hanoi" data-id="1049"
					data-code="HAN" data-eng="hanoi" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_HAN.gif" alt="하노이 국기">하노이</a><a
					href="http://www.tourtips.com/dest/city/1050_hochiminh"
					data-id="1050" data-code="SGN" data-eng="hochiminh" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_SGN.gif" alt="호치민 국기">호치민</a><a
					href="http://www.tourtips.com/dest/city/1055_nhatrang"
					data-id="1055" data-code="NHA" data-eng="nhatrang" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_NHA.gif" alt="나트랑 국기">나트랑</a><a
					href="http://www.tourtips.com/dest/city/1056_siemreap"
					data-id="1056" data-code="REP" data-eng="siemreap" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_REP.gif" alt="씨엠립 국기">씨엠립</a>
			</div>
			<div class="cityList">
				<span class="area">유럽</span><a
					href="http://www.tourtips.com/dest/city/1014_paris" data-id="1014"
					data-code="PAR" data-eng="paris" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_PAR.gif" alt="파리 국기">파리</a><a
					href="http://www.tourtips.com/dest/city/1015_rome" data-id="1015"
					data-code="ROM" data-eng="rome" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_ROM.gif" alt="로마 국기">로마</a><a
					href="http://www.tourtips.com/dest/city/1016_london" data-id="1016"
					data-code="LON" data-eng="london" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_LON.gif" alt="런던 국기">런던</a><a
					href="http://www.tourtips.com/dest/city/1017_barcelona"
					data-id="1017" data-code="BCN" data-eng="barcelona" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_BCN.gif" alt="바르셀로나 국기">바르셀로나</a><a
					href="http://www.tourtips.com/dest/city/1018_croatia"
					data-id="1018" data-code="HR1" data-eng="croatia" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_HR1.gif" alt="크로아티아 국기">크로아티아</a><a
					href="http://www.tourtips.com/dest/city/1019_istanbul"
					data-id="1019" data-code="IST" data-eng="istanbul" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_IST.gif" alt="이스탄불 국기">이스탄불</a><a
					href="http://www.tourtips.com/dest/city/1052_vladivostok"
					data-id="1052" data-code="VVO" data-eng="vladivostok"
					data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_VVO.gif"
					alt="블라디보스토크 국기">블라디보스토크</a>
			</div>
			<div class="cityList">
				<span class="area">미주</span><a
					href="http://www.tourtips.com/dest/city/1021_newyork"
					data-id="1021" data-code="NYC" data-eng="newyork" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_NYC.gif" alt="뉴욕 국기">뉴욕</a><a
					href="http://www.tourtips.com/dest/city/1020_hawaii" data-id="1020"
					data-code="Z01" data-eng="hawaii" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_Z01.gif" alt="하와이 국기">하와이</a><a
					href="http://www.tourtips.com/dest/city/1022_westernamerica"
					data-id="1022" data-code="Z50" data-eng="westernamerica"
					data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_Z50.gif" alt="미서부 국기">미서부</a>
			</div>
			<div class="cityList">
				<span class="area">남태평양</span><a
					href="http://www.tourtips.com/dest/city/1024_guam" data-id="1024"
					data-code="GUM" data-eng="guam" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_GUM.gif" alt="괌 국기">괌</a><a
					href="http://www.tourtips.com/dest/city/1023_sydney" data-id="1023"
					data-code="SYD" data-eng="sydney" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_SYD.gif" alt="시드니 국기">시드니</a>
			</div>
			<div class="cityList">
				<span class="area">대한민국</span><a
					href="http://www.tourtips.com/dest/city/1026_jeju" data-id="1026"
					data-code="CJU" data-eng="jeju" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_CJU.gif" alt="제주 국기">제주</a><a
					href="http://www.tourtips.com/dest/city/1027_jeonju" data-id="1027"
					data-code="A53" data-eng="jeonju" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_A53.gif" alt="전주 국기">전주</a><a
					href="http://www.tourtips.com/dest/city/1028_gyeongju"
					data-id="1028" data-code="KJO" data-eng="gyeongju" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_KJO.gif" alt="경주 국기">경주</a><a
					href="http://www.tourtips.com/dest/city/1030_suwon" data-id="1030"
					data-code="A71" data-eng="suwon" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_A71.gif" alt="수원 국기">수원</a><a
					href="http://www.tourtips.com/dest/city/1031_hwaseong"
					data-id="1031" data-code="AI2" data-eng="hwaseong" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_AI2.gif" alt="화성 국기">화성</a><a
					href="http://www.tourtips.com/dest/city/1025_ansandaebudo"
					data-id="1025" data-code="K01" data-eng="ansandaebudo"
					data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_K01.gif"
					alt="안산 · 대부도 국기">안산 · 대부도</a><a
					href="http://www.tourtips.com/dest/city/1037_busan" data-id="1037"
					data-code="PUS" data-eng="busan" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_PUS.gif" alt="부산 국기">부산</a><a
					href="http://www.tourtips.com/dest/city/1036_seoul" data-id="1036"
					data-code="SEL" data-eng="seoul" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_SEL.gif" alt="서울 국기">서울</a><a
					href="http://www.tourtips.com/dest/city/1038_gangwon"
					data-id="1038" data-code="KRG" data-eng="gangwon" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_KRG.gif" alt="강원 국기">강원</a><a
					href="http://www.tourtips.com/dest/city/1047_incheonjunggu"
					data-id="1047" data-code="K02" data-eng="incheonjunggu"
					data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_K02.gif" alt="인천 중구 국기">인천
					중구</a><a href="http://www.tourtips.com/dest/city/1053_ganghwa"
					data-id="1053" data-code="GHA" data-eng="ganghwa" data-status="L"><img
					src="//img.tourtips.com/images/cm/flag/flag_GHA.gif" alt="강화 국기">강화</a>
			</div>
		</div>
	</div>
	  	  
	  <br>
	  <div id="div1">
	  <h2 style="font-family: 'Jua', sans-serif; display: inline-block; margin-top: 27px;">인기 여행지 TOP3</h2>
	  </div>
	  
  <hr class="featurette-divider"><br>
  <div class="row featurette">
      <div class="col-md-5">
        <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
      </div>
      <div class="col-md-7">
        <!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"> -->
        <img src="/springProject/resources/IMAGE/attractionsImg/${recommend.get(0).getMainImg()}"></svg>
      </div>
    </div>
    
    <br><hr class="featurette-divider"><br>
  
  <div class="row featurette">
      <div class="col-md-5 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
      </div>
      <div class="col-md-7 order-md-1">
        <img src="/springProject/resources/IMAGE/attractionsImg/${recommend.get(1).getMainImg()}"></svg>
      </div>
    </div>
  
      <br><hr class="featurette-divider"><br>
  
    <div class="row featurette">
      <div class="col-md-5">
        <h2 class="featurette-heading">And lastly, this one.<span class="text-muted">Checkmate.</span></h2>
        <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
      </div>
      <div class="col-md-7">
        <!-- <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"> -->
        <img src="/springProject/resources/IMAGE/attractionsImg/${recommend.get(2).getMainImg()}"></svg>
      </div>
    </div>
  </div>
  
<%@ include file="/UserMainFooter.jsp" %>
</body>
</html>
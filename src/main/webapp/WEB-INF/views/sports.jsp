<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Hanalei+Fill" rel="stylesheet">
<link rel="stylesheet" href="resources/main.css">
<script>
    function fnMove(seq){
        var offset = $("#sports" + seq).offset();
        $('html, body').animate({scrollTop : offset.top}, 400)
    }
    $(document).ready(function(){
        $("li.overout").mouseover(function(){
            $(this).find("img").hide();
        })
        $("li.overout").mouseover(function(){
            $(this).find("div").show();
        })
        $("li.overout").mouseout(function(){
            $(this).find("img").show();
        })
        $("li.overout").mouseout(function(){
            $(this).find("div").hide();
        })
    });
    
    
</script>
	<title> Sports </title>
</head>

<body>
    <div id="div1">
        <div class="logo">
            <div>
                <img src="/web/resources/img/logo.png">
            </div>
        </div>
        <div class="webnm">
            <div class="first">
                <h1>M</h1>
                <p>edal</p>
                <h1>M</h1>
                <p>ap</p>
                <h1>R</h1>
                <p>educe</p>
            </div>
        </div>
        <div class="social">
            <div>
                <img src="/web/resources/img/facebook.png">
                <img src="/web/resources/img/instagram.png">
                <img src="/web/resources/img/twitter.png">
                <img src="/web/resources/img/youtube.png">
            </div>
        </div>
    </div>
    <div id="menubar">
        <ul>
            <li><a href="/web/mmr">Home</a></li>
            <li><a href="/web/sports">Sports</a></li>
            <li><a href="/web/mapreduce">MapReudce</a></li>
        </ul>
    </div>
    <div class="sports_menu">
        <ul>
            <li onclick="fnMove('1')" style="margin-right: 10px;">SUMMER SPORTS</li>
            <li>|</li>
            <li onclick="fnMove('2')" style="margin-left: 10px;">WINTER SPORTS</li>
        </ul>
    </div>
    <div id="sports1">
        <h2 style="text-align: center; padding-bottom: 30px;">SUMMER SPORTS</h2>
        <ul>
            <li class="overout"><img src="/web/resources/img/sports/ARCHERY.png"><div>양궁</div></li>
            <li class="overout"><img src="/web/resources/img/sports/ATHLETICE.png"><div>육상</div></li>
            <li class="overout"><img src="/web/resources/img/sports/BADMINTON.png"><div>배드민턴</div></li>
            <li class="overout"><img src="/web/resources/img/sports/BASKETBALL.png"><div>농구</div></li>
            <li class="overout"><img src="/web/resources/img/sports/BEACH%20VOLLEYBALL.png"><div>비치발리볼</div></li>
            <li class="overout"><img src="/web/resources/img/sports/BOXING.png"><div>복싱</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CANOE%20SLALOM.png"><div>카누슬라롬</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CANOE%20SPRINT.png"><div>카누스프린트</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CYCLING%20BMX.png"><div>사이클링</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CYCLING%20MOUNTAIN%20BIKE.png"><div>산악자전거</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CYCLING%20ROAD.png"><div>자전거도로</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CYCLING%20TRACK.png"><div>사이클링트랙</div></li>
            <li class="overout"><img src="/web/resources/img/sports/DIVING.png"><div>다이빙</div></li>
            <li class="overout"><img src="/web/resources/img/sports/EQUESTRIAN%20DRESSAGE.png"><div>승마/조마</div></li>
            <li class="overout"><img src="/web/resources/img/sports/EQUESTRIAN%20EVENTING.png"><div>승마경기</div></li>
            <li class="overout"><img src="/web/resources/img/sports/EQUESTRIAN%20JUMPING.png"><div>승마점프</div></li>
            <li class="overout"><img src="/web/resources/img/sports/FENCING.png"><div>펜싱</div></li>
            <li class="overout"><img src="/web/resources/img/sports/FOOTBALL.png"><div>축구</div></li>
            <li class="overout"><img src="/web/resources/img/sports/GOLF.png"><div>골프</div></li>
            <li class="overout"><img src="/web/resources/img/sports/GYMNASTICS%20ARTISTIC.png"><div>기계체조</div></li>
            <li class="overout"><img src="/web/resources/img/sports/GYMNASTICS%20RHYTHMIC.png"><div>리듬체조</div></li>
            <li class="overout"><img src="/web/resources/img/sports/HANDBALL.png"><div>핸드볼</div></li>
            <li class="overout"><img src="/web/resources/img/sports/HOCKEY.png"><div>하키</div></li>
            <li class="overout"><img src="/web/resources/img/sports/JUDO.png"><div>유도</div></li>
            <li class="overout"><img src="/web/resources/img/sports/MARATHON%20SWIMMING.png"><div>마라톤수영</div></li>
            <li class="overout"><img src="/web/resources/img/sports/MODERN%20PENTATHLON.png"><div>근대5종경기</div></li>
            <li class="overout"><img src="/web/resources/img/sports/ROWING.png"><div>조정</div></li>
            <li class="overout"><img src="/web/resources/img/sports/RUGBY.png"><div>럭비</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SAILING.png"><div>세일링</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SHOOTING.png"><div>사격</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SWIMMING.png"><div>수영</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SYNCHRONIZED%20SWIMMING.png"><div>싱크로나이즈</div></li>
            <li class="overout"><img src="/web/resources/img/sports/TABLE%20TENNIS.png"><div>탁구</div></li>
            <li class="overout"><img src="/web/resources/img/sports/TAEKWONDO.png"><div>태권도</div></li>
            <li class="overout"><img src="/web/resources/img/sports/TENNIS.png"><div>테니스</div></li>
            <li class="overout"><img src="/web/resources/img/sports/TRAMPOLINE.png"><div>트램폴린</div></li>
            <li class="overout"><img src="/web/resources/img/sports/TRIATHLON.png"><div>철인3종경기</div></li>
            <li class="overout"><img src="/web/resources/img/sports/VOLLEYBALL.png"><div>배구</div></li>
            <li class="overout"><img src="/web/resources/img/sports/WATER%20POLO.png"><div>수구</div></li>
            <li class="overout"><img src="/web/resources/img/sports/WEIGHTLIFTING.png"><div>역도</div></li>
            <li class="overout"><img src="/web/resources/img/sports/WRESTLING%20FREESTYLE.png"><div>레슬링자유형</div></li>
            <li class="overout"><img src="/web/resources/img/sports/WRESTLING%20FREESTYLE.png"><div>그레코로만</div></li>
        </ul>
    </div>
    <hr style="padding: 30px 0px;">
    <div id="sports2">
        <h2 style="text-align: center; padding-bottom: 30px;">WINTER SPORTS</h2>
        <ul>
            <li class="overout"><img src="/web/resources/img/sports/ALPINE%20SKING.png"><div>알파인스키</div></li>
            <li class="overout"><img src="/web/resources/img/sports/BIATHLON.png"><div>바이애슬론</div></li>
            <li class="overout"><img src="/web/resources/img/sports/BOBSLEIGH.png"><div>봅슬레이</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CROSS%20COUNTRY%20SKIING.png"><div>크로스컨트리</div></li>
            <li class="overout"><img src="/web/resources/img/sports/CURLING.png"><div>컬링</div></li>
            <li class="overout"><img src="/web/resources/img/sports/FIGURE%20SKATING.png"><div>피겨스케이팅</div></li>
            <li class="overout"><img src="/web/resources/img/sports/FREESTYLE%20SKIING.png"><div>프리스타일스키</div></li>
            <li class="overout"><img src="/web/resources/img/sports/ICE%20HOCKEY.png"><div>아이스하키</div></li>
            <li class="overout"><img src="/web/resources/img/sports/LUGE.png"><div>루지</div></li>
            <li class="overout"><img src="/web/resources/img/sports/NORDIC%20COMBINED.png"><div>노르딕복합</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SHORT%20TRACK%20SPEED%20SKATING.png"><div>쇼트트랙</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SKELETON.png"><div>스켈레톤</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SKI%20JUMPING.png"><div>스키점프</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SNOWBOARD.png"><div>스노보드</div></li>
            <li class="overout"><img src="/web/resources/img/sports/SPEED%20SKATING.png"><div>스피드스케이팅</div></li>
        </ul>
    </div>
    <footer>
        <div class="width_100 height_150" style="background: #333; padding-left: 20%;">
            <div class="footer_img">
                <img src="/web/resources/img/logo-90.png">
            </div>
            <div class="footer_font">
                MMR : 조원희   서울시 금천구 가산디지털2로 115, 811호<br>
            </div>
            <div class="footer_font">
            대표번호 : 010-4902-5657 | E-mail : wjh7492@naver.com
            </div>
        </div>
    </footer>
</body>
</html>
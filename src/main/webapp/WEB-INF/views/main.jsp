<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
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
    $(document).ready(function(){
       var imgs;
        var img_count;
        var img_position = 1;
        
        imgs = $(".slide ul");
        img_count = imgs.children().length;
        
        //버튼을 클릭했을 때 함수 실행
        
        $("#back").click(function(){
           back(); 
        });
        $("#next").click(function(){
           next(); 
        });
        
        function back(){
            if(1<img_position){
                imgs.animate({
                   left:'+=1320px' 
                });
                img_position--;
            }
        }
        function next(){
            if(img_count>img_position){
                imgs.animate({
                    left:`-=1320px`
                });
                img_position++;
            }
        }
    });
</script>
<title> MMR </title>
</head>
<body>
    <div id="div1">
        <div class="logo">
            <div>
                <img src="resources/img/logo.png">
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
            <li><a href="/web/mapreduce">MapReduce</a></li>
        </ul>
    </div>
    <div id="div2">
        <div class="subject" style="padding-left: 190px; padding-top: 30px;">
            OLYMPIC GAMES
        </div>
        <img id="back" src="/web/resources/img/left3.png" alt="" width="50">
        <div class="slide">
            <ul>
                <li><img src="/web/resources/img/poster/1896.jpg"></li>
                <li><img src="/web/resources/img/poster/1900.jpg"></li>
                <li><img src="/web/resources/img/poster/1904.jpg"></li>
                <li><img src="/web/resources/img/poster/1908.jpg"></li>
                <li><img src="/web/resources/img/poster/1912.jpg"></li>
                <li><img src="/web/resources/img/poster/1920.jpg"></li>
                <li><img src="/web/resources/img/poster/1924.jpg"></li>
                <li><img src="/web/resources/img/poster/1928.jpg"></li>
                <li><img src="/web/resources/img/poster/1932.jpg"></li>
                <li><img src="/web/resources/img/poster/1936.jpg"></li>
                <li><img src="/web/resources/img/poster/1948.jpg"></li>
                <li><img src="/web/resources/img/poster/1952.jpg"></li>
                <li><img src="/web/resources/img/poster/1956.jpg"></li>
                <li><img src="/web/resources/img/poster/1960.jpg"></li>
                <li><img src="/web/resources/img/poster/1964.jpg"></li>
                <li><img src="/web/resources/img/poster/1968.jpg"></li>
                <li><img src="/web/resources/img/poster/1972.jpg"></li>
                <li><img src="/web/resources/img/poster/1976.jpg"></li>
                <li><img src="/web/resources/img/poster/1980.jpg"></li>
                <li><img src="/web/resources/img/poster/1984.jpg"></li>
                <li><img src="/web/resources/img/poster/1988.jpg"></li>
                <li><img src="/web/resources/img/poster/1992.jpg"></li>
                <li><img src="/web/resources/img/poster/1996.jpg"></li>
                <li><img src="/web/resources/img/poster/2000.jpg"></li>
                <li><img src="/web/resources/img/poster/2004.jpg"></li>
                <li><img src="/web/resources/img/poster/2008.jpg"></li>
            </ul>
            <ul id="top250">
                <li><h5>ATHENS 1896</h5></li>
                <li><h5>PARIS 1900</h5></li>
                <li><h5>ST LOUIS 1904</h5></li>
                <li><h5>LONDON 1908</h5></li>
                <li><h5>STOCKHOLM 1912</h5></li>
                <li><h5>ANTWERP 1920</h5></li>
                <li><h5>PARIS 1924</h5></li>
                <li><h5>AMSTERDAM 1928</h5></li>
                <li><h5>LOS ANGELES 1932</h5></li>
                <li><h5>BERLIN 1936</h5></li>
                <li><h5>LONDON 1948</h5></li>
                <li><h5>HELSINKI 1952</h5></li>
                <li><h5>MELBOURNE 1956</h5></li>
                <li><h5>ROME 1960</h5></li>
                <li><h5>TOKYO 1964</h5></li>
                <li><h5>MEXICO 1968</h5></li>
                <li><h5>MUNICH 1972</h5></li>
                <li><h5>MONTREAL 1976</h5></li>
                <li><h5>MOSCOW 1980</h5></li>
                <li><h5>LOS ANGELES 1984</h5></li>
                <li><h5>SEOUL 1988</h5></li>
                <li><h5>BARCELONA 1992</h5></li>
                <li><h5>ATLANTA 1996</h5></li>
                <li><h5>SYDNEY 2000</h5></li>
                <li><h5>ATHENS 2004</h5></li>
                <li><h5>BEIJING 2008</h5></li>
            </ul>
        </div>
        <img id="next" src="/web/resources/img/right3.png" alt="" width="50">
    </div>
    <hr>
    <div>
        <div class="subject" style="padding-left: 190px; padding-top: 30px; padding-bottom: 30px;">
            OLYMPIC VIDEO
        </div>
        <div style="background-color: #eef0f1; width: 100%; height: 600px;">
            <ul class="height_100 width_80 dis_in_block margin_left10 padding_top50 ta_center">
                <li class="float_left dis_in_block ta_left height_100 margin_right1" style="background-color: white; width: 35%; left: 0;">
                    <div class="width_100 height_50 dis_in_block">
                        <video width="100%" height="300px" controls>
                          <source src="/web/resources/video/1.mp4" type="video/mp4">
                        </video>
                    </div>
                    <div class="width_100 height_50">
                        <div class="contants">
                            <div class="bold">
10 Impressive moments in 2016 Rio Olympic Games</div>
                        </div>
                    </div>
                </li>
                <li class="float_left dis_in_block ta_left height_100 margin_right1" style="background-color: white; width: 30%">
                    <div class="width_100 height_50">
                        <video width="100%" height="250px" controls>
                          <source src="/web/resources/video/part1.mp4" type="video/mp4">
                        </video>
                    </div>
                    <div class="width_100 height_50">
                        <div class="contants">
                            <div class="bold" style="margin-top: 25px;">2018 PyeongChang Winter Olympic Medal Winning moment of glory Part 1</div>
                        </div>
                    </div>
                </li>
                <li class="float_left dis_in_block ta_left height_100 margin_right1" style="background-color: white; width: 30%">
                    <div class="width_100 height_50">
                        <video width="100%" height="250px" controls>
                          <source src="/web/resources/video/part2.mp4" type="video/mp4">
                        </video>
                    </div>
                    <div class="width_100 height_50">
                        <div class="contants">
                            <div class="bold" style="margin-top: 25px;">2018 PyeongChang Winter Olympic Medal Winning moment of glory Part 2</div>

                        </div>
                    </div>
                </li>
            </ul>
        </div>
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
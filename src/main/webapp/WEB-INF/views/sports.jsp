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
    	
    	sportList("/sumList","#sports1 ul", "#sports1 ul li");
    	sportList("/winList","#sports2 ul", "#sports2 ul li");
		
		function sportList(listurl, ul, li){
			$.ajax({
				type:"post",
				url: listurl
			}).done(function(data){
				var j = JSON.parse(data);
				var result = j.result;
				$.each(result,function(key,value){
					$(ul).append("<li class='overout'><a href='#layer2' class='btn-example'><img src=" + value.imgurl + "><div>" + value.title + "</div></a></li>");
				});
				$('.btn-example').click(function(){
			        var $href = $(this).attr('href');
			        layer_popup($href);
			    });
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
		        });
		        $(li).on("click", function(){
		        	var number = $(this).index();
		        	if(li=="#sports1 ul li"){
		        		var index = number + 1		        		
		        	}else if(li=="#sports2 ul li"){
		        		var index = number + 43	
		        	}
		        	$.ajax({
		    			type:"post",
		    			url:"/contents",
		    			data: {"index" : index}
		    		}).done(function(data){
		    			var i = JSON.parse(data);
		    			var result = i.result;
		    			
		    			
		    			$("#contents").append("<p class='ctxt mb20'><h3>" + result.title + "</h3><br>" + result.content + "</p>")
		    		});
		        	$("#sports1 li a").bind('click', false);
		        	$("#sports2 li a").bind('click', false);
		        	
		        });
			});
	        $("#facebook").on("click", function(){
	        	location.href="https://www.facebook.com/olympics//"
	        });
	        $("#instagram").on("click", function(){
	        	location.href="https://www.instagram.com/olympic/"
	        });
	        $("#twitter").on("click", function(){
	        	location.href="https://twitter.com/olympiko"
	        });
	        $("#youtube").on("click", function(){
	        	location.href="https://www.youtube.com/results?search_query=%EC%98%AC%EB%A6%BC%ED%94%BD"
	        });
    	}
		
	    function layer_popup(el){

	        var $el = $(el);        //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn-layerClose').click(function(){
	            isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });
	        $("#btn_close").on("click", function(){
	        	$("#contents").text("");
	        	$("#sports1 li a").unbind('click', false);
	        	$("#sports2 li a").unbind('click', false);
	        });


	    }
	    
	    
	    
    });  //다큐먼트 레디 끝
    
    
</script>
	<title> Sports </title>
</head>

<body>
    <div id="div1">
        <div class="logo">
            <div>
                <img src="/resources/img/logo.png">
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
                <img id="facebook" src="/resources/img/facebook.png">
                <img id="instagram" src="/resources/img/instagram.png">
                <img id="twitter" src="/resources/img/twitter.png">
                <img id="youtube" src="/resources/img/youtube.png">
            </div>
        </div>
    </div>
    <div id="menubar">
        <ul>
            <li><a href="/">홈</a></li>
            <li><a href="/sports">스포츠</a></li>
            <li><a href="/mapreduce">분석</a></li>
        </ul>
    </div>
    <div class="sports_menu">
        <ul>
            <li onclick="fnMove('1')" style="margin-right: 10px;">SUMMER SPORTS</li>
            <li>|</li>
            <li onclick="fnMove('2')" style="margin-left: 10px;">WINTER SPORTS</li>
        </ul>
    </div>
	<div class="dim-layer">
	    <div class="dimBg"></div>
	    <div id="layer2" class="pop-layer">
	        <div class="pop-container">
	            <div id="contents" class="pop-conts">
	                <!--content //-->
	
	               
	                <!--// content-->
	            </div>
	             <div class="btn-r">
	                    <a id="btn_close" href="#" class="btn-layerClose">Close</a>
	             </div>
	        </div>
	    </div>
	</div>
    <div id="sports1">
        <h2 style="text-align: center; padding-bottom: 30px;">SUMMER SPORTS</h2>
        <ul>
        </ul>
    </div>
    <hr style="padding: 30px 0px;">
    <div id="sports2">
        <h2 style="text-align: center; padding-bottom: 30px;">WINTER SPORTS</h2>
        <ul>
        </ul>
    </div>
    <footer>
        <div class="width_100 height_150 padding50" style="background: #333; padding-left: 20%;">
            <div class="footer_img">
                <img src="/resources/img/logo-90.png">
            </div>
            <div class="footer_font">
                MMR : 조원희   서울시 금천구 가산디지털2로 115, 811호<br>
            </div>
            <div class="footer_font">
            	전화번호 : 010-4902-5657 | E-mail : wjh7492@naver.com
            </div>
        </div>
    </footer>
</body>
</html>
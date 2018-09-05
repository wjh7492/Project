<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Hanalei+Fill" rel="stylesheet">
<link rel="stylesheet" href="resources/main.css">
<script type="text/javascript" src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/pie.js"></script>
<script>
	var viewList = [{dataURL: "/eis/getData/google",
		options: {'title': 'copy'},
		containerId :'body'}];
    $(document).ready(function(){
    	$.ajax({
    		  type: "get",
    		  url: "/dir",
    		  data: {"number" : 1}
    		}).done(function(data) {
    			var result = data.result;
    			$.each(result,function(key,value){
    				$("#dataList").prepend("<li><button type='button' class='btn1' value='"+ value.key +"'>" + value.type + "</button></li>");
    			});
    			$("#datalist li button").on("click", function(){
    				$("#step2").fadeIn();
    				
    				$("#bar_div").css("width", "25%");
    				$("#bar_div").html("25%");
    				var choice = $(this).val();
    				$.ajax({
    					type: "post",
    					url: "/click",
    					data: {"choice": choice}
    				}).done(function(data){
    					var Y = data.Ylist;
    					var C = data.Clist;
    					var A = data.Alist;
    					var M = data.Mlist;
						$("#selectY").empty();
						$("#selectC").empty();
						$("#selectA").empty();
						$("#selectM").empty();
    					$.each(Y, function(key, value){
   							$("#selectY").append("<option>" + value.value + "</option>");
    					});
    					$.each(C, function(key, value){
   							$("#selectC").append("<option>" + value.value + "</option>")
    					});
    					$.each(A, function(key, value){
   							$("#selectA").append("<option>" + value.value + "</option>")
    					});
    					$.each(M, function(key, value){
   							$("#selectM").append("<option>" + value.value + "</option>")
    					});
    				});
    				$("#ct").off().on("click", function(){
    					$("#step3").fadeIn("slow");
    					$("#selectC").hide();
    					$("#selectA").show();
    					$("#selectM").show();
    					var choice1 = $(this).text();
    					
    					$("#bar_div").css("width", "50%");
        				$("#bar_div").html("50%");
        				
        				
	    				Mapreduce(choice, choice1);
        				
    				});
    				$("#at").off().on("click", function(){
    					$("#step3").fadeIn("slow");
    					$("#selectA").hide();
    					$("#selectC").show();
    					$("#selectM").show();
    					var choice1 = $(this).text();
    					
    					
    					$("#bar_div").css("width", "50%");
        				$("#bar_div").html("50%");
        				
	    				Mapreduce(choice, choice1);
        				
    				});
    				$("#md").off().on("click", function(){
    					$("#step3").fadeIn("slow");
    					$("#selectM").hide();
    					$("#selectA").show();
    					$("#selectC").show();
    					var choice1 = $(this).text();
    					
    					
    					$("#bar_div").css("width", "50%");
        				$("#bar_div").html("50%");
        				
	    				Mapreduce(choice, choice1);
        				
    				});
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
        
    	 function parseData(data){
             for(var i =0; i < data.length; i++){
                data[i]["1"] = parseInt(data[i]["1"]);
             }
          }
         $(window).on("load", function() {    
       	     $('#loading').hide();  
  	    });
    	
    
    
    	function Mapreduce(choice, choice1){
    		$("#select").off().on("click", function(){
				$("#loading").show();
				
				$("#bar_div").css("width", "75%");
				$("#bar_div").html("75%");
				
				var selectY = $("#selectY").val();
				var selectC = $("#selectC").val();
				var selectA = $("#selectA").val();
				var selectM = $("#selectM").val();
				
				$.ajax({
					type:"post",
					url:"/cm",
					data:{"selectY": selectY,
						"selectC": selectC,
						"selectA": selectA,
						"selectM": selectM,
						"choice": choice,
						"choice1": choice1}
				}).done(function(data){
					$("#bar_div").css("width", "100%");
					$("#bar_div").html("100%");
					var saveDir = data.saveDir;
					$.ajax({
						type: "post",
						url: "/drawing",
						data: {"chart": saveDir}
					}).done(function(data){
						var d = data.resultList;
						parseData(d);
						if(d["0"]["0"] ==""){
							$("#loading").hide();
							$("#chart_body").hide();
							alert("메달을 획득하지 못했습니다");
						}else{
							$("#loading").hide();  
			    	     	   AmCharts.makeChart("chart_body",
			    	   				{
			    	   					"type": "pie",
			    	   					"angle": 22.5,
			    	   					"balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
			    	   					"depth3D": 20,
			    	   					"titleField": "0",
			    	   					"valueField": "1",
			    	   					"allLabels": [],
			    	   					"balloon": {},
			    	   					"legend": {
			    	   						"enabled": true,
			    	   						"align": "center",
			    	   						"markerType": "circle"
			    	   					},
			    	   					"titles": [{"text" : "메달", "size" : 30}],
			    	   					"dataProvider": d
			    	   				}
			    	   			);
						}
					});  //2
					$("#chart_body").fadeIn(2000);
					$("#step4").show();
					
				}); //1
				
			});
    		$("#reset").on("click", function(){
    			$("#step2").hide();
    			$("#step3").hide();
    			$("#chart_body").hide();
    		});
    	}
    });
</script>
	<title> MapReduce </title>
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
	<div id="wrap1">
        <div id="wrap2">
            <div id="wrap3">
	            <div style="text-align: center;">
	            <h2>올림픽 메달 분석</h2>
	            </div>
                <div id="step1" style="padding-top: 70px; text-align: center;">
                    <ul id="dataList">
			        </ul>
                </div>
                <div id="step2">
                    <ul id="choiceList">
                        <li><button type="button" id="ct">나라</button></li>
                        <li><button type="button" id="at">종목</button></li>
                        <li><button type="button" id="md">메달</button></li>
                    </ul>
                </div>
                <div id="step3">
                    <select id=selectY>
                    </select>
                    <select id=selectC>
                    </select>
                    <select id=selectA>
                    </select>
                    <select id=selectM>
                    </select>
                    <button type="button" id="select">분석</button>
                    <button type="button" id="reset">초기화</button>
                </div>
            </div>
            <div id="step4">
            <div>
            	<h2>분석차트</h2>
            </div>
                <div id="chart_body"></div>
            </div>
        </div>
    </div>
    
    <div id="loading" style="display: none;"><img id="loading-image" src="/resources/img/loading.gif" alt="Loading..." /></div>
    <footer>
        <div class="width_100 height_150 padding50" style="background: #333; padding-left: 20%; float:left;">
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
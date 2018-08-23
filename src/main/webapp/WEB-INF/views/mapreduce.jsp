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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Hanalei+Fill" rel="stylesheet">
<link rel="stylesheet" href="resources/main.css">
<script>
	var viewList = [{dataURL: "/eis/getData/google",
		options: {'title': 'copy'},
		containerId :'body'}];
    $(document).ready(function(){
    	$.ajax({
    		  type: "get",
    		  url: "/web/dir",
    		  data: {"number" : 1}
    		}).done(function(data) {
    			var result = data.result;
    			$.each(result,function(key,value){
    				console.log(key)
    				$.each(value,function(key,value){
    					console.log(value);
    					$("#dataList").append("<li><button type='button' class='btn1'>" + key + "</button></li>")    					
    				});
    			});
    			$("#datalist li button").on("click", function(){
    				$("#step2").show();
    				
    				$("#bar_div").css("width", "25%");
    				$("#bar_div").html("25%");
    				var choice = $(this).text();
    				$.ajax({
    					type: "post",
    					url: "/web/click",
    					data: {"choice": choice}
    				}).done(function(data){
    					console.log(data);
    					var Y = data.Ylist;
    					var C = data.Clist;
    					var A = data.Alist;
    					var M = data.Mlist;
    					$.each(Y, function(key, value){
    						$.each(value, function(key, value){
    							$("#selectY").append("<option>" + value + "</option>")
    						});
    					});
    					$.each(C, function(key, value){
    						$.each(value, function(key, value){
    							$("#selectC").append("<option>" + value + "</option>")
    						});
    					});
    					$.each(A, function(key, value){
    						$.each(value, function(key, value){
    							$("#selectA").append("<option>" + value + "</option>")
    						});
    					});
    					$.each(M, function(key, value){
    						$.each(value, function(key, value){
    							$("#selectM").append("<option>" + value + "</option>")
    						});
    					});
    				});
    				$("#ct").off().on("click", function(){
    					$("#step3").show();
    					$("#selectC").hide();
    					$("#selectA").show();
    					$("#selectM").show();
    					var choice1 = $(this).text();
    					console.log(choice);
    					
    					
    					$("#bar_div").css("width", "50%");
        				$("#bar_div").html("50%");
        				
	    				Mapreduce(choice, choice1);
        				
    				});
    				$("#at").off().on("click", function(){
    					$("#step3").show();
    					$("#selectA").hide();
    					$("#selectC").show();
    					$("#selectM").show();
    					var choice1 = $(this).text();
    					
    					
    					$("#bar_div").css("width", "50%");
        				$("#bar_div").html("50%");
        				
	    				Mapreduce(choice, choice1);
        				
    				});
    				$("#md").off().on("click", function(){
    					$("#step3").show();
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
    
    
    	function Mapreduce(choice, choice1){
    		$("#select").off().on("click", function(){
				$("#step4").show();
				
				$("#bar_div").css("width", "75%");
				$("#bar_div").html("75%");
				
				var selectY = $("#selectY").val();
				var selectC = $("#selectC").val();
				var selectA = $("#selectA").val();
				var selectM = $("#selectM").val();
				
				$.ajax({
					type:"post",
					url:"/web/cm",
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
						url: "/web/drawing",
						data: {"chart": saveDir}
					}).done(function(data){
						var chart = data.resultList;
						google.charts.load('current', {'packages':['corechart']});
					    google.charts.setOnLoadCallback(drawChart);
				      	function drawChart() {
				        	var chartData = new google.visualization.DataTable();

				        	chartData.addColumn("string", "UniqueCarrier");
				    		chartData.addColumn("number", "Medal");

				    		$.each(chart, function(index, value) {
				    			var row = [];
				    			for(var i = 0; i < 2; i++){
				    				row[i] = (i != 0) ? Number(value[i]) : value[i];
				    			}
				    			chartData.addRows([ row ]);
				    		});

				    		var option = {
					   			    chartType: 'PieChart',
					   			 	dataTable: chartData,
					   			    options: {title: 'Distance', is3D: true},
					   			    containerId : 'chart_body'
					   			  };

				    		var wrapper = new google.visualization.ChartWrapper(option);
				    		wrapper.draw();
					      }
					});
				});
				
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
            <li><a href="/web/mapreduce">MapReduce</a></li>
        </ul>
    </div>
	<div id="wrap">
		<h1>올림픽 메달 시각화</h1>
		<div id="step1">
			<h3>항공사 데이터 목록</h3>
			<ul id="dataList">
			</ul>
			<hr>
		</div>
		<div id="step2">
			<h3>분석 종류</h3>
			<!-- 버튼를 클릭 시 step1에서 선택한 파일를 MapReduce 처리 하기 -->
            <ul id="choiceList">
                <li><button type="button" class="btn1" id="ct">나라</button></li>
                <li><button type="button" class="btn1" id="at">종목</button></li>
                <li><button type="button" class="btn1" id="md">메달</button></li>
            </ul>
			<hr>
		</div>
        <div id="step3">
			<h3>분석 상세분류</h3>
			<!-- 버튼를 클릭 시 step1에서 선택한 파일를 MapReduce 처리 하기 -->
			<select id=selectY>
            </select>
            <select id=selectC>
            </select>
            <select id=selectA>
            </select>
            <select id=selectM>
            </select>
            <button id=select>분석</button>
			<hr>
		</div>
		<div id="step4">
			<h3>분석 결과</h3>
			<div id="chart_body">PieChart 영역</div>
			<hr>
		</div>
		<div id="step5">
			<!-- 프로젝트 "resources/upload/" 경로에 현재 시간 이름으로 이미지 저장 -->
			<button type="button" class="btn1" id="img">이미지 저장</button>
			<!-- 선택된 내용을 모두 초기화 하고 step1번 내용만 다시 보여주기 (step2 ~ step5는 화면 숨기기) -->
			<button type="button" class="btn1" id="default">초기화</button>
			<hr>
		</div>
		<h3>분석 진행률</h3>
		<div id="bar_body">
			<div id="bar_div">0%</div>
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
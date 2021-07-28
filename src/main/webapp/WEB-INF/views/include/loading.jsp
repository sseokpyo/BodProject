<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<style>
 .loader { 
  	position: absolute; 
  	left: 50%; top: 50%; 
  	z-index: 1; 
  	width: 150px; 
  	height: 150px; 
  	margin: -75px 0 0 -75px; 
  	border: 16px solid #f3f3f3; 
  	border-radius: 50%; 
  	border-top: 16px solid #3498db; 
  	width: 120px; 
  	height: 120px; 
  	-webkit-animation: spin 2s linear infinite; 
  	animation: spin 2s linear infinite; 
  	} 
  	
  	@-webkit-keyframes spin { 
  		0% { 
  		-webkit-transform: rotate(0deg); 
  		} 
  		100% { 
  			-webkit-transform: rotate(360deg); 
  		} 
  	} 
  	
  	@keyframes spin { 
  		0% { 
  			transform: rotate(0deg); 
  		} 
  		
  		100% { 
  			transform: rotate(360deg); 
  		} 
  	}
</style>
</head>
<body>
<div class="loader"> </div>
<h1>사진파일 업로드 중입니다..</h1>
</body>
<script type="text/javascript">

$(document).ready(function(){
	$.ajax({
		type : "get",
		url : "uploadtime",
		dataType : "json",
		data : {"filename" : '${filename}'},
		success : function(result){
			console.log(result);
			var gcode = '${param.gcode}';
			if(result == "exist"){
				if(gcode != ''){
					setTimeout(function(){
						location.href="moveGroupPage?gcode="+'${param.gcode}';					
					}, 1000);
				}else{
					setTimeout(function(){
						location.href="boardList";					
					}, 1000);					
				}
			}
		}
	});
});


</script>
</html>
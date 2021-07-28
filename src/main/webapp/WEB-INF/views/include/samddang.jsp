<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 신고모달 -->
	<%@ include file="../include/SearchHashTagModal.jsp"%>
    <style>
    	.OIcon{
    		margin-bottom:4px;
    	}
    	.OIcon:hover{
    		cursor:pointer;
    	}
    	.iconBar{
    		display:none;
    		height:30px;
    		width:100px;
    		border-bottom:3px solid #95AECB;
    		border-right:3px solid #95AECB;
    		border-radius:0px 10px;
 	 		text-align:center;
 	 		line-height:30px;
 	 		background-color:white;
 	 		position:absolute;
 	 		margin-bottom:5px;
    	}
    </style>	
    	
<!-- 삼땡이 -->
	<div style="position:fixed; bottom:30px; right:20px; width:155px;">
 	<%--  <a class="samDdang" href="#"><img src="${pageContext.request.contextPath}/resources/assets/images/up_ssam.png" 
 	 style="width:35px; height:auto; padding-bottom:8px;"></a><br>
 	 <a class="samDdang" href="#"><img src="${pageContext.request.contextPath}/resources/assets/images/chat_ssam.png" 
 	 style="width:35px; height:auto; padding-bottom:8px; "></a><br>
 	 <a class="samDdang" href="#"><img src="${pageContext.request.contextPath}/resources/assets/images/write_ssam.png" 
 	 style="width:35px; height:auto;"></a><br> --%>
 	 <div class="iconBar" id="textBox">
 	 <span id="iconText" style="color:#80A1C2; font-weight:bold;"></span>
 	 </div>
 	 <div style="float:right;">
 	 	<span class="fa-stack fa-lg OIcon" id="upIcon" onclick="location.href='#'" >
  		<i class="fa fa-circle fa-stack-2x" style="color:#95AECB;"></i>
  		<i class="fas fa-arrow-up fa-stack-1x fa-inverse"></i>
	 </span><br>
	 <span class="fa-stack fa-lg OIcon" id="chatIcon" onclick="moveChat('${sessionScope.loginId}')" >
  		<i class="fa fa-circle fa-stack-2x" style="color:#95AECB;"></i>
  		<i class="fas fa-comments fa-stack-1x fa-inverse"></i>
	 </span><br>
	 <span class="fa-stack fa-lg OIcon" id="writeIcon" onclick="location.href='moveBoardWriteForm'" >
  		<i class="fa fa-circle fa-stack-2x" style="color:#95AECB;"></i>
  		<i class="fas fa-edit fa-stack-1x fa-inverse"></i>
	 </span><br>
 	 <span class="fa-stack fa-lg OIcon" id="searchIcon" class="" onclick="searchTagOpen()">
  		<i class="fa fa-circle fa-stack-2x" style="color:#95AECB;"></i>
  		<i class="fas fa-search fa-stack-1x fa-inverse"></i>
	 </span>
  	 </div>
  	</div>
  	
  	
  	<script type="text/javascript">
  		$("#upIcon").hover(function(){
  			$("#textBox").css("display","inline-block").css("margin-top","3px");
  			$("#iconText").html("맨위로");
  		},function(){
  			$("#textBox").css("display","none");
  		});
  	
  		$("#chatIcon").hover(function(){
  			$("#textBox").css("display","inline-block").css("margin-top","50px");
  			$("#iconText").html("채팅");
  		},function(){
  			$("#textBox").css("display","none");
  		});
  		
  		$("#writeIcon").hover(function(){
  			$("#textBox").css("display","inline-block").css("margin-top","90px");
  			$("#iconText").html("글쓰기");
  		},function(){
  			$("#textBox").css("display","none");
  		});
  		
  		$("#searchIcon").hover(function(){
  			$("#textBox").css("display","inline-block").css("margin-top","135px");
  			$("#iconText").html("검색");
  		},function(){
  			$("#textBox").css("display","none");
  		});
  		function moveChat(userId){
  			console.log('moveChat 실행 userId : ' + userId);  			
  			location.href = "moveChat?userId=" + userId;
  		}
  	</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 신고 모달창 -->
 
	<div id="mask"></div>

    <!--Popup Start -->
    <div id="layerbox" class="layerpop"
        style="width: 400px; height: 300px;">
        <article class="layerpop_area">
        <div class="title">신고</div>
        <div class="content" style="text-align:center;">
        <p style="font-size:10px;">지적 재산권 침해를 신고하는 경우를 제외하고<br> 회원님의 신고는 익명으로 처리됩니다.</p>
		<input type="hidden" id="reporter" name="reporter" value="${sessionScope.loginId }">
		<input type="hidden" id=reportTarget name="reporttarget" >
		<textarea rows="5" cols="40" name="reason" id="reason"></textarea><br>
		<button type="button" class="reportBtn report" onclick="reportRequest()">신고</button>
    	<button type="button" class="reportBtn layerpop_close" onclick="popupClose()">취소</button>
        </div>
        </article>
    </div>
<!-- 신고 모달창 종료 -->
   
<script>

function wrapWindowByMask() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height(); 
    var maskWidth = $(window).width();

    //문서영역의 크기 
    console.log( "document 사이즈:"+ $(document).width() + "*" + $(document).height()); 
    //브라우저에서 문서가 보여지는 영역의 크기
    console.log( "window 사이즈:"+ $(window).width() + "*" + $(window).height());        

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask').css({
        'width' : maskWidth,
        'height' : maskHeight
    });

    //애니메이션 효과
    //$('#mask').fadeIn(1000);      
    $('#mask').fadeTo("slow", 0.5);
}

function popupOpen() {
    $('.layerpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.layerpop').css("top",(($(window).height() - $('.layerpop').outerHeight()) / 3) + $(window).scrollTop());
    $('.layerpop').css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
    $('.layerpop').draggable();
    $('#layerbox').show();
}

function popupClose() {
    $('#layerbox').hide();
    $('#mask').hide();
}

function openReport(bcode) {
	 
	$("#reason").val("");
	
	//신고 대상
	 $("#reportTarget").val(bcode);


    popupOpen(); //레이어 팝업창 오픈 
    wrapWindowByMask(); //화면 마스크 효과 
}

function reportRequest(){
	if($("#reason").val() == ""){
		alert("신고 사유를 적어주세요.");
		$("#reason").focus();
		
	}else{
		//신고처리 
		var reporter = $("#reporter").val();
		var reason = $("#reason").val();
		var reporttarget = $("#reportTarget").val();
		
		$.ajax({
			type : "post",
			url : "report",
			data : { "reporter" : reporter,
				     "reason" : reason,
				     "reporttarget" : reporttarget },
			async : false,
			success : function(result){
				console.log(result)
				if(result == "O"){
					alert("신고되었습니다.");
				}else{
					alert("이미 신고요청되었습니다.");
				}
			}
		});
		
		   $('#layerbox').hide();
		   $('#mask').hide();
           return false;
		
	}
}



</script>
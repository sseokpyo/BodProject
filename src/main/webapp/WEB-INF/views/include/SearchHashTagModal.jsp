<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 신고 모달창 -->
 
	<div id="mask2"></div>

    <!--Popup Start -->
    <div id="hashTagbox" class="tagpop" id="tagpop"
        style="width: 600px; height: 400px;" >
        <article class="tagpop_area">
        <div class="title"><i class="fas fa-search fa-lg"></i> 태그 검색</div>
        <div class="content" style="text-align:center;"><br>
        <input type="text" id="searchTag" placeholder="#태그 검색...">
		<a class="tagModal-close" href="#Redirect" onclick="tagPopupClose()"><i class="fas fa-times"></i></a>
		<ul id="tagListArea">
		
        </ul>
        </div>
        </article>
    </div>
<!-- 신고 모달창 종료 -->
   
<script>

function wrapWindowByMask2() {
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height(); 
    var maskWidth = $(window).width();

    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $('#mask2').css({
        'width' : maskWidth,
        'height' : maskHeight
    });

    //애니메이션 효과
    //$('#mask').fadeIn(1000);      
    $('#mask2').fadeTo("slow", 0.5);
}

function tagPopupOpen() {
    $('.tagpop').css("position", "absolute");
    //영역 가운에데 레이어를 뛰우기 위해 위치 계산 
    $('.tagpop').css("top",(($(window).height() - $('.tagpop').outerHeight()) / 3) + $(window).scrollTop());
    $('.tagpop').css("left",(($(window).width() - $('.tagpop').outerWidth()) / 2) + $(window).scrollLeft());
    $('.tagpop').draggable();
    $('#hashTagbox').show();
}

function tagPopupClose() {
    $('#hashTagbox').hide();
    $('#mask2').hide();
}

function searchTagOpen() {

	$("#searchTag").val("");
	$("#tagListArea").html("");
    tagPopupOpen(); //레이어 팝업창 오픈 
    wrapWindowByMask2(); //화면 마스크 효과 
}

$("#searchTag").keyup(function(){
	var inputText = "#"+$("#searchTag").val();
	var output = "";
	$.ajax({
		type : "post",
		url : "searchHashTag",
		data : { "searchTag" : inputText },
		dataType : "json",
		async:false,
		success : function(tagList){
			for(var i in tagList){
				output += "<li><div id='tagCircle' onclick='moveHashTag(\""+tagList[i].tagname+"\")'>";
				output += "<span style='font-size:16px; font-weight:500;'>"+tagList[i].tagname+" </span>";
				output += "<span style='font-size:12px;'> 전체 게시글수: "+tagList[i].tagnum+"</span></div>";
				output += "</li>";
			}
		}
	});
	$("#tagListArea").html(output);
	
	if($("#searchTag").val() == ""){
		output = "";
		$("#tagListArea").html(output);
	}
});
	
	function moveHashTag(tagname){
		var reTag = tagname.replace(/\#/g,'');
		
		location.href="moveTagBoardList?tagname="+reTag;
	}



</script>
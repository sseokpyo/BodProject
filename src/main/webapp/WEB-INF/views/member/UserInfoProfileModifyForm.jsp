<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Material Able bootstrap admin template by Codedthemes</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    
    <!-- Favicon icon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
    
    
    <!-- elen -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/animate.css">   
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/elen/css/style.css">

	<!-- 다음 api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
	
	<script>
		//성별에 따라 선택되어 있도록
		var mgender = "${memberInfo.mgender}"
		if(mgender == "여자"){
				$("input:radio[name='mgender']:radio[value='여자']").prop("checked", true); 
			}else if(mgender == "남자"){
				$("input:radio[name='mgender']:radio[value='남자']").prop("checked", true); 
			}
	</script>
</head>

<body>
<body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="loader-track">
            <div class="preloader-wrapper">
                <div class="spinner-layer spinner-blue">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
                <div class="spinner-layer spinner-red">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>

                <div class="spinner-layer spinner-yellow">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>

                <div class="spinner-layer spinner-green">
                    <div class="circle-clipper left">
                        <div class="circle"></div>
                    </div>
                    <div class="gap-patch">
                        <div class="circle"></div>
                    </div>
                    <div class="circle-clipper right">
                        <div class="circle"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded" style="font-family: 'InfinitySans-RegularA1';">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
            <%@include file="../include/Topbar.jsp" %>

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    
                    <%@ include file="../include/Sidebar.jsp" %>

					<div id="colorlib-page">		
						<div id="colorlib-main">
							<section class="ftco-section">
							<form action="userInfoModify" method="post" enctype="multipart/form-data" onsubmit="return modifyCheck()">
								<div class="container" >
									<div class="row" style="margin-bottom:5px;">
									<h3 style="padding:5px; color:#777; border-left:5px solid #B1C763; font-weight:500;">&nbsp;프로필 수정</h3>
									</div>
									<div class="row">
									<!-- 프로필 수정 폼 시작 -->
									<div class="col-lg-8 formdiv" >
									<div class="row modifyForm">
									
									<!-- sns프로필 : 사진, 닉네임 -->
									<div class="col-sm-4 ">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">프로필 사진</span><br>
                                			<img class="img-radius mCS_img_loaded " id="profileImg" src="${memberInfo.mprofile}" alt="User-Profile-Image"
											style="width:150px; height:150px; margin:15px; margin-left:30px;">
									   </div>
									 </div>
									<div class="col-sm-8 " >
										<div class="form-group form-primary" style=" margin-top:15px;">
                                    		<input type="file" name="mfile"  id="input-file" class="form-control" style="font-size:14px; display:none ">
                                    		<label class="mofiBtn" for="input-file" style="width:150px; line-height:35px;">프로필 사진 변경</label><br>
                                    		<input type="hidden" name="mprofile" id="mprofile" value="${memberInfo.mprofile}"> 
                                    		
                                    		<span style="font-size:14px; margin-top:10px;">닉네임</span>
                                            <input type="text" id="mnick" name="mnick" class="form-control" value="${memberInfo.mnick }">
                                            <span style="font-size:12px" id="checkNickMsg"></span>
                                		</div>
                                	</div>
                                	
                                    <div class="col-sm-12 m-b-10">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">아이디</span>
                                    		<input type="text" name="mid" class="form-control" readonly value="${memberInfo.mid }">
                                		</div>
                                	</div>
                                	 <div class="col-sm-9 m-b-10">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">기존 비밀번호</span>
                                            <input type="password"  id="mpw" class="form-control">
                                            <span style="font-size:12px" id="checkPwMsg">기존 비밀번호를 입력해주세요. (영문/숫자 4~12자) </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-3 m-b-10">
                                    	<div class="form-group form-primary">
                                        	<button class="mofiBtn" type="button" onclick="mpwCheck(${memberInfo.mpw})">비밀번호 확인</button>
                                    	</div>
                                    </div>
                                     <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary">
                                            <span class="form-bar">새 비밀번호</span>
                                            <input type="password"  id="newMpw" class="form-control">
                                            <span style="font-size:12px" id="MPWcheckText"> *영문/숫자 4~12자</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary">
                                            <span class="form-bar">새 비밀번호 확인</span>
                                            <input type="password"  id="MPWcheck" class="form-control">
                                            <span style="font-size:12px" id="MPWcheckText2" >*영문/숫자 4~12자 </span>
                                        </div>
                                    </div>
                                   
                                    <div class="col-sm-12 m-b-10">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">이름</span>
                                            <input type="text" name="mname" class="form-control" value="${memberInfo.mname}">
                                        </div>
                                    </div>
                                   
                                    <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">생년월일</span>
                                            <input type="date" name="mbirth" class="form-control" style="font-size:14px;" value="${memberInfo.mbirth}">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary" style="margin-bottom:0px; border-bottom: 1px solid rgba(0,0,0,.125);">
                                            <span style="font-size:14px;">성별</span><br>
                                            <label style="margin-top:15px;"><input type="radio" name="mgender" value="남자"/>남자 &nbsp;</label>
                                            <label><input type="radio" name="mgender" value="여자"/>여자</label>
                                        </div>
                                    </div>
                                	 <div class="col-sm-12 m-b-10">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">전화번호(-빼고 입력)</span>
                                    		<input type="text" name="mphone" id="mphone" class="form-control" value="${memberInfo.mphone}">
                                		</div>
                                	</div>
                                	
                                	<div class="col-sm-9 m-b-10">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">주소</span>
                                    		<input type="text" name="maddr" id="maddr" class="form-control" readonly value="${memberInfo.maddr}">
                                		</div>
                                	</div>
                                	<div class="col-sm-3 m-b-10">
                                		<button class="mofiBtn" type="button" id="addrModi" onclick="addrBtn()" >주소 수정</button>
                                		<button class="mofiBtn" type="button" style="display:none; width:60px " id="addrOk" onclick="addrModify()" >확인</button>
                                		<button class="mofiBtn" type="button" style="display:none; width:60px " id="addrNo" onclick="addrModifyCancle()" >취소</button>
                                	</div>
                                	
                                
                                	<!-- 주소 api -->
                                	<div class="row" id="daumApiArea" style="margin-left:auto; margin-right:auto; display:none;">
                                	<div class="col-sm-9 ">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">우편번호</span>
                                           	<input type="text" id="sample6_postcode" class="form-control">
                                           	<span class="form-bar"></span>
                                    		<label class="float-label"></label>
                                    	</div>
                                    </div>
                                    <div class="col-sm-3">
                        					<input type="button" class="mofiBtn" onclick="sample6_execDaumPostcode()" style='border: 1px solid rgba(0,0,0,.125);' value="우편번호 찾기"><br>
                        			</div>
                        			<div class="col-sm-12">
                        				<div class="form-group form-primary">
                        					<span style="font-size:14px;">주소</span>
                        					<input type="text" id="sample6_address" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>	
									</div>		
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<span style="font-size:14px;">상세주소</span>
											<input type="text" id="sample6_detailAddress" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<span style="font-size:14px;">참고항목</span>
											<input type="text" id="sample6_extraAddress" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>
									</div>
									</div>
                                   <!-- 주소 api끝 -->
                                   
                                	<div class="col-sm-12" style="text-align:center;">
                                	<br>
                                	<button class="groupBtn2" style="height:50px; font-size:14px;">정보수정</button>
                                	</div>
                                	
                                </div>
                                
									</div>
									<!-- 프로필 수정폼 종료 -->
									    		
									</div>
								</div>
								</form>
							</section>
									    
						</div><!-- END COLORLIB-MAIN -->
					</div><!-- END COLORLIB-PAGE -->
	     

    
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery-migrate-3.0.1.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/popper.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/bootstrap.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.easing.1.3.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.waypoints.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.stellar.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/owl.carousel.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.magnific-popup.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/aos.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.animateNumber.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/bootstrap-datepicker.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.timepicker.min.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/scrollax.min.js"></script>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/google-map.js"></script>
					<script src="${pageContext.request.contextPath}/resources/elen/js/main.js"></script>
            	</div>
        	</div>
    	</div>
	</div>
            
    
    <!-- Required Jquery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery/jquery.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
    <!-- waves js -->
    <script src="${pageContext.request.contextPath}/resources/assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- slimscroll js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.mCustomScrollbar.concat.min.js "></script>

    <!-- menu js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/pcoded.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/vertical/vertical-layout.min.js "></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/script.js "></script>
	
  	
</body>
	<!-- 주소 껐다켰다! -->
	<script type="text/javascript">
	
	$(document).ready(function(){
		var sel_file;
		$("#input-file").on("change",handleImgFileSelect);

		var pring = $("#checkPwMsg").val()
		
	});
	
		//화면 변경 js
	    function handleImgFileSelect(e){
	       var files =  e.target.files;
	       var filesArr = Array.prototype.slice.call(files);
	       
	       filesArr.forEach(function(f){
	          
	       sel_file = f;
	       
	       var reader = new FileReader();
	       reader.onload =  function(e){
	          $("#profileImg").attr("src", e.target.result);
	       }
	       reader.readAsDataURL(f);
	          
	       });
		}
	       
		function addrBtn(){
			$("#addrModi").css("display","none");
			$("#addrOk").css("display","");
			$("#addrNo").css("display","");
			$("#daumApiArea").css("display","");
			$("#maddr").val("");
		}
		
		function addrModify(){
			$("#addrOk").css("display","none");
			$("#addrNo").css("display","none");
			$("#addrModi").css("display","");
			
			var maddr = $("#sample6_postcode").val()+" "+$("#sample6_address").val()+" "+$("#sample6_detailAddress").val()+ " "+$("#sample6_extraAddress").val();
			$("#maddr").val(maddr);
			
			$("#daumApiArea").css("display","none");
		}
		
		function addrModifyCancle(){
			$("#addrOk").css("display","none");
			$("#addrNo").css("display","none");
			$("#daumApiArea").css("display","none");
			$("#addrModi").css("display","");
			$("#maddr").val("${memberInfo.maddr}");
		}
		
		
		/* 다음 API함수 */
		function sample6_execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수

		            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }

		            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		            if(data.userSelectedType === 'R'){
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraAddr !== ''){
		                    extraAddr = ' (' + extraAddr + ')';
		                }
		                // 조합된 참고항목을 해당 필드에 넣는다.
		                document.getElementById("sample6_extraAddress").value = extraAddr;
		            
		            } else {
		                document.getElementById("sample6_extraAddress").value = '';
		            }

		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('sample6_postcode').value = data.zonecode;
		            document.getElementById("sample6_address").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById("sample6_detailAddress").focus();
		        }
		    }).open();
			}
		
		
		
		
		//닉네임 확인 
		$("#mnick").keyup(function(){
			var newNick = $("#mnick").val();
			var mNick = "${memberInfo.mnick}";
			
			if( newNick == mNick ){
				$("#checkNickMsg").text("기존 닉네임 사용");
			}else{
				$.ajax({
					type : "get",
					url : "MNICKcheck",
					data : { "inputMNICK" : newNick },
					async : false,
					success : function(checkReuslt){
						if(checkReuslt =="OK"){
							$("#checkNickMsg").css("color" , "green").html("사용가능한 닉네임입니다.");
						} else {
							$("#checkNickMsg").css("color" , "red").html("중복된 닉네임입니다.");
						}
					}
				});
			}
		});
		
		 /*새 비밀번호 확인 */		
		 $("#newMpw").keyup(function(){
               var inputMPW = $("#newMpw").val();
             	
               if($("#mpw").val() == "" ){
            	   alert("기존 비밀번호를 확인해주세요.");
            	   $("#mpw").focus();
               }else{
	               if(newMpw.length == 0) {
	                   $("#MPWcheckText").css("color" , "red").html("비밀번호를 입력해주세요.");
	               } else if(inputMPW.length < 4 || inputMPW.length > 12) {
	                   $("#MPWcheckText").css("color", "red").html("비밀번호는 4~12자리 입니다.");
	               } else if(inputMPW.length >= 4 && inputMPW.length <= 12) {
	                   $("#MPWcheckText").css("color", "blue").html("사용가능한 비밀번호입니다.");
	               }
               }
           });
		 
		 /*새 비밀번호 2차 확인 */
           $("#MPWcheck").keyup(function(){
        	   
        	   if($("#mpw").val() == "" ){
            	   alert("기존 비밀번호를 확인해주세요.");
            	   $("#mpw").focus();
        	   }else if($("#newMpw").val() == "" ){
        		   alert("새 비밀번호를 입력해 주세요.");
        		   $("#MPWcheck").val("");
            	   $("#newMpw").focus();
        	   }else{
	               var MPWcheck = $("#MPWcheck").val();
	               if($("#newMpw").val() == MPWcheck) {
	                   $("#MPWcheckText2").css("color" , "blue").html("일치합니다.");
	               }else if($("#newMpw").val() != MPWcheck) {
	                   $("#MPWcheckText2").css("color" , "red").html("새 비밀번호 확인을 해주세요.");
	               }else {
	            	   $("#MPWcheckText2").css("color" , "red").html("새 비밀번호 확인을 해주세요.");
	               }
        	   }	   
           });
	    
       	
   		//기존 비밀번호 확인
   		function mpwCheck(memPw){
   			if($("#mpw").val() == memPw ){
   				$("#checkPwMsg").text("비밀번호 확인 완료.").css("color","green");
   			}else{
   				$("#checkPwMsg").text("기존 비밀번호가 틀렸습니다.").css("color","red");
   				$("#mpw").val(""); 
   			}
   			return false;
   		}
   		
   	//공백 확인
		function modifyCheck(){
			if($("#mnick").val() == ""){
				alert("닉네임을 입력해 주세요.");
				$("#mnick").focus();
				return false;
			}else if($("#mpw").val() == ""){
				alert("기존비밀번호를 입력해주세요.");
				$("#mpw").focus();
				return false;
			}else if($("#mphone").val() == ""){
				alert("전화번호를 입력해 주세요.");
				$("#mphone").focus();
				return false;
			}else{
				//확인 끝
				
				//비밀번호 name속성
				if( $("#MPWcheck").val() != "" ){
					$("#newMpw").attr("name","mpw");
				}else{
					$("#mpw").attr("name","mpw");
				}
				
			return true;
			}
		}
	    
	</script>



</html>

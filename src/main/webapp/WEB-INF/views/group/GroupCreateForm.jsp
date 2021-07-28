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
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">
            <%@include file="../include/Topbar.jsp" %>

            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                    
                    <%@ include file="../include/Sidebar.jsp" %>

					<div id="colorlib-page">		
						<div id="colorlib-main">
							<section class="ftco-section">
								<div class="container" >
									<div class="row" style="margin-bottom:5px;">
									<h3 style="padding:5px; color:#777; border-left:5px solid #80A1C2; font-weight:500;">&nbsp;그룹 생성</h3>
									</div>
									
									<form action="groupCreate" method="post" onsubmit="return newGroup()" enctype="multipart/form-data" >
										<input type="hidden" name="gmanager" value="${sessionScope.loginId}">
									
									<div class="row">
									<!-- 프로필 수정 폼 시작 -->
									<div class="col-lg-8 formdiv" >
									<div class="row modifyForm">
									
									<!-- sns프로필 : 사진, 닉네임 -->
									<div class="col-sm-4">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">그룹 프로필 사진</span><br>
                                			<img class="img-radius mCS_img_loaded " src="${pageContext.request.contextPath}/resources/uploadImg/groupProfile/groupProfile.jpg" alt="User-Profile-Image"
											style="width:150px; height:150px; margin:15px; margin-left:30px; object-fit: cover;" id="gprofile">
									   </div>
									 </div>
									<div class="col-sm-8" >
										<div class="form-group form-primary" style=" margin-top:15px;">
                                    		<input type="file" name="gprofileUpload"  id="input-file" class="form-control" style="font-size:14px; display:none ">
                                    		<label class="mofiBtn" for="input-file" style="width:150px; line-height:35px;" id="profileBtn">프로필 사진</label><br>
                                    		
                                    		<span style="font-size:14px; margin-top:10px;">그룹 명</span>
                                            <input type="text" id="gname" name="gname" class="form-control">
                                            <span style="font-size:12px" id="checkGnameMsg">*그룹명은 2~20자로 지정해주세요.</span>
                                		</div>
                                	</div>
                                	
                                    <div class="col-sm-12">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">소개글</span>
                                    		<input type="text" name="ginfo" id="ginfo" class="form-control" >
                                		</div>
                                	</div>
                                   
                                	<div class="col-sm-12" style="text-align:center;">
                                	<br>
                                	<button class="groupBtn2" style="height:50px; font-size:14px;">그룹 생성</button>
                                	</div>
                                	
                                </div>
                                
									</div>
									<!-- 프로필 수정폼 종료 -->
									    		
									</div>
									</form>
								</div>
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
	<script>
		$(document).ready(function(){
			//화면 프로필 사진 변경
			var sel_file;
			$("#input-file").on("change",handleImgFileSelect);
			
			
			//그룹명 중복처리 기능
			$("#gname").keyup(function(){
				var inputGname = $("#gname").val();
				if(inputGname.length < 2 || inputGname.length > 20){
					console.log("글씨제한 걸림");
					$("#checkGnameMsg").text("*그룹명은 2~20자로 지정해주세요.").css("color", "red");
				}else{
					$.ajax({
						type : "get",
						url : "checkGname",
						data : { "inputGname" : inputGname },
						dataType : "json",
						async:false,
						success : function(checkResult){
							console.log(checkResult);
							if(checkResult == ""){
								$("#checkGnameMsg").text("*사용 가능한 그룹명 입니다.").css("color", "green");
							}else{
								$("#checkGnameMsg").text("*이미 사용중인 그룹명 입니다.").css("color", "red");
							}
						}
					});
				}
			});
		});
		
		//화면 변경 js
		function handleImgFileSelect(e){
			var files =  e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload =  function(e){
				$("#gprofile").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
				
				
			});
		}
		
	
		//그룹명 공백 처리
		function newGroup(){
			
			console.log("하이요");
			var checkGname = $("#gname").val();
			var checkGinfo = $("#ginfo").val();
			 if( checkGname == "" ){
				alert("그룹명을 작성해주세요.");
				$("#gname").focus();
				return false;
			}else if(checkGname.length < 2 || checkGname.length > 20){
				alert("그룹명은 2~20자로 지정해주세요.");
				$("#gname").focus();
				return false;
			}else if(checkGinfo.length > 2000 ){
				alert("그룹소개글은 2000자로 이내로 작성해주세요.");
				$("#gname").focus();
				return false;
			}else if( $("#checkGnameMsg").text() == "*이미 사용중인 그룹명 입니다."){
				alert("이미 사용중인 그룹명입니다. \n그룹명을 변경해 주세요.");
				return false;
			}else{
				return true;
			}
		}
</script>


</html>

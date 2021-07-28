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
								<div class="container">
									<div class="row">
									
									 <!-- 타임라인 시작 -->
									 <div class="col-lg-8">
										<div class="row">
										<h3 style="padding:5px; color:#777; border-left:5px solid #B1C763; font-weight:500;">&nbsp;My Group</h3>
										<button class="mofiBtn" style=" margin:10px 0px 0px 440px; float:right; disply:inline-box;
										width:120px; height:40px; background-color:#B1C763; color:white; font-weight:500;" 
										onclick="location.href='moveGroupCreateForm'">
										<i class="fas fa-plus"></i>&nbsp;그룹생성</button>	
									
										<div class="col-md-12" style=" height:80px;  background-color:white; margin-bottom:30px;">
											<form class="form-material">
			                                    <div class="form-group form-primary" style="top:14px; margin:0px; ">
			                                        <input type="text" name="searchGroup" id="searchGroup" class="form-control">
			                                        <span class="form-bar"></span>
			                                        <label class="float-label"><i class="fa fa-search m-r-10"></i>Search Group</label>
			                                    </div>
			                                </form>
										</div>
										
										<div id="groupListArea" style="width:720px;">
										<c:forEach items="${mygroup}" var="mygroup">
												<div class='col-md-12 groupHeader' style='position:relative; border: 1px solid rgba(0,0,0,.125); height:130px; margin-bottom:20px;'>
												<div class='author mb-2 d-flex align-items-center' style='margin:10px; margin-bottom:0px;' >
												<img class='img-radius mCS_img_loaded ' src='${pageContext.request.contextPath}/resources/uploadImg/groupProfile/${mygroup.gprofile};' 
													alt='User-Profile-Image' style='width:80px; height:80px; margin:15px;'>
												<div class='info' style='height:70px; width:400px;'>	
												<a href="#" onclick="moveGroupPage('${mygroup.gcode}')"><span style='font-size:18px; font-weight:bold; color:#333333;'>${mygroup.gname}</span></a>
												<span style='font-size:12px; margin-left:8px;' id='guserNum'>회원수 : ${mygroup.gusernum}</span>
												<p style='font-size:14px; color:#4d4d4d;'>${mygroup.ginfo}</p>
												</div>
												<button class='mofiBtn' style=' margin:0px 0px 10px 30px;'onclick="moveGroupPage('${mygroup.gcode}')">페이지로 이동</button>
												</div>
												</div>
										</c:forEach>
										
										</div>
											
										</div>
									</div>
									    		
									    		
									<!-- 타임라인 종료 -->
									<%@ include file="../include/ReportModal.jsp" %>
									</div>
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

	<%@ include file="../include/samddang.jsp" %>
  	
</body>
	<script>
	 
	$(document).ready(function(){
		
		//검색
		$("#searchGroup").keyup(function(){
			var output2 = "";
			
			var searchWord = $("#searchGroup").val();
			console.log(searchWord);
			$("#groupListArea").html(""); 
			$.ajax({
				type : "get",
				url : "searchGroup",
				data : { "searchWord" : searchWord },
				dataType : "json",
				async:false,
				success : function(searchGroupList){
					for(var i in searchGroupList){
						output2 += "<div class='col-md-12 groupHeader' style='position:relative; border: 1px solid rgba(0,0,0,.125); height:130px; margin-bottom:20px;'>";
						output2 += "<div class='author mb-2 d-flex align-items-center' style='margin:10px; margin-bottom:0px;' >";
						output2 += "<img class='img-radius mCS_img_loaded ' src='${pageContext.request.contextPath}/resources/uploadImg/groupProfile/"+searchGroupList[i].gprofile;
						output2 += "' alt='User-Profile-Image' style='width:80px; height:80px; margin:15px;'>";;
						output2 += "<div class='info' style='height:70px; width:400px;'>";
						output2 += "<a href='#' onclick='moveGroupPage(\""+searchGroupList[i].gcode+"\")' ><span style='font-size:18px; font-weight:bold; color:#333333;'>"+searchGroupList[i].gname+"</span></a>";
						output2 += "<span style='font-size:12px; margin-left:8px;' id='guserNum'> 회원수 : "+searchGroupList[i].gusernum+"</span>";
						output2 += "<p style='font-size:14px; color:#4d4d4d;'>"+searchGroupList[i].ginfo+"</p>";
						output2 += "</div>";
						output2 += "<button class='mofiBtn' style=' margin:0px 0px 10px 30px;' onclick='moveGroupPage(\""+searchGroupList[i].gcode+"\")'>페이지로 이동</button>";
						output2 += "</div>";
						output2 += "</div>";
					}
				}
			});
			$("#groupListArea").html(output2);
			
		});
	 });
	 
	//그룹 페이지로 이동 (아이디로 변경)
	 function moveGroupPage(gcode){
		location.href="moveGroupPage?gcode="+gcode;
	 }
	
	
	 
	</script>


</html>

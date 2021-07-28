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
    <meta name="author" content="Codedthemes" />
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
    
    
    <!-- elen.css -->
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
    <script src="https://kit.fontawesome.com/f3520ad06d.js" crossorigin="anonymous"></script>
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
										
											
											<section class="ftco-section">
									    	<div class="container">

									    		<div class="row" style="margin: 0 0 0 20%;">
									    		<div class="col-lg-12">
									    		<div class="row" style="margin-bottom:5px;">
													<h3 style="padding:5px; color:#777; border-left:5px solid #B1C763; font-weight:500;">&nbsp;그룹 목록</h3>
												</div>
									    		<div class="card" style="border:none;">
		                                            <div class="card-block table-border-style">
		                                                <div class="table-responsive">
		                                                    <table class="table table-hover" style="text-align: center">
		                                                        <thead>
		                                                            <tr>
							                                        	<th>그룹프로필사진</th>
							                                            <th>그룹명</th>
							                                            <th>그룹소개글</th>
							                                            <th>그룹관리자닉네임</th>
							                                            <th>삭제처리</th>
							                                        </tr>
		                                                        </thead>
		                                                        <tbody>
		                                                           <tr>
																		<td>${group.gprofile }</td>
																		<td>${group.gname }</td>
																		<td><a href="#" >${group.ginfo }</a></td>
																		<td>${group.gmanager }</td>
																		<td><button class="groupBtn2" style="width:100px" >삭제</button></td>
																	</tr>
		                                                        </tbody>
		                                                    </table>
		                                                </div>
		                                            </div>
		                                        </div>
									    	</div>
									    	</div>
									    	</div>
									    </section>
									    <%@ include file="../include/ReportModal.jsp" %>
										
									</div>
	     

    
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


</html>
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
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<style type="text/css">
#modal.modal-overlay {
    ... 
    display: none;
    ...  
}
</style>

<style>

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.append-buttons {
	text-align: center;
	margin-top: 20px;
}

.append-buttons button {
	display: inline-block;
	cursor: pointer;
	border: 1px solid #007aff;
	color: #007aff;
	text-decoration: none;
	padding: 4px 10px;
	border-radius: 4px;
	margin: 0 10px;
	font-size: 13px;
}
</style>
</head><body>
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
			<%@include file="../include/Topbar.jsp"%>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<%@ include file="../include/Sidebar.jsp"%>


					<div class="pcoded-main-container">
						<div class="pcoded-wrapper">
							<div class="pcoded-content">
								<div class="pcoded-inner-content">
									<!-- Main-body start -->
									<div class="main-body">
										<div class="page-wrapper">
											<!-- Page-body start -->
											<div class="page-body breadcrumb-page">
												<!-- Simple Breadcrumb card start -->
												<div class="page-body">
													<div class="row">
														<div class="col-sm-12">
															<!-- Badges card start -->
															<div class="card">
																<div class="card-header">
																	<div class="card-header-left">
																		<h5>${board.bcode }의상세정보</h5>
																	</div>
																</div>
																<div class="card-block">
																	<div class="row">
																		<div class="col-lg-4">
																			<div class="badge-box" style="text-align: center;">																				
																				<img class="img-80 img-radius mCS_img_loaded" style="height: 180px; width: 180px;" alt="" src="${board.mprofile}">
																			</div>
																		</div>
																		<div class="col-lg-8">
																			<dl class="dl-horizontal row">
																				<dt class="col-sm-3">ID</dt>
																				<dd class="col-sm-9">${board.bmid }</dd>
																				<dt class="col-sm-3">내용</dt>
																				<dd class="col-sm-9">${board.bcontent}</dd>
																				<dt class="col-sm-3">사진</dt>
																				<dd class="col-sm-9"></dd>
																				<dt class="col-sm-12">
																					<div class="swiper-container mySwiper" style="width: 70%; height: 70; float: left;">
																						<div class="swiper-wrapper">
																							<c:forEach items="${board.photo}" var="photo">
																								<div class="swiper-slide">
																									<div class="swiper-zoom-container">
																										<img class="img1" style="object-fit: cover;" src="${pageContext.request.contextPath}/resources/uploadImg/${photo}" />
																										<input type="hidden" name="photo" value="${photo}">
																									</div>
																								</div>
																							</c:forEach>
																						</div>
																						<div class="swiper-button-next"></div>
																						<div class="swiper-button-prev"></div>
																						<div class="swiper-pagination"></div>
																					</div>
																				</dt>
																				<dd class="col-sm-12" >
																				<div style="float: right;">
																				<button class="groupBtn2" style="width: 100px;" onclick="deleteBoard('${board.bcode}')">삭제</button>
																					<button class="groupBtn2" style="width: 100px" onclick="deleteMember('${board.bmid}')">멤버삭제</button>
																					<button class="groupBtn2" style="width: 100px;" onclick="historyBack()">뒤로가기</button></dd>
																				</div>
																			</dl>
																		</div>
																	</div>
																</div>
															</div>
															<!-- Badges card end -->
														</div>
													</div>
												</div>
											</div>
											<!-- Page-body start -->
										</div>
									</div>
									<!-- Main-body start -->

									<div id="styleSelector"></div>
								</div>
							</div>
						</div>
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
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
<script>
var swiper = new Swiper(".mySwiper", {
zoom: true,
navigation: {
nextEl: ".swiper-button-next",
prevEl: ".swiper-button-prev",
},
pagination: {
el: ".swiper-pagination",
clickable: true,
	},
});
</script>

<script type="text/javascript">
var sel_files = [];
$(document).ready(function() {
	$("#bphoto").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {
	sel_files = [];

	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
		filesArr
			.forEach(function(f) {
				$(".swiper-wrapper").empty();
				sel_files.push(f);
				var reader = new FileReader();
				reader.onload = function(e) {
					var img_html = "<div class='swiper-slide'><div class='swiper-zoom-container'><img src=\"" + e.target.result + "\" /></div></div>";
					console.log("e.target.result : " + e.target.result)
					$(".swiper-wrapper").append(img_html);
					}
				reader.readAsDataURL(f);
			});
}

function deleteBoard(bcode){
	var deleteCheck = confirm(bcode + "게시글을 삭제하겠습니까?");
	if(deleteCheck == true){
	location.href = "deleteBoard?bcode=" + bcode;		
	}
}
function deleteMember(mid) {
	var deleteCheck = confirm(mid + "계정을 삭제하겠습니까?");
	if (deleteCheck == true) {
		location.href = "deleteMember?mid=" + mid;
	}
}
function historyBack(){
	   history.back();
	}
</script>
</html>
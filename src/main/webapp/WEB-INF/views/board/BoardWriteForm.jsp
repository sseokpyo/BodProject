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
     
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper-container {
        width: 100%;
        height: 100%;
      }

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

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .swiper-container {
        width: 100%;
        height: 300px;
        margin: 20px auto;
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
			<%@ include file="../include/Topbar.jsp"%>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<%@ include file="../include/Sidebar.jsp"%>

					<!-- 글쓰기 폼 시작 -->
					<div id="colorlib-page">
						<div id="colorlib-main">
							<section class="ftco-section">
								<div class="container">
									<div class="row">
										<div class="col-lg-8">
											<div class="card">
											
												<!-- 글쓰기 폼 제목 -->
												<div class="card-header" style="border-top:5px solid #95AECB; text-align:center; height:80px; line-height:80px;">
													<h3>게시글 작성</h3>
												</div>
												
												<!-- 글쓰기 폼 사진 영역 -->
												<form action="boardWrite" method="post" enctype="multipart/form-data" id="form">
												<input type="hidden" name="bmid" value="${sessionScope.loginId}">
												<c:if test="${param.gcode != null }">
												<input type="hidden" value="${param.gcode}" name="bgcode">
												</c:if>
												<div class="card-block">
													<div class="form-group row">
														<div class="col-sm-12">
															<div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff; width:80%;" class="swiper-container mySwiper">
																      <div class="swiper-wrapper">
																      
																       
																      </div>
																      <div class="swiper-button-next"></div>
																      <div class="swiper-button-prev"></div>
																      <div class="swiper-pagination"></div>
																    </div>
																
														</div>
													</div>
												</div>
												
												<!-- 문구입력 -->
												<div class="card-block">
													<div class="form-group row">
														<div class="col-sm-12">
															<textarea style="height: 400px; " class="form-control" id="textarea" name="bcontent" placeholder=" 문구 입력..."></textarea>
															
															<!-- 해시태그 -->
															<input type="hidden" name="taglist" id="tag" style="padding-left:10px;">
															<ul id="tag-list">
        													</ul>
															
															&nbsp;<i class="fas fa-tags" style="color:#80A1C2;"></i><span>&nbsp;&nbsp;</span>
															<input type="text" id="addtag" placeholder=" 태그 추가">
															<!-- 해시태그 끝-->
															<input type="hidden" value="${sessionScope.loginNick}">	
														</div>
														<hr>
													</div>
													
													<!-- 사진 업로드, 게시 버튼 -->
													<div class="form-group row">
														<div class="col-sm-6">
															<label class="groupBtn" style="display: inline-block; width: 100%; height: auto;" for="bphoto">사진 업로드</label> 
															<input multiple="multiple" type="file" id="bphoto" name="bphotofile[]" style="display: none;" >
														</div>
														<div class="col-sm-6">
															<input type="submit" class="groupBtn" style="width: 100%; height: auto;" value="게시">
														</div>
													</div>
												</div>
												</form>
												
												

											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
					<!-- 글쓰기폼 종료 -->
					
					
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

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
	var swiper = new Swiper(".mySwiper", {
		zoom : true,
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
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
	
	
	//해시태그 js
    $(document).ready(function () {

        var tag = {};
        var counter = 0;  //태그 아이디

        // 태그를 추가한다.
        function addTag (value) {
            tag[counter] = value; // 태그를 Object 안에 추가
            counter++; // 삭제를 위한 del-btn 의 고유 id 가 된다.
        }

        //array type 으로 생성
        function marginTag () {
            return Object.values(tag).filter(function (word) {
                return word !== "";
            });
        }
    
        // 서버에 넘기기
        $("#form").on("submit", function (e) {
            var value = marginTag(); // return array
            $("#tag").val(value); 
 
            confrim("태그확인"+$("#tag").val());
            $(this).submit();
        });

        $("#addtag").on("keypress", function (e) {
            var self = $(this);

            // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
            if (e.key === "Enter" || e.keyCode == 32) {

                var tagValue = "#"+self.val(); // 값 가져오기

                // 값이 없으면 동작 ㄴㄴ
                if (self.val() !== "") {

                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                    var result = Object.values(tag).filter(function (word) {
                        return word === tagValue;
                    })
                
                    // 태그 중복 검사
                    if (result.length == 0) { 
                        $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                        addTag(tagValue);
                        self.val("");
                    } else {
                        alert("태그값이 중복됩니다.");
                    }
                }
                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
            }
        });

        // 삭제 버튼 
        // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
        $(document).on("click", ".del-btn", function (e) {
            var index = $(this).attr("idx");
            tag[index] = "";
            $(this).parent().remove();
        });
        
	});
	
	
		
	
</script>

</html>

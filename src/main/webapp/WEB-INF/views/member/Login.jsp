<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>beginning of a day</title>
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

      <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/logo_icon.png" type="image/x-icon">
      <!-- Google font-->
      <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/icon/icofont/css/icofont.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
  
  	  <script src="https://kit.fontawesome.com/f3520ad06d.js" crossorigin="anonymous"></script>
  	  
  	  <!-- content??? ????????? OAuth2.0 ???????????????ID??? ????????????. -->
	  <meta name ="google-signin-client_id" content="121437145837-vp3m2fr8dnfhhktf7a1ts9rhou7fjjif.apps.googleusercontent.com">
	
	  <!-- ????????? ?????? ????????? -->
	  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	
  </head>

  <body themebg-pattern="theme1">
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

    <section class="login-block">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->

                        <form class="md-float-material form-material"
                        		action="login" method="post" onsubmit="return loginCheck()">
                            <div class="text-center">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/logo_white.png" alt="logo.png"
                                style="height:80px; width:auto;">
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">?????????</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="text" id="loginId" name="loginId" class="form-control">
                                        <span class="form-bar"></span>
                                        <label class="float-label">????????? ?????????</label>
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" id="loginPw" name="loginPw" class="form-control">
                                        <span class="form-bar"></span>
                                        <label class="float-label">????????????</label>
                                    </div>
                                    <div class="row m-t-25 text-left">
                                        <div class="col-12">
                                            <div class="checkbox-fade fade-in-primary d-">
                                                <label>
                                                    <input type="checkbox" id="idSaveCheck">
                                                    <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                    <span class="text-inverse">????????? ??????</span>
                                                </label>
                                            </div>
                                            <div class="forgot-phone text-right f-right">
                                                <a href="moveSearchIdPwForm" class="text-right f-w-600"> ?????????/???????????? ??????</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center "
                                            id="loginbtn">?????????</button>
                                        </div>
                                        
                                        <div class="col-md-12">
                                        <hr>
                                        	<button type="button" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center"
                                            onclick="kakaoLogin()" style="background-color: #f7e600; border:none; color:#353433;" id="kakao-login-btn" >
                                            <i class="fas fa-comment"></i> &nbsp;|&nbsp;&nbsp;&nbsp;&nbsp; ????????? ???????????? ????????? </button>
                                        </div>
                                        
                                    </div>
                                    <hr/>
                                    <div class="row m-t-30 ">
                                    	<div class="col-md-12 text-center">
                                        	<span class="text-center"  style="font-align:center;">????????? ???????????????? </span>
                                            <a href="moveJoinForm" class="f-w-500" style="color:#B1C763; font-size:15px"> ????????????</a>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    
    
<!-- Required Jquery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery/jquery.min.js "></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-ui/jquery-ui.min.js "></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/bootstrap/js/bootstrap.min.js "></script>
<!-- waves js -->
<script src="${pageContext.request.contextPath}/resources/assets/pages/waves/js/waves.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/common-pages.js"></script>


</body>

<script type="text/javascript">
	

	//????????? ????????????
	$(document).ready(function(){
		
    var userInputId = getCookie("userInputId");//????????? ????????? ????????????
    $("input[name='loginId']").val(userInputId); 
     
    if($("input[name='loginId']").val() != ""){ // ??? ?????? ID??? ???????????? ?????? ????????? ??????
                                           // ????????? ???????????? ?????????????????? ???,
        $("#idSaveCheck").attr("checked", true);
    	$("#loginId").focus();
    	$("#loginPw").focus();
    // ID ??????????????? ?????? ????????? ??????.
    }
     
    $("#idSaveCheck").change(function(){ // ??????????????? ????????? ?????????
        if($("#idSaveCheck").is(":checked")){ // ID ???????????? ???????????? ???,
            var userInputId = $("input[name='loginId']").val();
            setCookie("userInputId", userInputId, 7); // 7??? ?????? ?????? ??????
        }else{ // ID ???????????? ?????? ?????? ???,
            deleteCookie("userInputId");
        }
    });
     
    // ID ??????????????? ????????? ???????????? ID??? ???????????? ??????, ?????? ?????? ?????? ??????.
    $("input[name='loginId']").keyup(function(){ // ID ?????? ?????? ID??? ????????? ???,
        if($("#idSaveCheck").is(":checked")){ // ID ??????????????? ????????? ????????????,
            var userInputId = $("input[name='loginId']").val();
            setCookie("userInputId", userInputId, 7); // 7??? ?????? ?????? ??????
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	

	/* ????????? ???????????? ?????? ?????? */
	function loginCheck(){
		var loginId = $("#loginId").val();
		var loginPw = $("#loginPw").val();
		var boolean = true;
		
		if( loginId == ""){
			alert("???????????? ??????????????????.");
			$("#loginId").focus();
			return false;
		}else if( loginPw == "" ){
			alert("??????????????? ??????????????????.");
			$("#loginPw").focus();
			return false;
		}else{
			/* ????????? ???????????? ???????????? */
			$.ajax({
				type : "get",
				url : "checkLogin",
				data : { "loginId" : loginId,
						 "loginPw" : loginPw },
				async:false,
				success: function(checkResult){
					console.log(checkResult);
					check = checkResult;
					
					if(check != "X"){
						boolean = true;
					}else{
						alert("?????????/??????????????? ????????????.");
						$("#loginPw").focus();
						boolean = false;
					}
				}
			});
		}return boolean;
	}
</script>

<!-- ????????? ?????? api -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init('f276311aff929ebdd9685af8db3b30c0'); 
	console.log(Kakao.isInitialized()); // sdk?????????????????????
	
	//??????????????????
	function kakaoLogin() {
		console.log("????????? ????????? ??????");
	    Kakao.Auth.login({
	      scope:'profile_nickname,	profile_image,	account_email,	gender',
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (res) {
	        	  console.log(res)
	        	  
	        	  var kId = res.kakao_account.email;
	        	  var kName = res.properties.nickname;
	        	  var kGender = res.kakao_account.gender;
	        	  var kProfile = res.properties.profile_image;
	        	  
	        	  if(kGender == "female"){
	        		  kGender = "??????";
	        	  }else{
	        		  kGender = "??????";
	        	  }
	        	  
	        	//???????????? ???????????? ?????? _ ????????? ??????
				kakaoJoin(kId,kName,kGender,kProfile);
	          }
	        });
	      }
	    });
	    
	    	function kakaoJoin(kId,kName,kGender,kProfile){
	    		 console.log("???????????? ????????? ???????????? ??????");

	    		 //?????? ????????? ????????? ??????
	        	 $.ajax({
	        		type: "post",
	        		url : "checkKakaoUser",
	        		data: { "kId" : kId,
	        				"kname" : kName,
	        				"kgender" : kGender,
	        				"kprofile" : kProfile },
	        		async: false,
	        		success : function(kUserInfo){
	        			//?????????????????? ?????? ?????? ??????
	        			if(kUserInfo == ""){
	        				var checkJoin = confirm("????????? ???????????? ?????????????????????????");
	        				if(checkJoin){
	        				location.href="kakaoJoin?id="+kId+"&name="+kName+"&gender="+kGender+"&profile="+kProfile;
	        				}
	        			//?????? ????????? ???????????? ?????? ????????? ??????	
	        			}else{
	        				location.href="kakaoLogin?loginId="+kUserInfo;
	        			}
	        		}
	        	 });
	        	 
	        	 
	    	}
	  }
  
	
</script>



</html>
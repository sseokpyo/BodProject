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
	<style>
	.checkBtn{
		background-color:#95AECB;
		color:white;
		border:none;
		width:120px;
		height:36px;
		line-height:36px;
		
	}
	.checkBtn:hover{
		cursor: pointer;
		background-color:#80A1C2;
		
	}
	.result{
		width:450px;
		height:120px;
		padding:15px 10px 10px 0px;
		background-color:#eee;
		text-align:center;
		margin-left:auto;
		margin-right:auto;
		border: 20px solid transparent;
	    border-top-color: white;
	    border-bottom: 0;
	    border-right: 0;
	    
	
	}
	.result::after{
  		content: '';
  
	}
	
	
	</style> 
 
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

                        <form class="md-float-material form-material" action="#" onsubmit="return refalse()">
                            <div class="text-center">
                                <img src="${pageContext.request.contextPath}/resources/assets/images/logo_white.png" alt="logo.png"
                                style="height:80px; width:auto;">
                            </div>
                            <div class="auth-box card" style="max-width: 500px !important; margin-left:auto;  margin-right:auto;">
                                <div class="card-block" >
                                
                            <!-- 아이디 찾기 시작 -->
                                	<div class="row">
                                    <div class="col-md-12" style="margin-top:13px;">
                                            <h4>&nbsp;&nbsp;아이디 찾기</h4>
                                            <hr style="border-top:5px double #95AECB;">
                                    </div>
                                   
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            	<input type="text" name="mname" class="form-control" id="mname">
                                            	<span class="form-bar"></span>
                                            	<label class="float-label">이름</label>
                                       	  </div>
                                    </div>
                                    <div class="col-sm-6">
                                        	<div class="form-group form-primary">
                                            	<input type="tel" id="mphone" name="mphone" class="form-control">
                                            	<span class="form-bar"></span>
                                            	<label class="float-label">전화번호(-빼고입력)</label>
                                       	    </div>
                                    </div>
                                    <div class="col-md-12" >
                                    		<div class="form-group form-primary" style="text-align:center;">
                                    			<button class="checkBtn" onclick="searchId()" >확인</button>
                                    			
                                    		</div>
                                	</div>
                                	 <div class="col-md-12" id="idResultArea" style="display:none;" >
                                    		<div class="form-group form-primary result">
                                    			<p>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</p>
                                    			<h5 id="idResult"></h5>
                                    			<p id="falseResult" style="color:red; font-weight:bold;"><p>
                                    		</div>
                                	</div>
                             </div>
                             <!-- 아이디 찾기 종료 -->    	
                                 	<br>
                                 	
                             <!-- 비밀번호 찾기 시작 -->
                                    <div class="row">
                                    <div class="col-md-12" style="margin-top:13px;">
                                            <h4>&nbsp;&nbsp;비밀번호 찾기</h4>
                                            <hr style="border-top:5px double #95AECB;">
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            	<input type="text" id="PwMemail" name="PwMemail" class="form-control">
                                            	<span class="form-bar"></span>
                                            	<label class="float-label">아이디(이메일)</label>
                                       	  </div>
                                    </div>
                                    <div class="col-sm-6">
                                        	<div class="form-group form-primary">
                                            	<input type="text" id="PWMphone" name="PWMphone" class="form-control">
                                            	<span class="form-bar"></span>
                                            	<label class="float-label">전화번호(-빼고입력)</label>
                                       	    </div>
                                    </div>
                                	 <div class="col-md-12" >
                                    		<div class="form-group form-primary" style="text-align:center;">
                                    			<button class="checkBtn" onclick="searchPw()" >확인</button>
                                    			
                                    		</div>
                                	</div>
                                	 <div class="col-md-12" id="pwResultArea" style="display:none;" >
                                    		<div class="form-group form-primary result">
                                    			<p>비밀번호 찾기 결과 입력하신 정보와 일치하는 비밀번호는 아래와 같습니다.</p>
                                    			<h5 id="pwResult"></h5>
                                    			<p id="pwFalseResult" style="color:red; font-weight:bold;"><p>
                                    		</div>
                                	</div>
                               </div>
                               <!-- 비밀번호 찾기 종료 -->  	
                                <br><hr/>
                                    <div class="form-group form-primary">
                                    	<div class="col-md-12">
                                            <button class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-10"
                                            onclick="location.href='/controller'">로그인으로 이동</button>
                                        </div>
                                    </div>
                                    <div class="row">
                                    	<div class="col-md-12 text-center">
                                        	<span class="text-center"  style="font-align:center;">계정이 없으신가요? </span>
                                            <a href="moveJoinForm" class="f-w-500" style="color:#80A1C2; font-size:15px"> 가입하기</a><br>
                                    	</div>
                                    </div>
                                </div>
                                </div>
                                </form>
                            </div>
                       
                        <!-- end of form -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
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

<script>
	function searchId(){
		var mname = $("#mname").val();
		var mphone = $("#mphone").val();
		
		if(mname == ""){
			alert("이름을 입력해주세요.");
			$("#mname").focus();
		}else if( mphone == ""){
			alert("전화번호를 입력해주세요.");
			$("#mphone").focus();
		}else{
			$("#idResultArea").css("display","");
			$.ajax({
				type : "get",
				url: "searchId",
				data: { "mname" : mname,
						"mphone" : mphone
				},
				async:false,
				success : function(result){
					
					if(result == ""){
						$("#idResult").text("");
						$("#falseResult").text("입력하신 정보와 일치하는 아이디가 없습니다. 다시 입력 부탁드립니다.");
					}else{
						$("#falseResult").text("");
						$("#idResult").text(result);
					}
				}
			});
		}
	}
	
	function searchPw(){
		$("#pwResultArea").css("display","none");
		var mid = $("#PwMemail").val();
		var mphone = $("#PWMphone").val();
		
		if(mid == ""){
			alert("아이디를 입력해주세요.");
			$("#PwMemail").focus();
		}else if( mphone == ""){
			alert("전화번호를 입력해주세요.");
			$("#PWMphone").focus();
		}else{
			$("#pwResultArea").css("display","");
			$.ajax({
				type : "get",
				url: "searchPw",
				data: { "mid" : mid,
						"mphone" : mphone
				},
				success : function(result){
					if(result == ""){
						$("#pwResult").text("");
						$("#pwFalseResult").text("입력하신 정보와 일치하는 아이디가 없습니다. 다시 입력 부탁드립니다.");
					}else{
						$("#pwFalseResult").text("");
						$("#pwResult").text(result);
					}
				}
			});
		}
	}
	
	function refalse(){
		return false;
	}
	
	
</script>
</html>
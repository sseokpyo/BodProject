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
 
 	  <!-- 다음 api -->
 	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                
                
                <!-- form -->
                    <!-- <form class="md-float-material form-material" action="memberjoin" method="post" enctype="multipart/form-data"> -->
                    
                        <div class="text-center">
                            <a href="/controller" ><img src="${pageContext.request.contextPath}/resources/assets/images/logo_white.png" alt="logo_white.png"
                            style="height:80px; width:auto;"></a>
                        </div>
                        
                        <!-- 회원가입 코드 시작 -->
                        <div class="auth-box card joinForm">
                            <div class="card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">회원가입</h3>
                                    </div>
                                </div>
                                
                  <!-- form -->
                    <form class="md-float-material form-material" action="memberjoin" method="POST" enctype="multipart/form-data" >
                                <div class="row">
                                    <div class="col-sm-9">
                                		<div class="form-group form-primary">
                                    		<input type="text" name="mid" id="inputMid" class="form-control" ;>
                                   	 		<span class="form-bar"></span>
                                    		<label class="float-label">이메일 아이디</label>
                                    		<span style="font-size:12px" id="midCheckText">아이디를 입력해주세요. (최대 20글자)</span>
                                		</div>
                                	</div>
                                	<div class="col-sm-3">
                                		<button class="btnhv btn btn-primary btn-sm" onclick="midCheck(); return false;">중복확인</button>                           
                                	</div>
                                	 <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" name="mpw" id="inputMPW" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">비밀번호</label>
                                            <span style="font-size:12px" id="MPWcheckText"> *영문/숫자 4~12자</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="password" name="mpw2" id="MPWcheck" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">비밀번호 확인</label>
                                            <span style="font-size:12px" id="MPWcheckText2" >*영문/숫자 4~12자 </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="form-group form-primary">
                                            <input type="text" name="mname" id="inputMNAME" class="form-control">
                                            <span class="form-bar"></span>
                                            <label class="float-label">이름</label>
                                            <span style="font-size:12px" id="MNAMEcheckText" >이름을 입력해주세요. </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary">
                                            <input type="date" name="mbirth" class="form-control" style="font-size:14px;">
                                            <span class="form-bar"></span>
                                            <label class="float-label"></label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group form-primary" style="border-bottom: 1px solid #ccc; padding-top:12px; ">
                                            <span style="font-size:14px;">성별 &nbsp;&nbsp;&nbsp;</span>
                                            <label><input type="radio" name="mgender"  id="inputMGENDER" value="남자"/>남자 &nbsp;</label>
                                            <label><input type="radio" name="mgender" id="inputMGENDER"  value="여자"/>여자</label>
                                            
                                        </div>
                                    </div>
                                	 <div class="col-sm-12">
                                		<div class="form-group form-primary">
                                    		<input type="text" name="mphone" id="inputMPHONE" class="form-control">
                                   	 		<span class="form-bar"></span>
                                    		<label class="float-label">전화번호 (- 빼고 입력 )</label>
                                		</div>
                                	</div>
                                	
                                	
                                	<!-- 주소 api -->
                                	
                                    <div class="col-sm-8"> 
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">우편번호</span>
                                           	<input type="text"  name="maddr" id="sample6_postcode" class="form-control">
                                           	<span class="form-bar"></span>
                                    		<label class="float-label"></label>
                                    	</div>
                                    </div>
                                    <div class="col-sm-4">
                        					<input type="button" class="btnhv btn btn-primary btn-sm" style="margin-top:20px;"
                        					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                        			</div>
                        			<div class="col-sm-12">
                        				<div class="form-group form-primary">
                        					<span style="font-size:14px;">주소</span>
                        					<input type="text"  name="maddr" id="sample6_address" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>	
									</div>		
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<span style="font-size:14px;">상세주소</span>
											<input type="text" name="maddr" id="sample6_detailAddress" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<span style="font-size:14px;">참고항목</span>
											<input type="text" name="maddr"id="sample6_extraAddress" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
                                    		
										</div>
									</div>
							
                                   <!-- 주소 api끝 -->
                                   
                                   <div class="col-sm-4">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">프로필</span><br>
                                			<img class="img-radius mCS_img_loaded "  id="imgid" src="${pageContext.request.contextPath}/resources/uploadImg/userimg/userProfile.jpg" alt="User-Profile-Image"
											style="width:100px; height:100px; margin:15px;">
                                			
                                		</div>
                                	</div>
                                	<div class="col-sm-8">
                                		<div class="form-group form-primary " style="margin-top:20px;">
                                			<input type="text" name="mnick" id="inputMNICK" class="form-control">
                                   	 		<span class="form-bar"></span>
                                    		<label class="float-label">닉네임</label>
                                            <span style="font-size:12px" id="MNICKcheckText">닉네임을 입력해주세요. (최대 20글자)</span>
                                		</div>
                                		<div class="form-group form-primary ">
                                			<label class="btn btn-primary btn-sm btnhv" for="input-file">프로필 사진 등록</label>
                                    		<input type="file" name="mfile" id="input-file" class="form-control" style="font-size:14px;  display:none;">
                                			<input type="hidden" name="mprofile" id="mprofile" value="userProfile.jpg"> 
                                		</div>
                                	</div>	

                                </div>	
                               
                                <div class="row m-t-10">
                                    <div class="col-md-12">
                                        <button type="submit" onclick="check(); return false;" class="btnhv btn btn-primary btn-md btn-block waves-effect text-center m-b-20 ">회원가입</button>
                                    </div>
                                </div>
                              </form>
                            </div>
                        </div>
                        <!-- 회원가입 코드 종료 -->
                    <!-- </form> -->
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

<!-- 파일 자동 저장  -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/addJs/download.js"></script>

</body>



<script>
	//카카오 회원가입용 js
	$(document).ready(function(){
		
		history.replaceState({}, null, location.pathname);
		
		//받아온 값
		var kid = "${id}";
		var kname = "${name}";
		var kgender = "${gender}";
		var kprofile = "${profile}";
		
		if(kid != ""){
			$("#inputMid").focus();
			$("#inputMid").val(kid);
			
			$("#inputMNAME").focus();
			$("#inputMNAME").val(kname);
			
			if(kgender == "여자"){
				$("input:radio[name='mgender']:radio[value='여자']").prop("checked", true); 
			}else if(kgender == "남자"){
				$("input:radio[name='mgender']:radio[value='남자']").prop("checked", true); 
			}
			
			$("#imgid").attr("src","${profile}");
			$("#mprofile").val("${profile}");
			
		}
	});
</script>



<script type="text/javascript">

/* 아이디 중복 체크 */
function midCheck() {
	
	var inputMid = $("#inputMid").val();
	
	$.ajax({
		type : "get",
		url : "moveIdCheck",
		data : { "inputMid" : inputMid },
		async : false,
		success : function(result){
			if(result =="OK" && inputMid.length > 0){
				$("#midCheckText").css("color" , "green").html("사용가능한 아이디입니다.");
				
			} else {
				$("#midCheckText").css("color" , "red").html("사용불가능한 아이디입니다.");
				
			}
		}
	});
}


	$(document).ready(function(){
		
		var sel_file;
        $("#input-file").on("change",handleImgFileSelect);
        
		 /* 비밀번호 확인 */		
			 $("#inputMPW").keyup(function(){
	                var inputMPW = $("#inputMPW").val();
	                if(inputMPW.length == 0) {
	                    $("#MPWcheckText").css("color" , "red").html("비밀번호를 입력해주세요.");
	                } else if(inputMPW.length < 4 || inputMPW.length > 12) {
	                    $("#MPWcheckText").css("color", "red").html("비밀번호는 4~12자리 입니다.");
	                } else if(inputMPW.length >= 4 && inputMPW.length <= 12) {
	                    $("#MPWcheckText").css("color", "blue").html("사용가능한 비밀번호입니다.");
	                }
	            });
			 
			 /* 비밀번호 2차 확인 */
	            $("#MPWcheck").keyup(function(){
	                var MPWcheck = $("#MPWcheck").val();
	                if($("#inputMPW").val() == MPWcheck) {
	                    $("#MPWcheckText2").css("color" , "blue").html("일치합니다.");
	                } else if($("#inputMPW").val() != MPWcheck) {
	                    $("#MPWcheckText2").css("color" , "red").html("비밀번호 확인을 해주세요.");
	                } else {
	                	$("#MPWcheckText2").css("color" , "red").html("다릅니다.");
	                }
	            });
	            
	            /* 이름 공백 체크 */
	          $("#inputMNAME").keyup(function(){
	        	 var inputMNAME = $("#inputMNAME").val();
	        	  if(inputMNAME.length == 0) {
	        		  $("#MNAMEcheckText").css("color" , "red").html("이름을 입력해주세요.");
	        	  } else {
	        		  $("#MNAMEcheckText").html("");
	        	  }
	          });

				/* 닉네임 중복 체크 */
				$("#inputMNICK").keyup(function(){
					var inputMNICK = $("#inputMNICK").val();
					
					$.ajax({
						type : "get",
						url : "MNICKcheck",
						data : { "inputMNICK" : inputMNICK },
						async : false,
						success : function(result){						
							if(result =="OK"){
								$("#MNICKcheckText").css("color" , "blue").html("사용가능한 닉네임입니다.");
							} else {
								$("#MNICKcheckText").css("color" , "red").html("중복된 닉네임입니다.");
							}
						}
					});
					
				});
				
	      	var mgender = $("input[name=gender]:checked").val();
	      	var maddr = $("#sample6_postcode").val()+" " +$("#sample6_address").val()+" " +$("#sample6_detailAddress").val()+ " " +$("#sample6_extraAddress").val();

	
	});
	
	//화면 변경 js
    function handleImgFileSelect(e){
       var files =  e.target.files;
       var filesArr = Array.prototype.slice.call(files);
       
       filesArr.forEach(function(f){
          
       sel_file = f;
       
       var reader = new FileReader();
       reader.onload =  function(e){
          $("#imgid").attr("src", e.target.result);
       }
       reader.readAsDataURL(f);
          
          
       });
    }
	
	function check(){
		var inputMid = $("#inputMid").val();
		var inputMPW = $("#inputMPW").val();
		var MPWcheck = $("#MPWcheck").val();
		var inputMNAME = $("#inputMNAME").val();
		
		var inputMGENDER = $("#inputMGENDER").val();
		var mgender = $("input[name=gender]:checked").val();
		
		var inputMPHONE = $("#inputMPHONE").val();
		var maddr = $("#sample6_postcode").val()+" " +$("#sample6_address").val()+" " +$("#sample6_detailAddress").val()+ " " +$("#sample6_extraAddress").val();
		var inputMNICK = $("#inputMNICK").val();
		
		if(inputMid.length == 0 || inputMid.length > 20){
			alert("아이디를 확인해 주세요.");
			document.getElementById("inputMid").focus();
			
		} else if($("#midCheckText").html() == "사용불가능한 아이디입니다.") {
			alert("이미 사용중인 이메일입니다.");
			document.getElementById("inputMid").focus();
			
		} else if(inputMPW.length == 0 || inputMPW.length < 4 || inputMPW.length > 12) {
			alert("비밀번호를 확인해 주세요.");
			document.getElementById("inputMPW").focus();	
			
		} else if(MPWcheck.length == 0 || MPWcheck.length < 4 || MPWcheck.length > 12 || inputMPW != MPWcheck) {
			alert("입력한 비밀번호와 다릅니다..");
			document.getElementById("MPWcheck").focus();	
			
		} else if(inputMNAME.length == 0 || inputMNAME.length > 5) {
			alert("이름을 확인해 주세요.");
			document.getElementById("inputMNAME").focus();
			
		} else if(inputMPHONE.length == 0 || inputMPHONE.length > 11) {
			alert("전화번호를 확인해 주세요.");
			document.getElementById("inputMPHONE").focus();
			
		} else if(inputMNICK.length == 0 || inputMNICK.length > 20) {
			alert("닉네임을 확인해 주세요.");
			document.getElementById("inputMNICK").focus();
			
		} else if($("#MNICKcheckText").html() == "중복된 닉네임입니다.") {
			alert("이미 사용중인 닉네임입니다.");
			document.getElementById("inputMNICK").focus();
		}
		  else {
			location.href("member/memberjoin");
		}
	}
	
  	
  	</script>
  	
<script>
	//다음주소
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

	
</script>


</html>
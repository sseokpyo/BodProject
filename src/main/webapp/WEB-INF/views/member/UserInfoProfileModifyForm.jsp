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

	<!-- ?????? api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
	
	<script>
		//????????? ?????? ???????????? ?????????
		var mgender = "${memberInfo.mgender}"
		if(mgender == "??????"){
				$("input:radio[name='mgender']:radio[value='??????']").prop("checked", true); 
			}else if(mgender == "??????"){
				$("input:radio[name='mgender']:radio[value='??????']").prop("checked", true); 
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
									<h3 style="padding:5px; color:#777; border-left:5px solid #B1C763; font-weight:500;">&nbsp;????????? ??????</h3>
									</div>
									<div class="row">
									<!-- ????????? ?????? ??? ?????? -->
									<div class="col-lg-8 formdiv" >
									<div class="row modifyForm">
									
									<!-- sns????????? : ??????, ????????? -->
									<div class="col-sm-4 ">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">????????? ??????</span><br>
                                			<img class="img-radius mCS_img_loaded " id="profileImg" src="${memberInfo.mprofile}" alt="User-Profile-Image"
											style="width:150px; height:150px; margin:15px; margin-left:30px;">
									   </div>
									 </div>
									<div class="col-sm-8 " >
										<div class="form-group form-primary" style=" margin-top:15px;">
                                    		<input type="file" name="mfile"  id="input-file" class="form-control" style="font-size:14px; display:none ">
                                    		<label class="mofiBtn" for="input-file" style="width:150px; line-height:35px;">????????? ?????? ??????</label><br>
                                    		<input type="hidden" name="mprofile" id="mprofile" value="${memberInfo.mprofile}"> 
                                    		
                                    		<span style="font-size:14px; margin-top:10px;">?????????</span>
                                            <input type="text" id="mnick" name="mnick" class="form-control" value="${memberInfo.mnick }">
                                            <span style="font-size:12px" id="checkNickMsg"></span>
                                		</div>
                                	</div>
                                	
                                    <div class="col-sm-12 m-b-10">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">?????????</span>
                                    		<input type="text" name="mid" class="form-control" readonly value="${memberInfo.mid }">
                                		</div>
                                	</div>
                                	 <div class="col-sm-9 m-b-10">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">?????? ????????????</span>
                                            <input type="password"  id="mpw" class="form-control">
                                            <span style="font-size:12px" id="checkPwMsg">?????? ??????????????? ??????????????????. (??????/?????? 4~12???) </span>
                                        </div>
                                    </div>
                                    <div class="col-sm-3 m-b-10">
                                    	<div class="form-group form-primary">
                                        	<button class="mofiBtn" type="button" onclick="mpwCheck(${memberInfo.mpw})">???????????? ??????</button>
                                    	</div>
                                    </div>
                                     <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary">
                                            <span class="form-bar">??? ????????????</span>
                                            <input type="password"  id="newMpw" class="form-control">
                                            <span style="font-size:12px" id="MPWcheckText"> *??????/?????? 4~12???</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary">
                                            <span class="form-bar">??? ???????????? ??????</span>
                                            <input type="password"  id="MPWcheck" class="form-control">
                                            <span style="font-size:12px" id="MPWcheckText2" >*??????/?????? 4~12??? </span>
                                        </div>
                                    </div>
                                   
                                    <div class="col-sm-12 m-b-10">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">??????</span>
                                            <input type="text" name="mname" class="form-control" value="${memberInfo.mname}">
                                        </div>
                                    </div>
                                   
                                    <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">????????????</span>
                                            <input type="date" name="mbirth" class="form-control" style="font-size:14px;" value="${memberInfo.mbirth}">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 m-b-10">
                                        <div class="form-group form-primary" style="margin-bottom:0px; border-bottom: 1px solid rgba(0,0,0,.125);">
                                            <span style="font-size:14px;">??????</span><br>
                                            <label style="margin-top:15px;"><input type="radio" name="mgender" value="??????"/>?????? &nbsp;</label>
                                            <label><input type="radio" name="mgender" value="??????"/>??????</label>
                                        </div>
                                    </div>
                                	 <div class="col-sm-12 m-b-10">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">????????????(-?????? ??????)</span>
                                    		<input type="text" name="mphone" id="mphone" class="form-control" value="${memberInfo.mphone}">
                                		</div>
                                	</div>
                                	
                                	<div class="col-sm-9 m-b-10">
                                		<div class="form-group form-primary">
                                			<span style="font-size:14px;">??????</span>
                                    		<input type="text" name="maddr" id="maddr" class="form-control" readonly value="${memberInfo.maddr}">
                                		</div>
                                	</div>
                                	<div class="col-sm-3 m-b-10">
                                		<button class="mofiBtn" type="button" id="addrModi" onclick="addrBtn()" >?????? ??????</button>
                                		<button class="mofiBtn" type="button" style="display:none; width:60px " id="addrOk" onclick="addrModify()" >??????</button>
                                		<button class="mofiBtn" type="button" style="display:none; width:60px " id="addrNo" onclick="addrModifyCancle()" >??????</button>
                                	</div>
                                	
                                
                                	<!-- ?????? api -->
                                	<div class="row" id="daumApiArea" style="margin-left:auto; margin-right:auto; display:none;">
                                	<div class="col-sm-9 ">
                                        <div class="form-group form-primary">
                                        	<span style="font-size:14px;">????????????</span>
                                           	<input type="text" id="sample6_postcode" class="form-control">
                                           	<span class="form-bar"></span>
                                    		<label class="float-label"></label>
                                    	</div>
                                    </div>
                                    <div class="col-sm-3">
                        					<input type="button" class="mofiBtn" onclick="sample6_execDaumPostcode()" style='border: 1px solid rgba(0,0,0,.125);' value="???????????? ??????"><br>
                        			</div>
                        			<div class="col-sm-12">
                        				<div class="form-group form-primary">
                        					<span style="font-size:14px;">??????</span>
                        					<input type="text" id="sample6_address" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>	
									</div>		
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<span style="font-size:14px;">????????????</span>
											<input type="text" id="sample6_detailAddress" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="form-group form-primary">
											<span style="font-size:14px;">????????????</span>
											<input type="text" id="sample6_extraAddress" class="form-control">
                        					<span class="form-bar"></span>
                                    		<label class="float-label"></label>
										</div>
									</div>
									</div>
                                   <!-- ?????? api??? -->
                                   
                                	<div class="col-sm-12" style="text-align:center;">
                                	<br>
                                	<button class="groupBtn2" style="height:50px; font-size:14px;">????????????</button>
                                	</div>
                                	
                                </div>
                                
									</div>
									<!-- ????????? ????????? ?????? -->
									    		
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
	<!-- ?????? ????????????! -->
	<script type="text/javascript">
	
	$(document).ready(function(){
		var sel_file;
		$("#input-file").on("change",handleImgFileSelect);

		var pring = $("#checkPwMsg").val()
		
	});
	
		//?????? ?????? js
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
		
		
		/* ?????? API?????? */
		function sample6_execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

		            // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
		            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
		            var addr = ''; // ?????? ??????
		            var extraAddr = ''; // ???????????? ??????

		            //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
		            if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
		                addr = data.roadAddress;
		            } else { // ???????????? ?????? ????????? ???????????? ??????(J)
		                addr = data.jibunAddress;
		            }

		            // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
		            if(data.userSelectedType === 'R'){
		                // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
		                // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
		                if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
		                    extraAddr += data.bname;
		                }
		                // ???????????? ??????, ??????????????? ?????? ????????????.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
		                if(extraAddr !== ''){
		                    extraAddr = ' (' + extraAddr + ')';
		                }
		                // ????????? ??????????????? ?????? ????????? ?????????.
		                document.getElementById("sample6_extraAddress").value = extraAddr;
		            
		            } else {
		                document.getElementById("sample6_extraAddress").value = '';
		            }

		            // ??????????????? ?????? ????????? ?????? ????????? ?????????.
		            document.getElementById('sample6_postcode').value = data.zonecode;
		            document.getElementById("sample6_address").value = addr;
		            // ????????? ???????????? ????????? ????????????.
		            document.getElementById("sample6_detailAddress").focus();
		        }
		    }).open();
			}
		
		
		
		
		//????????? ?????? 
		$("#mnick").keyup(function(){
			var newNick = $("#mnick").val();
			var mNick = "${memberInfo.mnick}";
			
			if( newNick == mNick ){
				$("#checkNickMsg").text("?????? ????????? ??????");
			}else{
				$.ajax({
					type : "get",
					url : "MNICKcheck",
					data : { "inputMNICK" : newNick },
					async : false,
					success : function(checkReuslt){
						if(checkReuslt =="OK"){
							$("#checkNickMsg").css("color" , "green").html("??????????????? ??????????????????.");
						} else {
							$("#checkNickMsg").css("color" , "red").html("????????? ??????????????????.");
						}
					}
				});
			}
		});
		
		 /*??? ???????????? ?????? */		
		 $("#newMpw").keyup(function(){
               var inputMPW = $("#newMpw").val();
             	
               if($("#mpw").val() == "" ){
            	   alert("?????? ??????????????? ??????????????????.");
            	   $("#mpw").focus();
               }else{
	               if(newMpw.length == 0) {
	                   $("#MPWcheckText").css("color" , "red").html("??????????????? ??????????????????.");
	               } else if(inputMPW.length < 4 || inputMPW.length > 12) {
	                   $("#MPWcheckText").css("color", "red").html("??????????????? 4~12?????? ?????????.");
	               } else if(inputMPW.length >= 4 && inputMPW.length <= 12) {
	                   $("#MPWcheckText").css("color", "blue").html("??????????????? ?????????????????????.");
	               }
               }
           });
		 
		 /*??? ???????????? 2??? ?????? */
           $("#MPWcheck").keyup(function(){
        	   
        	   if($("#mpw").val() == "" ){
            	   alert("?????? ??????????????? ??????????????????.");
            	   $("#mpw").focus();
        	   }else if($("#newMpw").val() == "" ){
        		   alert("??? ??????????????? ????????? ?????????.");
        		   $("#MPWcheck").val("");
            	   $("#newMpw").focus();
        	   }else{
	               var MPWcheck = $("#MPWcheck").val();
	               if($("#newMpw").val() == MPWcheck) {
	                   $("#MPWcheckText2").css("color" , "blue").html("???????????????.");
	               }else if($("#newMpw").val() != MPWcheck) {
	                   $("#MPWcheckText2").css("color" , "red").html("??? ???????????? ????????? ????????????.");
	               }else {
	            	   $("#MPWcheckText2").css("color" , "red").html("??? ???????????? ????????? ????????????.");
	               }
        	   }	   
           });
	    
       	
   		//?????? ???????????? ??????
   		function mpwCheck(memPw){
   			if($("#mpw").val() == memPw ){
   				$("#checkPwMsg").text("???????????? ?????? ??????.").css("color","green");
   			}else{
   				$("#checkPwMsg").text("?????? ??????????????? ???????????????.").css("color","red");
   				$("#mpw").val(""); 
   			}
   			return false;
   		}
   		
   	//?????? ??????
		function modifyCheck(){
			if($("#mnick").val() == ""){
				alert("???????????? ????????? ?????????.");
				$("#mnick").focus();
				return false;
			}else if($("#mpw").val() == ""){
				alert("????????????????????? ??????????????????.");
				$("#mpw").focus();
				return false;
			}else if($("#mphone").val() == ""){
				alert("??????????????? ????????? ?????????.");
				$("#mphone").focus();
				return false;
			}else{
				//?????? ???
				
				//???????????? name??????
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

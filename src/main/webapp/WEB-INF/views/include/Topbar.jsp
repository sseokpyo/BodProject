<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath}/resources/elen/js/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/f3520ad06d.js" crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		$("#sidebarshow").click();
	});

</script>

<nav class="navbar header-navbar pcoded-header" style="height:70px;">
                <div class="navbar-wrapper">
                    <div class="navbar-logo">
                        <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <a href="boardList" >
                            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/images/logo_white.png" alt="Theme-Logo" 
                            style="margin-left:20px; height: 30px; width: auto;"/>
                        </a>
                        <a class="mobile-options waves-effect waves-light">
                            <i class="ti-more"></i>
                        </a>
                    </div>
                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle" id="sidebarshow"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                                
                            </li>
                        </ul>
                        <ul class="nav-right" style="padding:0px; line-height:70px;">
                            <li class="header-notification">
                                <a href="#!" class="waves-effect waves-light">
                                    <i class="ti-bell"></i>
                                    <span class="badge bg-c-red"></span>
                                </a>
                                <ul class="show-notification">
                                    <li>
                                        <h6>Notifications</h6>
                                        <label class="label label-danger">New</label>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="${pageContext.request.contextPath}/resources/assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">John Doe</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="${pageContext.request.contextPath}/resources/assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">Joseph William</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="${pageContext.request.contextPath}/resources/assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">Sara Soudein</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            
                            <li class="header-notification" onclick="friendRequestTop('${sessionScope.loginId}')">
                                <a href="#!" class="waves-effect waves-light">
                                    <i class="fas fa-user-friends"></i>
                                    <div id="friendRequestCheckArea">
                                    
                                    </div>
                                </a>
                                <ul class="show-notification">
                                    <li>
                                        <h6>친구신청</h6>
                                    </li>
                                    <div id="friendRequestArea">
                                    
                                    </div>
                                </ul>
                            </li>
                            
                            <li class="user-profile header-notification">
                                <a href="#!" class="waves-effect waves-light">
                                    <img src="${sessionScope.loginPf }" class="img-radius" alt="User-Profile-Image" style="width:40px; height:40px; object-fit: cover;">
                                    <span>${sessionScope.loginNick }</span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li class="waves-effect waves-light">
                                        <a href="#!">
                                            <i class="ti-settings"></i> Settings
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                         <a href="moveUserInfoModifyForm">
                                            <i class="ti-user"></i> 개인정보 수정
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="email-inbox.html">
                                            <i class="ti-email"></i> My Messages
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="auth-lock-screen.html">
                                            <i class="ti-lock"></i> Lock Screen
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="moveFriendRequest?userId=${sessionScope.loginId }">
                                            <i class="fas fa-user-friends"></i> Friend Request
                                        </a>
                                    </li>
                                    <li class="waves-effect waves-light">
                                        <a href="moveLoginForm">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <script>
            $(document).ready(function(){            	
            	var output = "";
            	var loginId = '<%=(String)session.getAttribute("loginId")%>';
            	console.log("document function 실행 loginId : " + loginId);
            	$("#friendRequestCheckArea").html("");
            	$.ajax({
            		type : "post",
    				url : "friendRequestBoolean",
    				data : { "loginId" : loginId },
    				async:false,
    				success : function(friendRequestList){
    					console.log('friendRequestCheckArea ajax 실행');
    					if (friendRequestList != 0){
    						console.log('친구요청이 있습니다.');
    						output += "<span class='badge bg-c-red'></span>";    							
    					} else {
    						console.log('친구요청이 없습니다.');
    					}
    				}
            	});   
            	$("#friendRequestCheckArea").html(output);
            });
            function friendRequestTop(loginId) {
            	console.log('친구신청목록');
            	console.log('loginId : ' + loginId);
            	var output = "";
            	$("#friendRequestArea").html("");
            	$.ajax({
            		type : "post",
    				url : "friendRequestList",
    				data : { "loginId" : loginId },
    				dataType : "json",
    				async:false,
    				success : function(friendRequestList){
    					if( friendRequestList != null){
    					for (var i in friendRequestList){
    						console.log('친구요청 목록');
    						output += "<li class='waves-effect waves-light'>";
    						output += "<div class='media'>";
    						output += "<img class='d-flex align-self-center img-radius' src='${pageContext.request.contextPath}/resources/uploadImg/userimg/" + friendRequestList[i].mprofile + "'>";
    						output += "<div class='media-body'>";
    						output += "<h5 class='notification-user'>" + friendRequestList[i].mnick + "<div style='float : right;'><button class='groupBtn2' style='width: 40px' onclick='acceptFriend(\""+friendRequestList[i].mid+"\", \""+loginId+"\")'>수락</button><button class='groupBtn2' style='width: 40px' onclick='refuseFriend(\""+friendRequestList[i].mid+"\", \""+loginId+"\")'>거절</button></div></h5>";    						
    						output += "</div>";
    						output += "</div>";
    						output += "</li>";
    					}    						
    					}else {
    						console.log('친구요청이 없습니다.');
    						output += "<h5>친구요청이 없습니다</h5>";
    					}
    				}
            	});
            	$("#friendRequestArea").html(output);
			}
            function acceptFriend(friendId, userId){
            	console.log('friendId / userId : ' + friendId + ' / ' + userId);
            	$.ajax({
            		type : "post",
    				url : "acceptFriendByAjax",
    				data : { "friendId" : friendId , "userId" : userId},    				
    				async:false,
    				success : function(acceptFriendByAjax){
    					
    				}
            	});            	
            	location.reload();
            }

            function refuseFriend(friendId, userId){
            	console.log('friendId / userId : ' + friendId + ' / ' + userId);
            	$.ajax({
            		type : "post",
    				url : "refuseFriendByAjax",
    				data : { "friendId" : friendId , "userId" : userId},    				
    				async:false,
    				success : function(refuseFriendByAjax){
    					
    				}
            	});            	
            	location.reload();
            }
            
            
            
            </script>
            
            
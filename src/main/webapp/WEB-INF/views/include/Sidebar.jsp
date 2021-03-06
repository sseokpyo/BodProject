<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		
 <script type="text/javascript">
                                	$(document).ready(function(){
                                		$("#searchfriendtext").keyup(function(){
                                			var output = "";
                                			var searchtext = $("#searchfriendtext").val();
                                			console.log("searchtext : "+searchtext);
                                			$.ajax({
                                				type : "get",
                                				url : "searchfriend",
                                				data : {"searchtext" : searchtext},
                                				dataType : "json",
                                				async : false,
                                				success : function(searchFriendList){
                                					for(var i in searchFriendList){
	                                					console.log(searchFriendList);
	                                					output += "<li class='' id='userlist'>";
	                                					output += "<a href='moveUserBoardList?userId="+searchFriendList[i].userid+"&loginId=${sessionScope.loginId}' class='waves-effect waves-dark userList' style='border:1px solid #e8e8e8; border-radius:5px;'>";
	                                					output += "<span style='text-align:left; margin-left:5px;'><img src='"+searchFriendList[i].userprofile+"' alt='user image' class='img-radius img-30 align-top m-r-15' style='width:30px; height:30px;'></span>";
	                                					output += "<span class='pcoded-mtext' style='text-align:left; font-size:15px;'>"+searchFriendList[i].usernick+"</span>";
	                                					output += "<span class='pcoded-mcaret'></span>";
	                                					output += "</a>";
	                                					output += "</li>";
                                					}
                                				}
                                			});
                    
	                           				if($("#searchfriendtext").val() == ""){
	                                    		$("#searchfriendList").html("");
	                                    	}else{
	                                    		$("#searchfriendList").html(output);
	                                    	}
                                		});
                                	});
                                	
                                </script>
					<nav class="pcoded-navbar" style="font-family: 'InfinitySans-RegularA1';">
                        <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
                        
                        <div class="pcoded-inner-navbar main-menu" >
                            

                            <div class="p-15 p-b-0" style="padding-top:40px;">
                                <form class="form-material" action="searchfriend" method="get" onsubmit="return false;">
                                    <div class="form-group form-primary" style="margin-bottom:10px !important;">
                                        <input type="text" name="searchfriend" class="form-control" id="searchfriendtext">
                                        <span class="form-bar"></span>
                                        <label class="float-label"><i class="fa fa-search m-r-10"></i>Search User</label>
                                    </div>
                                </form>
                                
                            </div>
                            <ul class="pcoded-item pcoded-left-item" id="searchfriendList">
                            	
                            	
                            </ul>
                            
                           
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="fas fa-user"></i><b>BC</b></span>
                                        <span class="pcoded-mtext">?????????</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                        <li class=" ">
                                            <a href="moveMyBoardList" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">??? ????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="moveBoardWriteForm" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">?????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                         <li class=" ">
                                            <a href="moveBoardModifyForm" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">?????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="moveProfileModifyForm" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">???????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="accordion.html" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                              <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="fas fa-users"></i><b>BC</b></span>
                                        <span class="pcoded-mtext">??????</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                    <ul class="pcoded-submenu">
                                   		<li class=" ">
                                            <a href="moveGroupSearch" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">?????? ?????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="moveMyGroupList?loginId=${sessionScope.loginId }" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">??? ?????? ??????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="moveGroupBoardList" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">??????????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class=" ">
                                            <a href="moveGroupBoardWriteForm" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">???????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="moveGroupBoardModifyForm" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">???????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="moveGroupProfileModifyForm" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="moveGroupCreateForm" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">???????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <c:if test="${sessionScope.loginId eq 'admin'}">
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="pcoded-hasmenu">
                                    <a href="javascript:void(0)" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>BC</b></span>
                                        <span class="pcoded-mtext">?????????</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>                                    
                                    <ul class="pcoded-submenu">  
                                                                 
	                                        <li class=" ">
	                                            <a href="moveAdminHome" class="waves-effect waves-dark">
	                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
	                                                <span class="pcoded-mtext">??????????????????</span>
	                                                <span class="pcoded-mcaret"></span>
	                                            </a>
	                                        </li>
                                        <li class=" ">
                                            <a href="moveAdminBoardDelete" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">?????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="moveAdminGroupDelete" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">??????????????????</span>
                                                <span class="pcoded-mcaret"></span>
                                            </a>
                                        </li>
                                        <li class="">
                                            <a href="moveAdminReport" class="waves-effect waves-dark">
                                                <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                                                <span class="pcoded-mtext">??????</span>
                                                
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                          </c:if>
                            
                            <ul class="pcoded-item pcoded-left-item">
                                <li class="active">
                                    <a href="moveQnAList" class="waves-effect waves-dark">
                                        <span class="pcoded-micon"><i class="far fa-question-circle"></i><b>D</b></span>
                                        <span class="pcoded-mtext">Q&A</span>
                                        <span class="pcoded-mcaret"></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    
                    </nav>
                    
                                                    

                    
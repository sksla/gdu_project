<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<style>
		.chat-container {
        display: none;
     }
     .active {
        display: block;
     }
     .list-mem {
    		max-height: 600px;
     }
     .detail_chatmem {
     		max-height: 400px;
     		min-height: 50px;
     }
     
     
     
     
     
     /* 결재선 모달 스타일 */
	  .list_box_wrap{
	 		width: 30%;
	    height: 400px;
	  }
	  .mem_list_box{
	    border: 1px solid lightgrey;
	    width: 100%;
	    height: 100%;
	  }
	  .mem_list>div{
	    font-size: 14px;
	    padding: 8.5px 5px;
	  }
	  .mem_list>div:hover{
	    background-color: #F2F2F2;
	    color: rgb(90, 106, 133);
	    cursor: pointer;
	  }
	  .selected_app_mem{
	    width: 40%;
	  }
	  .selected_app_mem>div{
	    display: flex;
	    flex-direction: row;
	  }
	  .selected_mem{
	    background-color: #03A9F3;
	    color: white;
	  }
	  .app_mem_etc{
	    height: 100%;
	    width: 80px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	  }
	  .app_mem_etc:hover{
	    cursor: pointer;
	  }
	  .box_header{
	  	height: 20px;
	    font-weight: bold;
	    font-size: 15px;
	    text-align: center;
	    border-bottom: 1px solid lightgrey;
	  }
	  .app_mem{
	    width: 80%;
	    border: 1px solid lightgrey;
	    height: 100%;
	  }
	  .list-group .badge{display:none;}
	  .box_content_wrap{
	  	height:95%;
	  	overflow: auto;
	  }
	 
	 /*스크롤바 스타일*/  
   	.scrollmy{
   		overflow-y: auto; /* 세로 스크롤바 표시 */
    	overflow-x: hidden; /* 가로 스크롤바 숨기기 */
   	}
   	.scrollmy::-webkit-scrollbar {
	  	width: 6px;
		}
		.scrollmy::-webkit-scrollbar-thumb {
	 	  background-color: lightgrey;
		  border-radius: 5px;
		  height: 10px;
		}
  
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/memberSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
  <div class="card-body px-4 py-3">
    <div class="row align-items-center">
      <div class="col-9">
        <h4 class="fw-semibold mb-8">Chat</h4>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a class="text-muted text-decoration-none" href="../main/index.html"
                >Home</a
              >
            </li>
            <li class="breadcrumb-item" aria-current="page">Chat</li>
          </ol>
        </nav>
      </div>
      <div class="col-3">
        <div class="text-center mb-n5">
          
        </div>
      </div>
    </div>
  </div>
</div>

          <div class="card overflow-hidden chat-application">
            <div class="d-flex align-items-center justify-content-between gap-6 m-3 d-lg-none">
              <button class="btn btn-primary d-flex" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#chat-sidebar" aria-controls="chat-sidebar">
                <i class="ti ti-menu-2 fs-5"></i>
              </button>
              <form class="position-relative w-100">
                <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh"
                  placeholder="Search Contact" />
                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
              </form>
            </div>
            <div class="d-flex">
            
            <!-- 채팅방 목록 부분 -->
              <div class="w-30 d-none d-lg-block border-end user-chat-box">
                <div class="px-4 pt-9 pb-6">
                  <div class="d-flex align-items-center justify-content-between mb-3">
                    <div class="d-flex align-items-center">
                      <div class="position-relative">
                          <img src="${ contextPath }<c:out value='${loginUser.profileUrl}' default='/assets/images/profile/user-1.jpg'/>" class="rounded-circle" width="54" height="54"
	                      alt="" />
                        <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                          <span class="visually-hidden">New alerts</span>
                        </span>
                      </div>
                      <div class="ms-3">
                        <h6 class="fw-semibold mb-2">${loginUser.memName }</h6>
                        <p class="mb-0 fs-2">${loginUser.jobNo }</p>
                      </div>
                    </div>
                    <div class="dropdown">
                      <a class="text-dark fs-6 nav-icon-hover" href="javascript:void(0)" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="ti ti-dots-vertical"></i>
                      </a>
                      <ul class="dropdown-menu">
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2 border-bottom"
                            href="javascript:void(0)"><span><i class="ti ti-settings fs-4"></i></span>Setting</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2" href="javascript:void(0)"><span><i
                                class="ti ti-help fs-4"></i></span>Help
                            and feadback</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2" href="javascript:void(0)"><span><i
                                class="ti ti-layout-board-split fs-4"></i></span>Enable split View mode</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2 border-bottom"
                            href="javascript:void(0)"><span><i class="ti ti-table-shortcut fs-4"></i></span>Keyboard
                            shortcut</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2" href="javascript:void(0)"><span><i
                                class="ti ti-login fs-4"></i></span>Sign
                            Out</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <!--  
                  <form class="position-relative mb-4">
                    <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh"
                      placeholder="Search Contact" />
                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                  </form>
                  -->
                  <div style="padding-bottom: 10px; align-content: center; margin: auto;">
                  <a class="btn bg-secondary-subtle  text-secondary px-4 py-2" onclick="openModal('createChat')" style="font-size: 18px; display: flex; align-items: center; justify-content: center; width: 300px; margin: auto;">
		                <i class="ti ti-message-chatbot"  style="font-size: 24px;"></i>
		                &nbsp; 채팅하기
               		</a>
               		</div>
                  <div class="dropdown">
                    <a class="text-muted fw-semibold d-flex align-items-center" href="javascript:void(0)" role="button"
                      data-bs-toggle="dropdown" aria-expanded="false">
                      Recent Chats<i class="ti ti-chevron-down ms-1 fs-5"></i>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a class="dropdown-item" href="javascript:void(0)">Sort by time</a>
                      </li>
                      <li>
                        <a class="dropdown-item border-bottom" href="javascript:void(0)">Sort by Unread</a>
                      </li>
                      <!--  
                      <li>
                        <a class="dropdown-item" href="javascript:void(0)">Hide favourites</a>
                      </li>
                      -->
                    </ul>
                  </div>
                </div>
                <div class="app-chat">
                  <ul class="chat-users mb-0 list-mem scrollmy" >
                    <!--  목록 한개 부분 -->
                    <!--  
                    <li>
                      <a href="" onclick="openChat(event, 'chat1')"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user bg-light-subtle"
                        id="chat_user_1" data-user-id="1">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-2.jpg" alt="user1" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Michell Flintoff
                            </h6>
                            <span class="fs-3 text-truncate text-body-color d-block">You: Yesterdy was great...</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">15 mins</p>
                      </a>
                    </li>
                    -->
                    <!-- 목록 한개 부분 -->
                    
                    
                    
                   
                    
                  </ul>
                </div>
              </div>
              <!-- 채팅방 목록 끝 -->
              
              <!-- 기본 채팅부분 -->
               <div id="createChatBtn">
						      <div  style="text-align:center; padding: 200px; cursor: pointer;" onclick="openModal('createChat')"> 
						      	<p>
						      		<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" viewBox="0 0 24 24" fill="none" stroke="#618FFF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-message-plus">
											  <path stroke="none" d="M0 0h24v24H0z" fill="none" />
											  <path d="M8 9h8" />
											  <path d="M8 13h6" />
											  <path d="M12.01 18.594l-4.01 2.406v-3h-2a3 3 0 0 1 -3 -3v-8a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v5.5" />
											  <path d="M16 19h6" />
											  <path d="M19 16v6" />
											</svg> <br>
							        <button type="button" class="btn me-1 mb-1 sm-subtle text-info px-2 fs-4 " onclick="openModal('createChat')">
				                <b>채팅 만들기</b>
	             				</button>
             				</p>
             		  </div> 
						   </div>
              
              
              <!-- 채팅 부분 -->
              <div class="w-70 w-xs-100 chat-container" id="chat1">
                <div class="chat-box-inner-part h-100">
                  <div class="chat-not-selected h-100 d-none">
                    <div class="d-flex align-items-center justify-content-center h-100 p-5">
                      <div class="text-center">
                        <span class="text-primary">
                          <i class="ti ti-message-dots fs-10"></i>
                        </span>
                        <h6 class="mt-2">Open chat from the list</h6>
                      </div>
                    </div>
                  </div>
                  <div class="chatting-box d-block">
                    <div class="p-9 border-bottom chat-meta-user d-flex align-items-center justify-content-between ">
                     <div class="d-flex align-items-center memDetail memListscroll" style="display: flex; overflow-x: auto; white-space: nowrap; -ms-overflow-style: none; scrollbar-width: none; max-width: 634px;">
                      <div class="hstack gap-3 current-chat-user-name memDetail" >
                        <div class="position-relative" id="profileurl">
                          <img src="../assets/images/profile/user-2.jpg" alt="user1" width="48" height="48"
                            class="rounded-circle" />
                          <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                            <span class="visually-hidden">New alerts</span>
                          </span>
                        </div>
                        <div>
                          <h6 class="mb-1 name fw-semibold" id="chatMem"></h6>
                          <p class="mb-0" id="chatMemjob">Away</p>
                        </div>
                      </div>
                     </div>
                      
                      
                      <ul class="list-unstyled mb-0 d-flex align-items-center">
                     		 <li>
                          <a class="text px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5 button"
                             onclick="openChatMemList()"><i class="ti ti-user"></i></a>
                        </li>
                        <li>
                          <a class="text px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5 button"
                            href="javascript:void(0)" onclick="openModal('invite')"><i class="ti ti-user-plus"></i></a>
                        </li>
                        <!--  
                        <li>
                          <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                            href="javascript:void(0)"><i class="ti ti-video"></i></a>
                        </li>
                        -->
                        <li>
                          <a class="chat-menu text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                            href="javascript:void(0)">
                             <i class="ti ti-menu-2"></i>
                          </a>
                        </li>
                      </ul>
                    </div>
                    
                    <div class="d-flex parent-chat-box">
             <!-- 채팅방 부분 -->
                      <div class="chat-box w-xs-100">
                        <div class="chat-box-inner p-9 scrollmy" id="ongoing-tasks" >
                          <div class="chat-list chat active-chat"   data-user-id="1" >
                      		 <!-- 채팅부분 -->
                        
                            
                          </div>
                        </div>
                        
                        <div class="d-flex justify-content-between fileList_wrap " style=" display:none; ">
                        	<div> 
                        		
                        	</div>
	                        <div class="fileList_wrap chat-box " style=" display:none; width:200px;">
	                        	<div class="d-flex justify-content-between">
	                        		<div></div>
	                        		<div style="margin-right: 30px;">
		                        		<a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
	                                 id="closeBTN"><i class="ti ti-circle-x closeBTN"></i></a>
		                        		</div>
	                        	</div>
		                        	<ul id="fileList" class="file-list">
		                        		
		                        	</ul>
	                      	</div>
                        </div>
                        <!-- 채팅 푸터 시작 -->
                        <div class="px-9 py-6 border-top chat-send-message-footer">
                          <div class="d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-2 w-85">
                              <a class="position-relative nav-icon-hover z-index-5" href="javascript:void(0)">
                                <i class="ti ti-mood-smile text-dark bg-hover-primary fs-7"></i></a>
                              <input type="text" class="form-control message-type-box text-muted border-0 p-0 ms-2"
                                placeholder="Type a Message" fdprocessedid="0p3op" id="messageInput" />
                            </div>
                           
                            <ul class="list-unstyledn mb-0 d-flex align-items-center">
                              <li>
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                 id="attachFileButton2"><i class="ti ti-photo-plus"></i></a>
                              </li>
                              <li>
                             	  <input type="file" id="fileInput" style="display: none;" multiple name="uploadFiles">
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                  id="attachFileButton"><i class="ti ti-paperclip"></i></a>
                              </li>
                              <li>
                                <a id="sendFile" onclick="sendFile();"class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5">
																		<i class="ti ti-send"></i>                                
                                </a>
                              </li>
                            </ul>
                                  <!-- <i class="ti ti-microphone"></i> -->
                          </div>
                        </div>
                        <!--  채팅 푸터 끝 -->
                        
                    </div>
           <!-- 채팅방 부분 끝 -->
                      
                      <!-- 미디어 파일 부분 -->
                      <div class="app-chat-offcanvas border-start">
                        <div class="custom-app-scroll mh-n100 scrollmy" >
                          <div class="p-3 d-flex align-items-center justify-content-between">
                            <h6 class="fw-semibold mb-0 text-nowrap">
                              Media <span class="text-muted imgCount">(36)</span>
                            </h6>
                            <a class="chat-menu d-lg-none d-block text-dark fs-6 bg-hover-primary nav-icon-hover position-relative z-index-5"
                              href="javascript:void(0)">
                              <i class="ti ti-x"></i>
                            </a>
                          </div>
                          <div class="offcanvas-body p-9">
										
											<!-- 미디어 파일 div -->
                          <div class="row mb-7 text-nowrap imgArea"> 
                            <!-- 미디어 한개 -->
                              <!--  
                              <div class="col-4 px-1 mb-2">

                                <img src="../assets/images/products/product-1.jpg" width="88" height="65" alt=""
                                  class="rounded" />

                              </div>
                              -->
                            <!-- 한개 끝  -->
                             
                             
                              
                             

                          </div>
                        <!-- 미디어 끝 -->
                        
                        <!-- 파일 부분 -->
                            <div class="files-chat fileArea">
                              <h6 class="fw-semibold mb-3 text-nowrap">
                                Files <span class="text-muted fileCount">(36)</span>
                              </h6>
                            <!-- 파일 한개  -->
                            <!-- 
                              <a href="javascript:void(0)"
                                class="hstack gap-3 file-chat-hover justify-content-between text-nowrap mb-9">
                                <div class="d-flex align-items-center gap-3">
                                  <div class="rounded-1 text-bg-light p-6">
                                    <img src="../assets/images/chat/icon-adobe.svg" alt="" width="24"
                                      height="24" />
                                  </div>
                                  <div>
                                    <h6 class="fw-semibold">
                                      service-task.pdf
                                    </h6>
                                    <div class="d-flex align-items-center gap-3 fs-2 text-muted">
                                      <span>2 MB</span><span>2 Dec 2023</span>
                                    </div>
                                  </div>
                                </div>
                                <span class="position-relative nav-icon-hover download-file">
                                  <i class="ti ti-download text-dark fs-6 bg-hover-primary"></i>
                                </span>
                              </a>
                              -->
                           <!-- 파일한개 끝 -->
                              
                              
                              
                              
                            </div>
                          </div>
                        </div>
                      </div>
                       <!-- 미디어 파일 부분 끝 -->
                    </div>

                  </div>
                </div>
              </div>
              
              <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script> 
              <script>
              
		              
				      $(document).ready(function(){
				    	  ajaxChatRoomList();
				    	  
				    	 
				    	  
				    	  
				    		 // 참여자 목록 가로 스크롤링
			              var startX;
			              var scrollLeft;
		
			              document.querySelector('.memListscroll').addEventListener('mousedown', function(e) {
			                  startX = e.pageX - this.offsetLeft;
			                  scrollLeft = this.scrollLeft;
			                  this.style.cursor = 'grabbing';
			              });
		
			              document.querySelector('.memListscroll').addEventListener('mousemove', function(e) {
			                  if (!startX) return;
			                  e.preventDefault();
			                  const x = e.pageX - this.offsetLeft;
			                  const walk = (x - startX) * 2; // 스크롤 속도 조절
			                  this.scrollLeft = scrollLeft - walk;
			              });
		
			              document.querySelector('.memListscroll').addEventListener('mouseup', function() {
			                  startX = 0;
			                  this.style.cursor = 'grab';
			              });
		
			              document.querySelector('.memListscroll').addEventListener('mouseleave', function() {
			                  startX = 0;
			                  this.style.cursor = 'grab';
			              });
				    	  
			              
			           // 파일 첨부 버튼에 클릭 이벤트 리스너 추가
			              document.getElementById('attachFileButton').addEventListener('click', function() {
			              		// 파일 입력 필드 클릭
			                  document.getElementById('fileInput').click();
			              });
			              document.getElementById('attachFileButton2').addEventListener('click', function() {
			              		// 파일 입력 필드 클릭
			                  document.getElementById('fileInput').click();
			              });
			              
			          			
			              // 첨부파일 미리보기 
			              
			              	let totalSize = 0;
							
											$("#fileInput").change(function(evt){
												
													let fileNames = "";
													const files= evt.target.files;	// FileList {0:File, 1:File, 2:File, ..., length:x}
													
														for(let i=0; i<files.length; i++){
															if(files[i].size > 10*1024*1024){	// 첨부파일 한개의 크기가 10MB를 초과했을 경우
																alert("첨부파일의 최대 크기는 10MB까지 입니다.");
																evt.target.value="";
																return;
															}
															totalSize += files[i].size;
															if(totalSize > 100*1024*1024){// 누적된 첨부파일의 전체 크기가 100MB를 초과했을 경우
																alert("전체 첨부파일의 최대 크기는 100MB까지 입니다.");
																evt.target.value="";
																return;
															}
															
															fileNames += "<li>" + files[i].name + "</li>";
															
														}
														
														$("#fileList").html(fileNames);
														
														$(".fileList_wrap").css("display", (files.length > 0 ? "block" : "none" ));
														
												})
												
											/*
												const closeButton = document.getElementById('closeBTN');

								            closeButton.addEventListener('click', function() {
								                // 파일 목록을 감추기
								                document.querySelector('.fileList_wrap').style.display = 'none';

								                // 파일 입력 필드 비우기
								                const fileInput = document.getElementById('fileInput');
								                fileInput.value = ''; // 파일 입력 필드 초기화
								            });
								      */
								       
								            
					            document.getElementById('closeBTN').addEventListener('click', function() {
					            	// 파일 목록을 감추기
					            	$(".fileList_wrap").css("display", "none");
					                const fileInput = document.getElementById('fileInput');
					                fileInput.value = ''; // 파일 입력 필드 초기화
					            })
									
				    	  
				      }) // 레디fuction끝
              
				      
				      	
              
              
					   
					   		const sock = new SockJS("${contextPath}/chat"); // * 웹소켓서버와 연결됨 (=> ChatEchoHandler에 재정의해둔 afterConnectionEstablished의 메소드가 실행됨)
					   		sock.onmessage = onMessage;
					   		sock.onclose = onClose;
					   
					      // 메세지를 출력시키는 영역의 요소객체
					   		const $chatArea = $(".active-chat");
					      
					      // 전송하기 버튼 클릭시 실행되는 function
					      function sendMessage(){ // 사용자가 입력한 채팅메세지를 웹소켓으로 전송
					    	  let message = $("#messageInput").val(); // * websocket으로 메세지 전달(=> ChatEchoHandler의 handleMessage 메소드 실행)
					    	  let chatRoomNumber = window.chatRoomNumber; // 전역 변수에 저장된 채팅방 번호
					    	  
					    	  let chatData = "chat|" + chatRoomNumber + "|" + message;
					    	  sock.send(chatData);
					    	  
					    	  $("#messageInput").val("");
					    	  ajaxChatRoomList();
					      }
					      
					      // 나에게 메세지가 왔을 때 실행되는 function
					      function onMessage(evt){ // evt : 웹소켓에서 클라이언트에게 보내준 데이터
					    	  console.log("evt", evt);
					      	console.log("evt.data", evt.data); // new TextMessage객체로 보내준 텍스트에
					      	console.log("window", window.chatRoomNumber);
					      	
					      	let msgArr = evt.data.split("|"); // ["메세지유형(chat/entry/exit/file)", "메세지내용", "발신자아이디"]
					      	
					      	let $chatDiv = $("<div>"); // 채팅창에 append시킬 div요소 (각 조건에 따라 다르게 제작)
					      	
					      	if(msgArr[0] =="chat"){// 채팅메세지일 경우
					      		
					      		// 내가보낸메세지든 상대방이보낸메세지든 공통적으로 만들어야되는 요소작업
										$chatDiv.addClass("hstack gap-3 align-items-start mb-7")
														.addClass(msgArr[2] == "${loginUser.memName}${loginUser.jobNo}" ? "justify-content-end" : "justify-content-start") ;
										if ($chatDiv.hasClass("justify-content-end")) {
								            $chatDiv.append(
								              $("<div>").addClass("text-end")
								                .append($("<h6>").addClass("fs-2 text-muted").text(msgArr[3]))
								                .append($("<div>").addClass("p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3").text(msgArr[1]))
								            );
								          } else {
								            $chatDiv.append(
								              $("<img>").attr("src",  (msgArr[4] && msgArr[4] !== "null") ? "${contextPath}" + msgArr[4] : "${contextPath}/assets/images/profile/user-1.jpg" ).attr("alt", "user8").attr("width", "40").attr("height", "40").addClass("rounded-circle"),
								              $("<div>")
								                .append($("<h6>").addClass("fs-2 text-muted").text(msgArr[2] + ", " + msgArr[3] ))
								                .append($("<div>").addClass("p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3").text(msgArr[1]))
								            );
								          }
					      		
					      	}else if (msgArr[0] == "file") { // 파일 메시지인 경우
					            $chatDiv.addClass("hstack gap-3 align-items-start mb-7")
				                .addClass(msgArr[2] == "${loginUser.memName}${loginUser.jobNo}" ? "justify-content-end" : "justify-content-start");
				        
					      	
					            if (msgArr[5].toLowerCase().endsWith(".jpg") || 
					            	  msgArr[5].toLowerCase().endsWith(".jpeg") || 
					            	  msgArr[5].toLowerCase().endsWith(".png")) {// 이미지 파일인 경우
					            	
					                if ($chatDiv.hasClass("justify-content-end")) {
					                    $chatDiv.append(
					                        $("<div>").addClass("text-end")
					                                  .append($("<h6>").addClass("fs-2 text-muted").text(msgArr[3]))
					                                  .append($("<div>").addClass("p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3")
					                                  .append($("<a>").attr("href", "${contextPath}"+ msgArr[1]).attr("target", "_blank").attr("download", msgArr[5])
					                                                 .append($("<img>").attr("src", "${contextPath}/"+ msgArr[1]).attr("alt", "file").css("max-width", "400px").css("max-height", "450px"))))
					                    );
					                } else {
					                    $chatDiv.append(
					                    		$("<img>").attr("src", (msgArr[4] && msgArr[4] !== "null") ? "${contextPath}" + msgArr[4] : "${contextPath}/assets/images/profile/user-1.jpg" ).attr("alt", "user8").attr("width", "40").attr("height", "40").addClass("rounded-circle"),
					                        $("<div>")
					                            .append($("<h6>").addClass("fs-2 text-muted").text(msgArr[2] + ", " + msgArr[3]))
					                            .append($("<div>").addClass("p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3")
					                            .append($("<a>").attr("href", "${contextPath}"+ msgArr[1]).attr("download", msgArr[5])
					                            										.append( $("<img>").attr("src", "${contextPath}/"+ msgArr[1]).attr("alt", "file").css("max-width", "390px").css("max-height", "430px"))))
					                    );
					                }
					          
					      	
							      	}else{ // 이미지 파일이 아닌 경우 (다운로드 가능한 파일)
							      					if ($chatDiv.hasClass("justify-content-end")) {
											            $chatDiv.append(
											                $("<div>").addClass("text-end")
											                          .append($("<h6>").addClass("fs-2 text-muted").text(msgArr[3]))
											                          .append($("<div>").addClass("p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3")
											                          .append($("<a>").attr("href", "${contextPath}"+ msgArr[1]).attr("download", msgArr[5]).attr("target", "_blank").text(msgArr[5])))
											            );
											        } else {
											            $chatDiv.append(
											                $("<img>").attr("src", (msgArr[4] && msgArr[4] !== "null") ? "${contextPath}" + msgArr[4] : "${contextPath}/assets/images/profile/user-1.jpg").attr("alt", "user8").attr("width", "40").attr("height", "40").addClass("rounded-circle"),
											                $("<div>")
											                    .append($("<h6>").addClass("fs-2 text-muted").text(msgArr[2] + ", " + msgArr[3]))
											                    .append($("<div>").addClass("p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3")
											                    .append($("<a>").attr("href", "${contextPath}"+ msgArr[1]).attr("download", msgArr[5]).attr("target", "_blank").text(msgArr[5])))
											            );
											        }
									      	
							      	}
					      	
					      	
					      
					      	
					      	
					      	}	else { // 입장 또는 퇴장메세지일 경우
					      		
					      		/*
					      		<div class="chat-user entry">
					            xxx님이 들어왔습니다.
					         </div>
					         
					         <div class="chat-user exit">
					            xxx님이 나갔습니다.
					         </div>   
					      		*/
					      		$chatDiv.addClass("chat-user")
					      						.addClass(msgArr[0])
					      						.text(msgArr[1]);
					      		
					      	}
					      	
					      	$chatArea.append($chatDiv);
					      	const ongoingTasks = document.getElementById("ongoing-tasks");
					      	ongoingTasks.scrollTop = ongoingTasks.scrollHeight;
					      	
					      	//$chatArea.scrollTop($chatArea[0].scrollHeight); // 스크롤항상 하단으로 유지시켜주는 내용
					      	ajaxChatRoomList();
					      	
					      	if(window.chatRoomNumber != null){
					      		selectChatFiles(window.chatRoomNumber);
					      	}
					      	
					      }
					      
					      // 퇴장하기 클릭시 실행되는 function
					      function onClose(){
					    	  location.href = "${contextPath}";
					      }
					      
					      
				      	// 메세지 입력후 엔터치면 전송되는 function
				      	document.getElementById('messageInput').addEventListener('keyup', function(event) {
				      		
				          if (event.key === 'Enter') {
				            sendMessage();
				          }
				         
				        });
					      
					      
								// 채팅방 보이기 
					      function openChat(event, chatId, chroNo, chatMem, profileUrl, jobName) {
					            event.preventDefault();
					            console.log(chroNo);
					            $chatArea.empty();
        		          window.chatRoomNumber = chroNo;
					            
					            // 모든 채팅 상세보기 숨기기
					            var chats = document.getElementsByClassName('chat-container');
					            for (var i = 0; i < chats.length; i++) {
					                chats[i].classList.remove('active');
					            }
					            
					            // 클릭한 채팅 상세보기 보이기
					            var chat = document.getElementById(chatId);
					            chat.classList.add('active');
					            
											// 채팅 상대방프로필 이름 가져오기
											//var profileImageUrl = profileUrl ? profileUrl : '/assets/images/profile/user-1.jpg';
											//document.querySelector('#profileurl img').src = "${contextPath}" + profileImageUrl;
											//document.querySelector('#profileurl img').src = "${contextPath}" +  (profileUrl ? profileUrl : '/assets/images/profile/user-1.jpg');
											//document.getElementById('chatMem').textContent = chatMem;
											//document.getElementById('chatMemjob').textContent = jobName;
									
											
					            // 채팅 만들기 div 숨기기
					            document.getElementById('createChatBtn').style.display = 'none';
					            
					            // 채팅 내용 조회해오기
					            $.ajax({
			        		        url: "${contextPath}/chat/selectChat.do",
			        		        type: "get",
			        		        data: {chroNo:chroNo},
			        		        success: function(response) {
			        		            // 새로운 채팅방이 성공적으로 생성되면 실행될 작업
			        		            // 예를 들어, 채팅창으로 이동하는 코드를 이곳에 작성합니다.
			        		            // console.log("채팅내역:", response);
			        		            
												      	
			        		          for(let i = 0; i<response.length; i++){  
			        		            let $chatDiv = $("<div>"); // 채팅창에 append시킬 div요소 (각 조건에 따라 다르게 제작)
				        		          console.log("채팅방번호:", response[i].chroNo);
			        		            
					        		            if(response[i].chContent.startsWith("/resources")){ // 파일 메세지일 경우
					        		            
					        		            		let contentParts = response[i].chContent.split(";");
					        		                let filePath = contentParts[0];
					        		                let originalName = contentParts[1];
					        		                
					        		                
							        		            	 if (response[i].chContent.toLowerCase().endsWith(".jpg") || 
							        		            			 response[i].chContent.toLowerCase().endsWith(".jpeg") || 
							        		            			 response[i].chContent.toLowerCase().endsWith(".png")) {// 이미지 파일인 경우
							   					            	
							        		            		 		if('${loginUser.memNo}' == response[i].memNo){ // 내 메세지일경우
							        		            		 			$chatDiv.addClass("hstack gap-3 align-items-start mb-7")
																												.addClass("justify-content-end") ; 
																      					$chatDiv.append(
																			              $("<div>").addClass("text-end")
																			                .append($("<h6>").addClass("fs-2 text-muted").text(response[i].chDate))
																			                .append($("<div>").addClass("p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3")
																			                		.append($("<a>").attr("href", "${contextPath}"+ filePath ).attr("download", originalName).attr("target", "_blank")
																			                				.append($("<img>").attr("src", "${contextPath}"+ filePath).attr("alt", "file").css("max-width", "400px").css("max-height", "450px"))))
																			            );
																			            $chatArea.append($chatDiv); 
							        		            		 			
									   					                } else {
									   					                	$chatDiv.addClass("hstack gap-3 align-items-start mb-7")
																												.addClass("justify-content-start") ;
																							      		 $chatDiv.append(
																									              $("<img>").attr("src", "${contextPath}"+ (response[i].profileUrl ? response[i].profileUrl : '/assets/images/profile/user-1.jpg')).attr("alt", "user8").attr("width", "40").attr("height", "40").addClass("rounded-circle"),
																									              $("<div>")
																									                .append($("<h6>").addClass("fs-2 text-muted").text(response[i].memName + response[i].jobName + ", " + response[i].chDate ))
																									                .append($("<div>").addClass("p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3")
																									                		.append($("<a>").attr("href", "${contextPath}"+ filePath).attr("download", originalName).attr("target", "_blank")
																									                				.append( $("<img>").attr("src", "${contextPath}/"+ filePath).attr("alt", "file").css("max-width", "390px").css("max-height", "430px"))))
																									            );
																							      		$chatArea.append($chatDiv);
									   					                	
									   					                }
							   					          
							   					      	
							   							      		}else{ // 이미지 파일이 아닌 경우 (다운로드 가능한 파일)
							   							      		
							   							      					if('${loginUser.memNo}' == response[i].memNo){ // 내 메세지일경우
									   							      					$chatDiv.addClass("hstack gap-3 align-items-start mb-7")
																													.addClass("justify-content-end") ; 
									   							      					$chatDiv.append(
																				              $("<div>").addClass("text-end")
																				                .append($("<h6>").addClass("fs-2 text-muted").text(response[i].chDate))
																				                .append($("<div>").addClass("p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3")
																				                		.append($("<a>").attr("href", "${contextPath}"+ filePath ).attr("download", originalName).attr("target", "_blank").text(originalName)))
																				            );
																				            $chatArea.append($chatDiv);
							   							      					
							   							      						
							   											        } else {
							   											        	$chatDiv.addClass("hstack gap-3 align-items-start mb-7")
																												.addClass("justify-content-start") ;
																							      		 $chatDiv.append(
																									              $("<img>").attr("src", "${contextPath}"+ (response[i].profileUrl ? response[i].profileUrl : '/assets/images/profile/user-1.jpg')).attr("alt", "user8").attr("width", "40").attr("height", "40").addClass("rounded-circle"),
																									              $("<div>")
																									                .append($("<h6>").addClass("fs-2 text-muted").text(response[i].memName + response[i].jobName + ", " + response[i].chDate ))
																									                .append($("<div>").addClass("p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3")
																									                		.append($("<a>").attr("href", "${contextPath}"+ filePath).attr("download", originalName).attr("target", "_blank").text(originalName)))
																									            );
																							      		$chatArea.append($chatDiv);
							   											        	   
							   											        }
							   									      	
							   							      	}
					        		            	
					        		            	
					        		            	
					        		            }else{ // 텍스트 메세지일경우
					        		            
								        		            if('${loginUser.memNo}' == response[i].memNo){ // 내 메세지일경우
																	      		
																						$chatDiv.addClass("hstack gap-3 align-items-start mb-7")
																										.addClass("justify-content-end") ;
																					
																				            $chatDiv.append(
																				              $("<div>").addClass("text-end")
																				                .append($("<h6>").addClass("fs-2 text-muted").text(response[i].chDate))
																				                .append($("<div>").addClass("p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3").text(response[i].chContent))
																				            );
																				            $chatArea.append($chatDiv);
																	      		
																	      	}else { // 다른사람 메세지일경우
																	      		$chatDiv.addClass("hstack gap-3 align-items-start mb-7")
																										.addClass("justify-content-start") ;
																					      		 $chatDiv.append(
																							              $("<img>").attr("src", "${contextPath}"+ (response[i].profileUrl ? response[i].profileUrl : '/assets/images/profile/user-1.jpg')).attr("alt", "user8").attr("width", "40").attr("height", "40").addClass("rounded-circle"),
																							              $("<div>")
																							                .append($("<h6>").addClass("fs-2 text-muted").text(response[i].memName + response[i].jobName + ", " + response[i].chDate ))
																							                .append($("<div>").addClass("p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3").text(response[i].chContent))
																							            );
																					      		$chatArea.append($chatDiv);
																	      	}
			        		           			}
			        		          } // for문 끝
			        		          //$chatArea.append($chatDiv);
			        		          //$chatArea.scrollTop = $chatArea.scrollHeight;
			        		          const ongoingTasks = document.getElementById("ongoing-tasks");
								      			ongoingTasks.scrollTop = ongoingTasks.scrollHeight;
			        		          
			        		        },
			        		        error: function(xhr, status, error) {
			        		            // AJAX 요청이 실패한 경우 실행될 작업
			        		        }
			        		    });
					            
					            
					            
					            // 첨부파일 목록 가져오기
					            selectChatFiles(chroNo);
					            
					            // 채팅 참여자 목록 가져오기
					            selectChatMem(chroNo);	 
					            
					        }

					        
					        // 새 채팅방 만들기
					        function newChat(){
					        		document.getElementById('chat1').classList.add('active');
					        		document.getElementById('createChatBtn').style.display = 'none';
					        		resetEnrollLineModal();
					        		$("#app_line_modal").modal("hide");
					        		
					        		$.ajax({
					        		        url: "${contextPath}/chat/createChatRoom.do",
					        		        type: "post",
					        		        data: $("#appForm").serialize(),
					        		        success: function(response) {
					        		            // 새로운 채팅방이 성공적으로 생성되면 실행될 작업
					        		            // 예를 들어, 채팅창으로 이동하는 코드를 이곳에 작성합니다.
					        		            console.log("채팅방번호:", response);
					        		            window.chatRoomNumber = response;
					        		            ajaxChatRoomList();
					        		            openChat(event, 'chat1', response, '','','');
					        		        },
					        		        error: function(xhr, status, error) {
					        		            // AJAX 요청이 실패한 경우 실행될 작업
					        		        }
					        		    });
					        		
					        }
					        
					        
					        // 초대하기 
					        function inviteMem(){
					        	
					        	var form = document.getElementById("appForm");
				            var input = document.createElement("input");
				            input.type = "hidden";
				            input.name = "chroNo";
				            input.value = window.chatRoomNumber;
				            form.appendChild(input);
					        	
				            $("#appForm input").each(function() {
				                console.log($(this).val());
				            });
					        	
					        	$.ajax({
			        		        url: "${contextPath}/chat/addChatMem.do",
			        		        type: "post",
			        		        data: $("#appForm").serialize(),
			        		        success: function(response) {
			        		        // 채팅자 목록 조회해오기
			        		        ajaxChatRoomList();
			        		        selectChatMem(window.chatRoomNumber);	 
							            
			        		        },
			        		        error: function(xhr, status, error) {
			        		            // AJAX 요청이 실패한 경우 실행될 작업
			        		        }
			        		    });
					        	
					        }
					        
					      
					        // 채팅창 참여자 목록 조회해오는 함수
					        function selectChatMem(chroNo){
					        // 채팅자 목록 조회해오기
					            $.ajax({
					                url: "${contextPath}/chat/chatRoomMem.do", 
					                type: "get",
					                data: { chroNo: chroNo }, 
					                success: function(result) {
					                	// console.log(result);
					                	var chatList = document.querySelector(".memDetail");  
					                	chatList.innerHTML = "";
					                	
					                    result.forEach(function(member) {
					                        if ( member.memNo !== ${loginUser.memNo}) { // 로그인 멤버는 제외
					                        	 // div 요소 생성
					                            var chatUserDiv = document.createElement("div");
					                            chatUserDiv.className = "hstack gap-3 current-chat-user-name";

					                            // 이미지 및 뱃지 요소 생성
					                            var imgDiv = document.createElement("div");
					                            imgDiv.className = "position-relative";
					                            var img = document.createElement("img");
					                            img.src = "${contextPath}" + (member.profileUrl ? member.profileUrl : '/assets/images/profile/user-1.jpg');
					                            img.alt = member.memName;
					                            img.width = 48;
					                            img.height = 48;
					                            img.className = "rounded-circle";
					                            var badgeSpan = document.createElement("span");
					                            badgeSpan.className = "position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success";
					                            var visuallyHiddenSpan = document.createElement("span");
					                            visuallyHiddenSpan.className = "visually-hidden";
					                            visuallyHiddenSpan.textContent = "New alerts";
					                            badgeSpan.appendChild(visuallyHiddenSpan);
					                            imgDiv.appendChild(img);
					                            imgDiv.appendChild(badgeSpan);

					                            // 이름 및 상태 요소 생성
					                            var textDiv = document.createElement("div");
					                            var nameH6 = document.createElement("h6");
					                            nameH6.className = "mb-1 name fw-semibold";
					                            nameH6.textContent = member.memName;
					                            var statusP = document.createElement("p");
					                            statusP.className = "mb-0";
					                            statusP.textContent = member.jobNo; // 멤버 상태 정보를 여기에 추가할 수 있음

					                            // div에 이미지, 이름, 상태 추가
					                            textDiv.appendChild(nameH6);
					                            textDiv.appendChild(statusP);

					                            // chatUserDiv에 이미지, 이름, 상태 div 추가
					                            chatUserDiv.appendChild(imgDiv);
					                            chatUserDiv.appendChild(textDiv);

					                            // chatList에 chatUserDiv 추가
					                            //chatList.insertAdjacentElement('afterend', chatUserDiv);
					                            chatList.append(chatUserDiv);
					                        }
					                    })
					                  }
					               });
					       	}
					        
					        
					     
					      
					      // 채팅방 목록 조회용
					      function ajaxChatRoomList() {
								
					    	  $.ajax({
					    		  url:"${contextPath}/chat/chatRoomList.do",
					    		  type:"get",
					    		  data:"memNo=${loginUser.memNo}",
					    		  success:function(result){
					    			  console.log(result); // [{}, {}, {}]
					    			  
					    			  // 채팅방 목록을 표시할 요소 선택
					    	            var chatList = document.querySelector(".chat-users");
					    	            chatList.innerHTML = ""; // 목록 초기화

					    	            // 각 채팅방에 대한 정보를 반복하여 처리
					    	            result.forEach(function(room) {
					    	            	console.log(room.memberList);
					    	                // 각 채팅방에 대한 HTML 생성
					    	             if (room.memberList && room.memberList.length > 0) {
					    	            	 var firstMember = room.memberList[0];
					    	               var MembersCount = room.memberList.length - 1;
					    	            	 
					    	            	 var listItem = document.createElement("li");
					    	            	    var anchor = document.createElement("a");
					    	            	    anchor.href = "#";
					    	            	    anchor.setAttribute("onclick", "openChat(event, 'chat1', " + room.chroNo + ",'"+ firstMember.memName + "','" + firstMember.profileUrl + "','"+ firstMember.jobNo +"')");
					    	            	    anchor.className = "px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user ";
					    	            	    anchor.setAttribute("data-user-id", room.chroNo);

					    	            	    var innerDiv = document.createElement("div");
					    	            	    innerDiv.className = "d-flex align-items-center";

					    	            	    var positionSpan = document.createElement("span");
					    	            	    positionSpan.className = "position-relative";

					    	            	    var img = document.createElement("img");
					    	            	    var proUrl = firstMember.profileUrl ? firstMember.profileUrl : '/assets/images/profile/user-1.jpg';
					    	            	    img.src = "${contextPath}" +  proUrl;
					    	            	    img.alt = "user1";
					    	            	    img.width = "48";
					    	            	    img.height = "48";
					    	            	    img.className = "rounded-circle";

					    	            	    var badgeSpan = document.createElement("span");
					    	            	    badgeSpan.className = "position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success";

					    	            	    var visuallyHiddenSpan = document.createElement("span");
					    	            	    visuallyHiddenSpan.className = "visually-hidden";
					    	            	    visuallyHiddenSpan.textContent = "New alerts";

					    	            	    var msDiv = document.createElement("div");
					    	            	    msDiv.className = "ms-3 d-inline-block w-75";

					    	            	    var h6 = document.createElement("h6");
					    	            	    h6.className = "mb-1 fw-semibold chat-title";
					    	            	    h6.setAttribute("data-username", firstMember.memName);
					    	            	    h6.textContent = firstMember.memName +" "+ firstMember.jobNo + (MembersCount > 0 ? " 외 " + MembersCount + "명" : "");

					    	            	    var messageSpan = document.createElement("span");
					    	            	    messageSpan.className = "fs-3 text-truncate text-body-color d-block";
					    	            	    
					    	            	    let lastMsg = room.lastMsg;
					    	            	    if (lastMsg && lastMsg.startsWith("/resources")) {
					    	            	        // /resources로 시작하는 경우 ;로 분리하여 originalName만 추출
					    	            	        let msgParts = lastMsg.split(";");
					    	            	        if (msgParts.length > 0) {
					    	            	        	//messageSpan.textContent = msgParts[1]; // originalName
					    	            	        	let originalName = msgParts[1];
					    	            	        	messageSpan.textContent = originalName.length > 12 ? originalName.substring(0, 12) + "..." : originalName;
					    	            	        } else {
					    	            	        	//messageSpan.textContent = lastMsg; // 분리할 수 없는 경우 전체 메시지를 사용
					    	            	        	messageSpan.textContent = lastMsg.length > 12 ? lastMsg.substring(0, 12) + "..." : lastMsg;
					    	            	        	  
					    	            	        }
					    	            	    } else {
					    	            	        // 그렇지 않은 경우 전체 메시지를 사용
					    	            	    	if(lastMsg == null){
					    	            	    		messageSpan.textContent = "";
					    	            	    	}else{
					    	            	    			//messageSpan.textContent = lastMsg;
					    	            	    	 	messageSpan.textContent = lastMsg.length > 12 ? lastMsg.substring(0, 12) + "..." : lastMsg;
					    	            	    	}
					    	            	    }
					    	            	    

					    	            	    var timeP = document.createElement("p");
					    	            	    timeP.className = "fs-2 mb-0 text-muted";
					    	            	    timeP.textContent = room.msgDate;

					    	            	    badgeSpan.appendChild(visuallyHiddenSpan);
					    	            	    positionSpan.appendChild(img);
					    	            	    positionSpan.appendChild(badgeSpan);
					    	            	    innerDiv.appendChild(positionSpan);
					    	            	    innerDiv.appendChild(msDiv);
					    	            	    msDiv.appendChild(h6);  // h6을 msDiv에 추가
					    	            	    msDiv.appendChild(messageSpan);  
					    	            	    anchor.appendChild(innerDiv);
					    	            	    anchor.appendChild(timeP);
					    	            	    listItem.appendChild(anchor);

					    	            	    // 채팅방 목록에 추가
					    	            	    chatList.appendChild(listItem);
					    	             	}
					    	            	});
					    	        },
					    		  error:function(){
											console.log("채팅방조회용 ajax 통신 실패");
										}
					    	  })
					    	
								}
					      
					      
					   
					      // 모달 오픈용 
					      function openModal(action) {
					    	  
							    // 모달 요소 선택
					    	  var myModal = new bootstrap.Modal(document.getElementById('app_line_modal'), {
					    	        keyboard: false
					    	    });
							    var modalConfirmButton = document.getElementById("modalConfirmButton");
							
									 // 현재 작업 설정
							    currentAction = action;
							    
							    // 각 액션에 따른 모달 내용 설정
							    if (action === 'createChat') {
							    	modalConfirmButton.textContent = "채팅 만들기";
							    } else if (action === 'invite') {
							    	modalConfirmButton.textContent = "초대하기";
							    }
							
							    // 모달 표시
							    myModal.show();
								}
					      
					    // 채팅참여자 모달 
					    function openChatMemList(){
					    	
					    	var myModal = new bootstrap.Modal(document.getElementById('chatMemList'), {
				    	        keyboard: false
				    	    });
					                	var chatList = document.querySelector(".detail_chatmem");  
					                	chatList.innerHTML = "";
					    	 $.ajax({
					                url: "${contextPath}/chat/chatRoomMem.do", 
					                type: "get",
					                data: { chroNo: window.chatRoomNumber }, 
					                success: function(result) {
					                	console.log(result);
					                	
				                	 // 참여자 수 업데이트
				                    var chatMemCountSpan = document.querySelector(".chatMemCount");
				                    chatMemCountSpan.textContent = result.length;
					                    
					                	
					                	
					                    result.forEach(function(member) {
					                        if ( member.memNo !== ${loginUser.memNo}) { // 로그인 멤버는 제외
					                        	 // div 요소 생성
					                            var chatUserDiv = document.createElement("div");
					                            chatUserDiv.className = "hstack gap-3 current-chat-user-name";

					                            // 이미지 및 뱃지 요소 생성
					                            var imgDiv = document.createElement("div");
					                            imgDiv.className = "position-relative";
					                            var img = document.createElement("img");
					                            img.src = "${contextPath}" + (member.profileUrl ? member.profileUrl : '/assets/images/profile/user-1.jpg');
					                            img.alt = member.memName;
					                            img.width = 48;
					                            img.height = 48;
					                            img.className = "rounded-circle";
					                            var badgeSpan = document.createElement("span");
					                            badgeSpan.className = "position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success";
					                            var visuallyHiddenSpan = document.createElement("span");
					                            visuallyHiddenSpan.className = "visually-hidden";
					                            visuallyHiddenSpan.textContent = "New alerts";
					                            badgeSpan.appendChild(visuallyHiddenSpan);
					                            imgDiv.appendChild(img);
					                            imgDiv.appendChild(badgeSpan);

					                            // 이름 및 상태 요소 생성
					                            var textDiv = document.createElement("div");
					                            var nameH6 = document.createElement("h6");
					                            nameH6.className = "mb-1 name fw-semibold";
					                            nameH6.textContent = member.memName;
					                            var statusP = document.createElement("p");
					                            statusP.className = "mb-0";
					                            statusP.textContent = member.jobNo; // 멤버 상태 정보를 여기에 추가할 수 있음

					                            // div에 이미지, 이름, 상태 추가
					                            textDiv.appendChild(nameH6);
					                            textDiv.appendChild(statusP);

					                            // chatUserDiv에 이미지, 이름, 상태 div 추가
					                            chatUserDiv.appendChild(imgDiv);
					                            chatUserDiv.appendChild(textDiv);

					                            // chatList에 chatUserDiv 추가
					                            //chatList.insertAdjacentElement('afterend', chatUserDiv);
					                            chatList.append(chatUserDiv);
					                        }
					                    })
					                  }
					               });
					    	 myModal.show();
					    }
						
						// 첨부파일 전송
						function sendFile(){
								// 선택된 파일 가져오기
						    var files = document.getElementById('fileInput').files;
						    
						    // FormData 생성
						    var formData = new FormData();
						    
						    // 파일을 FormData에 추가
						    for (var i = 0; i < files.length; i++) {
						        formData.append('uploadFiles', files[i]);
						    }
						    
						    // 채팅방 번호도 FormData에 추가 
						    formData.append('boardNo', window.chatRoomNumber);
							
							
									$.ajax({
				                url: "${contextPath}/chat/uploadChatFile.do", 
				                type: "post",
				                data: formData,
				                processData: false, 
				                contentType: false,
				                success: function(result) {
				                	 if (result && result.length > 0) {
				                         result.forEach(fileInfo => {
				                             let fileUrl = fileInfo.filePath +"/"+ fileInfo.filesystemName  ;
				                             let msg = "file|" + window.chatRoomNumber + "|" + fileUrl + "|" + fileInfo.originalName;
				                             sock.send(msg);
				                         });
				                     } else {
				                         console.log("파일 업로드 실패");
				                     }
				                	
				                }
				          });
									$(".fileList_wrap").css("display", "none");
									window.chatRoomNumber = window.chatRoomNumber ;
							
									ajaxChatRoomList();
						}
						
						
					
								function selectChatFiles(chroNo){
									console.log("파일조회",chroNo);
									 // 첨부파일 전체 조회해오기
						            $.ajax({
						            	url:"${contextPath}/chat/selectChatFile.do",
						            	type:"get",
						            	data:{refNo:chroNo},
						            	success:function(result){
						            		console.log("첨부파일", result);
						            		
						            		let imgAreaDiv = $(".imgArea"); // imgArea 클래스를 가진 div를 선택
						            		let fileAreaDiv = $(".fileArea"); // 
						            		
						            		imgAreaDiv.empty();
						            		fileAreaDiv.empty();
						            		
						            		// 파일 관련 정보를 나타내는 <h6> 요소 생성
						            		let fileHeader = $("<h6>").addClass("fw-semibold mb-3 text-nowrap")
						            		                           .text("Files ")
						            		                           .append($("<span>").addClass("text-muted fileCount").text("(0)"));

						            		// fileDiv에 생성한 <h6> 요소 추가
						            		fileAreaDiv.append(fileHeader);
						            		
	   					            	let imgCount = 0;
	   					            	let fileCount = 0;
	   					            	
						            		 for(let i = 0; i<result.length; i++){  
						            				 if (result[i].originalName.toLowerCase().endsWith(".jpg") || 
						            					 	 result[i].originalName.toLowerCase().endsWith(".jpeg") || 
						            					 	 result[i].originalName.toLowerCase().endsWith(".png")) {// 이미지 파일인 경우
						            					 		
						            				        let newImgDiv = $("<div>").addClass("col-4 px-1 mb-2") 
						            				        									.append($("<a>").attr("href", "${contextPath}"+ result[i].filePath + "/" + result[i].filesystemName ).attr("download", result[i].originalName).attr("target", "_blank")
								            				                          .append($("<img>").attr({
								            				                              "src": "${contextPath}" + result[i].filePath + "/" +result[i].filesystemName ,
								            				                              "width": "88",
								            				                              "height": "65",
								            				                              "alt": ""
								            				                          }).addClass("rounded"))); // img 요소 추가 및 속성 설정

						            				        imgAreaDiv.append(newImgDiv); // imgArea div에 새로운 div를 추가
						            					 
						            					 			imgCount += 1;
				        		            		 		
				   					          
				   					      	
				   							      		}else{ // 이미지 파일이 아닌 경우 (다운로드 가능한 파일)
						   							      		let fileExtension = result[i].originalName.split('.').pop().toLowerCase(); // 파일 확장자 추출
						   							         
						   							         // 확장자에 따른 아이콘 설정
						   							         let iconSrc = "";
						   							         switch (fileExtension) {
						   							             case 'pdf':
						   							                 iconSrc = "../assets/images/chat/icon-adobe.svg";
						   							                 break;
						   							             case 'zip':
						   							                 iconSrc = "../assets/images/chat/icon-zip-folder.svg";
						   							                 break;
							   							           case 'xls':
							   						             case 'xlsx':
							   						             case 'ppt':
							   						             case 'pptx':
							   						                 iconSrc = "../assets/images/chat/icon-figma.svg";
							   						                 break;
								   						           case 'html':
								   					             case 'htm':
								   					             case 'php':
								   					             case 'asp':
								   					             case 'aspx':
								   					                 iconSrc = "../assets/images/chat/icon-chrome.svg";
								   					                 break;
						   							             default:
						   							                 iconSrc = "../assets/images/chat/icon-adobe.svg"; // 기본 아이콘
						   							                 break;
						   							         }
				   							      		
						   							      let date = new Date(result[i].uploadDate);
						   						        
						   						        // 날짜를 "dd MM yyyy" 형식으로 포맷팅
						   						        let options = { day: '2-digit', month: '2-digit', year: 'numeric' };
																	let formattedDate = date.toLocaleDateString('ko-KR', options);
				   							      		
				   							      				
				   							      		let newFileLink = $("<a>").attr("href", "${contextPath}" + result[i].filePath + "/" +result[i].filesystemName)
																	   							      		.addClass("hstack gap-3 file-chat-hover justify-content-between text-nowrap mb-9")
																	   							      		.attr("download", result[i].originalName)
												   			                            .append(
												   			                                $("<div>").addClass("d-flex align-items-center gap-3")
												   			                                    .append(
												   			                                        $("<div>").addClass("rounded-1 text-bg-light p-6")
												   			                                            .append(
												   			                                                $("<img>").attr({
												   			                                                    "src": iconSrc,
												   			                                                    "alt": "",
												   			                                                    "width": "24",
												   			                                                    "height": "24"
												   			                                                })
												   			                                            )
												   			                                    )
													   			                                    .append(
													   			                                        $("<div>")
													   			                                            .append(
													   			                                                $("<h6>").addClass("fw-semibold").text(result[i].originalName)
													   			                                            )
													   			                                            .append(
													   			                                                $("<div>").addClass("d-flex align-items-center gap-3 fs-2 text-muted")
													   			                                                   // .append($("<span>").text("2 MB"))
													   			                                                    .append($("<span>").text(formattedDate))
													   			                                            )
													   			                                    )
													   			                            )
													   			                            .append(
													   			                                $("<span>").addClass("position-relative nav-icon-hover download-file")
													   			                                    .append(
													   			                                        $("<i>").addClass("ti ti-download text-dark fs-6 bg-hover-primary")
													   			                                    )
													   			                            );

				   			        										fileAreaDiv.append(newFileLink); //
				   							      							fileCount += 1;
				   									      	
				   							      		}
						            		 
						            		 }
						            					 $(".imgCount").text("(" + imgCount + ")");
						            					 $(".fileCount").text("(" + fileCount + ")");
						            		 
						            		
						            		
						            	},error:function(){
														console.log("첨부파일 조회용 ajax 통신 실패");
													}
						            	
						            });
						            
									
								}		
								
										

						        
											      
					      
					      
					      
					      
					      
					      
					   </script>
					   
					   
					   
					   
		<!-- 채팅자 목록 모달창 -->
          <div class="modal" id="chatMemList">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">채팅 참여자 목록</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                	<input type="hidden" name="calNo" value="">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="100px">인원수</th>
                        <td>
                          <span id="ctgName"></span>
                          <button id="shareListBtn" class="btn btn-sm rounded-circle btn-light">
                          	<i class="ti ti-user"></i>
                         	</button> &nbsp;
                          	<span class="chatMemCount"></span>명
                        </td> 
                      </tr>
                      <tr>
                        <th>참여자</th>
                        <td><div class="detail_chatmem scrollmy"></div></td>
                      </tr>
                      
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer justify-content-center">
                  
               
                  <div class="onlyConfirmBtn" >
                  	<button type="button" class="btn bg-info-subtle text-info" data-bs-dismiss="modal">확인</button>
                  </div>
                </div>

              </div>
            </div>
          </div>			   
              
              
              
              
    <!-- modal content -->
    <div class="modal fade" id="app_line_modal" tabindex="-1"
      aria-labelledby="bs-example-modal-lg" aria-hidden="true">
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header d-flex align-items-center border-bottom">
            <h4 class="modal-title fw-semibold" id="myLargeModalLabel">
              사원 목록
            </h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
              aria-label="Close"></button>
          </div>
          <div class="modal-body mx-4 my-2">
          	<!-- 자주쓰는 결재선에 이식
            <div class="mb-4 pb-4 row align-items-center border-bottom">
              <label for="" class="form-label fw-semibold col-sm-2 col-form-label fs-4">결재선 이름</label>
              <div class="col-sm-7">
                <input type="text" class="form-control">
              </div>
            </div>
             -->
            <form class="input-group mb-3">
              <div class="col-3">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="이름/부서명을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
                  <button class="btn btn-outline-secondary me-2">검색</button>
                </div>
              </div>
              <span class="mx-2">
                <div class="custom-control py-2 custom-radio">
                  <input type="radio" id="customRadio1" name="customRadio" class="form-check-input" />
                  <label class="form-check-label" for="customRadio1">이름으로 검색</label>
                </div>
              </span>
              <span class="mx-2">
                <div class="custom-control py-2 custom-radio">
                  <input type="radio" id="customRadio2" name="customRadio" class="form-check-input" />
                  <label class="form-check-label" for="customRadio2">학과로 검색</label>
                </div>
              </span>
            </form>
            <div class="d-flex flex-row">
            	<div class="me-2 list_box_wrap">
            		<div class="my-1 text-end" style="height: 35px"></div>
	              <div class="mem_list_box">
	                <div class="box_header">부서목록</div>
	                <div id="myTreeview" class="box_content_wrap"></div>
	              </div>
              </div>
              <div class="list_box_wrap">
              	<div class="my-1 text-end" style="height: 35px">
              		<button class="btn text-info fw-semibold" onclick="selectAllMem(this);">전체선택</button>
              	</div>
	              <div class="mem_list_box">
	                <div class="box_header">직원목록</div>
	                <div class="mem_list my_mem_list box_content_wrap" style="overflow-y: auto">
	                  
	                </div>
	              </div>
              </div>
              <div class="selected_app_mem list_box_wrap">
              	<div class="my-1" style="display: block; height: 35px; text-align:right;">
              		<button class="btn btn-light fw-semibold" onclick="resetEnrollLineModal();">초기화</button>
              	</div>
              
                <div style="height: 400px;">
                  <div class="app_mem_etc">
                    <div>
                      <div class="mb-2 add_receiver" onclick="addAppMember('receiver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                      <div class="remove_receiver" onclick="removeAppMember('receiver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                    </div>
                  </div>
                  <div class="app_receiver app_mem">
                    <div class="box_header">수신자</div>
                    <div class="mem_list">
                    
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="modal-footer justify-content-center pb-4 pt-7">
          <form id="appForm" method="post" >
            <button type="button" class="btn btn-primary waves-effect text-start"  id="modalConfirmButton"
              onclick="confirmAppLine();">
              확인
            </button>
            <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start"
              data-bs-dismiss="modal">
              닫기
            </button>
          </form>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
    
    <script>
    	
    	// treeview의 부서 목록 전역변수
    	let majorTree = [];
    	var currentAction = null; // 현재 모달의 작업을 저장하는 변수
    	
    	$(document).ready(function(){
    		
    		// test용 버튼 이벤트
        $("#testtest").on("click", function(){
        	$("#appForm>input[name='approver']").remove();
        })
        
        
        
        
        
        
        // 기안 결재선에 현재날짜 표시
				$(".sign_area>.drafter>label").text(getCurrentDate());
    		
    		// 결재선 선택 모달용 javascript **************************************
    		// 부서목록 리스트 조회
    		createMajorList();
    		
	    	// 부서 선택 시 직원 목록 조회
 				
	    	
    	}) //레디 function 끝
    	
    	function getCurrentDate() {
          var today = new Date();
          var year = today.getFullYear();
          var month = String(today.getMonth() + 1).padStart(2, '0');
          var day = String(today.getDate()).padStart(2, '0');
          return year + '-' + month + '-' + day;
      }
    	
    	// 결재선 모달용 javascript ********************************************
    	// treeview의 부서 목록 생성
    	function createMajorList(){    		
    		$.ajax({
    			url:"${contextPath}/approval/majorTreeList.do",
    			type:"get",
    			success: function(list){
    				for(let i=0; i<list.length; i++){
    					majorTree[i] = {};
    					majorTree[i].text = list[i].colName;
    					majorTree[i].tags = [list[i].colNo, "college"];
    					majorTree[i].nodes = [];
    					let majorList = list[i].majorList;
    					for(let j=0; j<majorList.length; j++){
    						majorTree[i].nodes[j] = {};
    						majorTree[i].nodes[j].text = majorList[j].majorName;
    						majorTree[i].nodes[j].tags = [majorList[j].majorNo, "major"];
    					}
    				}
    				testTreeView();
    			},
    			error: function(){
    				console.log("부서 목록 조회 실패");
    			}    			
    		})
    		
    	}
      
    	// 부서목록 treeview 생성 함수
    	function testTreeView(){
    		
        $("#myTreeview").treeview({
            levels: 1,
            selectedBackColor: "#03a9f3",
            onhoverColor: "rgba(0, 0, 0, 0.05)",
            expandIcon: "ti ti-plus",
            collapseIcon: "ti ti-minus",
            nodeIcon: "ti ti-circle",
            data: majorTree,
            showTags: true,
            highlightSelected: true,
        }).on("click", function(){
        	let $badge = $(".node-selected").find(".badge");
        	if($badge.eq(1).text() == "major"){
        		$.ajax({
        			url:"${contextPath}/approval/memberList.do",
        			data:{ majorNo: $badge.eq(0).text() },
        			type:"get",
        			success: function(list){
        				$(".my_mem_list").empty();
        				for(const member of list){
        					let $newEl = $("<div>" + member.memName + " (" + member.majorNo + ", " + member.jobNo + ")" + "</div>");
        					$newEl.append("<span class='hide'>" + member.memNo + "</span>")
        								.append("<span class='hide'>" + member.majorNo + "</span>")
        								.append("<span class='hide'>" + member.jobNo + "</span>")
        								.append("<span class='hide'>" + member.memName + "</span>");
        					$(".my_mem_list").append($newEl);
        				}
        			},
        			error: function(){
        				console.log("부서목록 생성 ajax 통신 실패");
        			}
        		})
        	}
        });
      }
    	
    	// 직원 목록 선택
    	$(".mem_list").on("click", "div", function(){
    		// 컨트롤 누른경우 : 겹처서 선택, 하나씩 해제
    		// 컨트롤 안 누른 경우 : 해당 객체 하나만 선택(선택되어 있어도)
    		if(window.event.ctrlKey){
    			if( $(this).hasClass("selected_mem") ){
       			$(this).removeClass("selected_mem");
       		}else{
       			$(this).addClass("selected_mem");
       		}
    		}else{
       		$(".mem_list > div").removeClass("selected_mem");
    			if( !$(this).hasClass("selected_mem") ){
    				$(this).addClass("selected_mem");
    			}
    		}
    	})
    	function selectAllMem(target){
    		if($(target).text() == "전체선택"){
    			$(".my_mem_list>div").each(function(index, el){
	    			if(!$(el).hasClass("selected_mem")){
	    				$(el).addClass("selected_mem");
	    			}
	    		})
	    		$(target).text("전체해제");
    		}else{
	    		$(".my_mem_list>div").each(function(index, el){
    				$(el).removeClass("selected_mem");    				
	    		})
	    		$(target).text("전체선택");
    		}
    	}
    	
    	// 화살표 클릭시 결재자 추가
    	function addAppMember(appType){
    		let $selectedMem = $(".my_mem_list>.selected_mem");
    		let $boxMem = $(".app_" + appType + ">.mem_list");
    		if(appType == "collaborator" && ($boxMem.children("div").length + $selectedMem.length > 5)){
    			alert("협조자는 최대 5명까지 선택할 수 있습니다.");
    		}
    		else if(appType != "collaborator" && $boxMem.children("div").length + $selectedMem.length > 1){
    			alert("결재자, 수신자는 1명만 선택할 수 있습니다.");
    		}else{
    			$selectedMem.each(function(index, el1){
    				let isMem = false;
    				$(".selected_app_mem .mem_list").children().each(function(index, el2){
    					if($(el1).children("span").eq(0).text() == $(el2).children("span").eq(0).text()){
    						alert("동일한 직원이 이미 결재선에 존재합니다.");
    						isMem = true;
    					}
    				})
    				if(!isMem){
       				let $test = $boxMem.append($(el1).clone().addClass("selected_" + appType));    					
    				}else{
							return false;
    				}
       		})
    		}
    	}
    	// 화살표 클릭시 결재자 제거
    	function removeAppMember(appType){
    		let $boxMem = $(".app_" + appType + ">.mem_list").children(".selected_mem").each(function(index, el){
    			$(el).remove();
    		});
    	}
    	
    	// 결재선 등록 모달 초기화
     	function resetEnrollLineModal(){
     		createMajorList();
         	$(".mem_list").each(function(index, el){
         		$(el).empty();
         	})
     	}
    	
    	// 선택한 결재선 적용
    	function confirmAppLine(){
    		 console.log("confirmAppLine 함수 시작");
    		 
    		$("#status").val(20);
    		// 협조자
    		$("#appForm>input[name='collaboratorNo']").each(function(index, el){
    			$(el).remove();
    		});
    		if($(".selected_collaborator").length != 0){
    			$(".selected_collaborator").each(function(index, el){
    				let $collaborator = $(".collaborator" + (index+1));
    				$collaborator.eq(0).html("<h>미결<h>");
    				for(let i=1; i<=$collaborator.length-1; i++){
       				$collaborator.eq(i).text( $(el).children("span").eq(i).text() );
       			}
    				$("#appForm").append('<input type="hidden" name="collaboratorNo" value="' + $(el).children().eq(0).text() + '">');
    			})
    			$("#status").val(10);
    		}else{
    			for(let i=1; i<=5; i++){
    				let $collaborator = $(".collaborator" + i);
    				for(let j=0; j<$collaborator.length; j++){
    					$collaborator.eq(j).text("-");
        		}
    			}
    		}
    		// 결재자
    		$("#appForm>input[name='approverNo']").remove();
    		if($(".selected_approver").length != 0){
    			let $selectedApproverProp = $(".selected_approver>span");
    			$(".approver").eq(0).text("미결");
    			for(let i=1; i<=$(".approver").length-1; i++){
    				$(".approver").eq(i).text( $selectedApproverProp.eq(i).text() );
    			}
    			$("#appForm").append('<input type="hidden" name="approverNo" value="' + $selectedApproverProp.eq(0).text() + '">');
    		}else{
    			for(let i=0; i<$(".approver").length; i++){
    				$(".approver").eq(i).text("-");  
    			}
    		}
    		// 수신자
    		$("#appForm>input[name='receiverNo']").remove();
    		if($(".selected_receiver").length != 0){
    			let $selectedReceiverProp = $(".selected_receiver>span");
    			$(".receiver").eq(0).text("미결");
    			for(let i=1; i<=$(".receiver").length-1; i++){
    				$(".receiver").eq(i).text( $selectedReceiverProp.eq(i).text() );    				
    			}
    			$("#appForm").append('<input type="hidden" name="receiverNo" value="' + $selectedReceiverProp.eq(0).text() + '">');
    			 console.log("Receiver No added to form:", $selectedReceiverProp.eq(0).text());
    	   
	   			 if (currentAction === 'createChat') {
	   			        newChat();
	   			 } else if (currentAction === 'invite') {
	   			        inviteMem();
	   			 }
	   			 
    		}else{
    			for(let i=0; i<$(".receiver").length; i++){
    				$(".receiver").eq(i).text("-");
    			}
    		}
    		resetEnrollLineModal();
    		$("#app_line_modal").modal("hide");
    	}
    	// *****************************************************************
      
    	//
      function enrollAppForm(type){
    	  if(type == 1){
    		  if(!confirm("결재문서를 기안하시겠습니까?")){
    			  return false;
    		  }
    	  }else if(type == 2){
    		  if(confirm("임시저장 문서로 저장하시겠습니까?")){
	    		  $("#status").val(0);
    		  }else{
    			  return false;
    		  }
    	  }
    	}
    	
    	
    </script>
              
              
              
              
              
              
              
              
              
              
              
              
              
              <!--  여긴 뭐지  -->
              <div class="offcanvas offcanvas-start user-chat-box chat-offcanvas" tabindex="-1" id="chat-sidebar"
                aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                  <h5 class="offcanvas-title" id="offcanvasExampleLabel">
                    Chats
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="px-4 pt-9 pb-6">
                  <div class="d-flex align-items-center justify-content-between mb-3">
                    <div class="d-flex align-items-center">
                      <div class="position-relative">
                        <img src="../assets/images/profile/user-1.jpg" alt="user1" width="54" height="54"
                          class="rounded-circle" />
                        <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                          <span class="visually-hidden">New alerts</span>
                        </span>
                      </div>
                      <div class="ms-3">
                        <h6 class="fw-semibold mb-2">Mathew Anderson</h6>
                        <p class="mb-0 fs-2">Designer</p>
                      </div>
                    </div>
                    <div class="dropdown">
                      <a class="text-dark fs-6 nav-icon-hover" href="javascript:void(0)" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="ti ti-dots-vertical"></i>
                      </a>
                      <ul class="dropdown-menu">
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2 border-bottom"
                            href="javascript:void(0)"><span><i class="ti ti-settings fs-4"></i></span>Setting</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2" href="javascript:void(0)"><span><i
                                class="ti ti-help fs-4"></i></span>Help
                            and feadback</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2" href="javascript:void(0)"><span><i
                                class="ti ti-layout-board-split fs-4"></i></span>Enable split View mode</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2 border-bottom"
                            href="javascript:void(0)"><span><i class="ti ti-table-shortcut fs-4"></i></span>Keyboard
                            shortcut</a>
                        </li>
                        <li>
                          <a class="dropdown-item d-flex align-items-center gap-2" href="javascript:void(0)"><span><i
                                class="ti ti-login fs-4"></i></span>Sign
                            Out</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <form class="position-relative mb-4">
                    <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh"
                      placeholder="Search Contact" />
                    <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                  </form>
                  <div class="dropdown">
                    <a class="text-muted fw-semibold d-flex align-items-center" href="javascript:void(0)" role="button"
                      data-bs-toggle="dropdown" aria-expanded="false">
                      Recent Chats<i class="ti ti-chevron-down ms-1 fs-5"></i>
                    </a>
                    <ul class="dropdown-menu">
                      <li>
                        <a class="dropdown-item" href="javascript:void(0)">Sort by time</a>
                      </li>
                      <li>
                        <a class="dropdown-item border-bottom" href="javascript:void(0)">Sort by Unread</a>
                      </li>
                      <li>
                        <a class="dropdown-item" href="javascript:void(0)">Hide favourites</a>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="app-chat">
                  <ul class="chat-users mh-n100" data-simplebar>
                    <li>
                      <a href="javascript:void(0)"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user bg-light-subtle"
                        id="chat_user_1" data-user-id="1">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-2.jpg" alt="user1" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Michell Flintoff
                            </h6>
                            <span class="fs-3 text-truncate text-body-color d-block">You: Yesterdy was great...</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">15 mins</p>
                      </a>
                    </li>
                    <li>
                      <a href="javascript:void(0)"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
                        id="chat_user_2" data-user-id="2">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-3.jpg" alt="user-2" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-danger">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Bianca Anderson
                            </h6>
                            <span class="fs-3 text-truncate text-dark fw-semibold d-block">Nice looking dress
                              you...</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">30 mins</p>
                      </a>
                    </li>
                    <li>
                      <a href="javascript:void(0)"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
                        id="chat_user_3" data-user-id="3">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-4.jpg" alt="user-8" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-warning">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Andrew Johnson
                            </h6>
                            <span class="fs-3 text-truncate text-body-color d-block">Sent a photo</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">2 hrs</p>
                      </a>
                    </li>
                    <li>
                      <a href="javascript:void(0)"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
                        id="chat_user_4" data-user-id="4">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-5.jpg" alt="user-4" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Mark Strokes
                            </h6>
                            <span class="fs-3 text-truncate text-body-color d-block">Lorem ispusm text sud...</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">5 days</p>
                      </a>
                    </li>
                    <li>
                      <a href="javascript:void(0)"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
                        id="chat_user_5" data-user-id="5">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-6.jpg" alt="user1" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Mark, Stoinus & Rishvi..
                            </h6>
                            <span class="fs-3 text-truncate text-dark fw-semibold d-block">Lorem ispusm text ...</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">5 days</p>
                      </a>
                    </li>
                    <li>
                      <a href="javascript:void(0)"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
                        id="chat_user_2" data-user-id="2">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-7.jpg" alt="user-2" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-danger">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Bianca Anderson
                            </h6>
                            <span class="fs-3 text-truncate text-dark fw-semibold d-block">Nice looking dress
                              you...</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">30 mins</p>
                      </a>
                    </li>
                    <li>
                      <a href="javascript:void(0)"
                        class="px-4 py-3 bg-hover-light-black d-flex align-items-start justify-content-between chat-user"
                        id="chat_user_3" data-user-id="3">
                        <div class="d-flex align-items-center">
                          <span class="position-relative">
                            <img src="../assets/images/profile/user-8.jpg" alt="user-8" width="48" height="48"
                              class="rounded-circle" />
                            <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-warning">
                              <span class="visually-hidden">New alerts</span>
                            </span>
                          </span>
                          <div class="ms-3 d-inline-block w-75">
                            <h6 class="mb-1 fw-semibold chat-title" data-username="James Anderson">
                              Andrew Johnson
                            </h6>
                            <span class="fs-3 text-truncate text-body-color d-block">Sent a photo</span>
                          </div>
                        </div>
                        <p class="fs-2 mb-0 text-muted">2 hrs</p>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <!-- 뭐지 끝 -->
              
              
            </div>
          </div>
        </div>
      </div>
      <!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
  
   <!-- treeview 연동 스크립트 -->
	<script src="../assets/libs/bootstrap-tree/dist/bootstrap-treeview.min.js"></script>
	<script src="../assets/js/plugins/bootstrap-treeview-init.js"></script>
	
	<%-- <script src="${ contextPath }/assets/js/apps/chat.js"></script> --%>
</body>
</html>
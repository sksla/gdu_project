<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
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
                  <ul class="chat-users mb-0 mh-n100" data-simplebar>
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
                        <p class="fs-2 mb-0 text-muted">2 hours</p>
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
                        <p class="fs-2 mb-0 text-muted">2 hours</p>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <!-- 채팅방 목록 끝 -->
              
              <!-- 채팅 부분 -->
              <div class="w-70 w-xs-100 chat-container">
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
                    <div class="p-9 border-bottom chat-meta-user d-flex align-items-center justify-content-between">
                      <div class="hstack gap-3 current-chat-user-name">
                        <div class="position-relative">
                          <img src="../assets/images/profile/user-2.jpg" alt="user1" width="48" height="48"
                            class="rounded-circle" />
                          <span class="position-absolute bottom-0 end-0 p-1 badge rounded-pill bg-success">
                            <span class="visually-hidden">New alerts</span>
                          </span>
                        </div>
                        <div>
                          <h6 class="mb-1 name fw-semibold"></h6>
                          <p class="mb-0">Away</p>
                        </div>
                      </div>
                      <ul class="list-unstyled mb-0 d-flex align-items-center">
                        <li>
                          <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                            href="javascript:void(0)"><i class="ti ti-phone"></i></a>
                        </li>
                        <li>
                          <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                            href="javascript:void(0)"><i class="ti ti-video"></i></a>
                        </li>
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
                        <div class="chat-box-inner p-9" data-simplebar>
                          <div class="chat-list chat active-chat" data-user-id="1">
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  I want more detailed information.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark mb-1 d-inline-block rounded-1 fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 fs-3">
                                  They got there early, and they got really
                                  good seats.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="rounded-2 overflow-hidden">
                                  <img src="../assets/images/products/product-1.jpg" alt="" class="w-100" />
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- 2 -->
                          <div class="chat-list chat" data-user-id="2">
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  I want more detailed information.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark mb-1 d-inline-block rounded-1 fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 fs-3">
                                  They got there early, and they got really
                                  good seats.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="rounded-2 overflow-hidden">
                                  <img src="../assets/images/products/product-1.jpg" alt="" class="w-100" />
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- 3 -->
                          <div class="chat-list chat" data-user-id="3">
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  I want more detailed information.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark mb-1 d-inline-block rounded-1 fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 fs-3">
                                  They got there early, and they got really
                                  good seats.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="rounded-2 overflow-hidden">
                                  <img src="../assets/images/products/product-1.jpg" alt="" class="w-100" />
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- 4 -->
                          <div class="chat-list chat" data-user-id="4">
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  I want more detailed information.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark mb-1 d-inline-block rounded-1 fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 fs-3">
                                  They got there early, and they got really
                                  good seats.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="rounded-2 overflow-hidden">
                                  <img src="../assets/images/products/product-1.jpg" alt="" class="w-100" />
                                </div>
                              </div>
                            </div>
                          </div>
                          <!-- 5 -->
                          <div class="chat-list chat" data-user-id="5">
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 d-inline-block fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="p-2 text-bg-light rounded-1 d-inline-block text-dark fs-3">
                                  I want more detailed information.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-end">
                              <div class="text-end">
                                <h6 class="fs-2 text-muted">2 hours ago</h6>
                                <div class="p-2 bg-info-subtle text-dark mb-1 d-inline-block rounded-1 fs-3">
                                  If I don’t like something, I’ll stay away
                                  from it.
                                </div>
                                <div class="p-2 bg-info-subtle text-dark rounded-1 fs-3">
                                  They got there early, and they got really
                                  good seats.
                                </div>
                              </div>
                            </div>
                            <div class="hstack gap-3 align-items-start mb-7 justify-content-start">
                              <img src="../assets/images/profile/user-8.jpg" alt="user8" width="40" height="40"
                                class="rounded-circle" />
                              <div>
                                <h6 class="fs-2 text-muted">
                                  Andrew, 2 hours ago
                                </h6>
                                <div class="rounded-2 overflow-hidden">
                                  <img src="../assets/images/products/product-1.jpg" alt="" class="w-100" />
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="px-9 py-6 border-top chat-send-message-footer">
                          <div class="d-flex align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-2 w-85">
                              <a class="position-relative nav-icon-hover z-index-5" href="javascript:void(0)">
                                <i class="ti ti-mood-smile text-dark bg-hover-primary fs-7"></i></a>
                              <input type="text" class="form-control message-type-box text-muted border-0 p-0 ms-2"
                                placeholder="Type a Message" fdprocessedid="0p3op" />
                            </div>
                            <ul class="list-unstyledn mb-0 d-flex align-items-center">
                              <li>
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                  href="javascript:void(0)"><i class="ti ti-photo-plus"></i></a>
                              </li>
                              <li>
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                  href="javascript:void(0)"><i class="ti ti-paperclip"></i></a>
                              </li>
                              <li>
                                <a class="text-dark px-2 fs-7 bg-hover-primary nav-icon-hover position-relative z-index-5"
                                  href="javascript:void(0)"><i class="ti ti-microphone"></i></a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                      <!-- 채팅방 부분 끝 -->
                      
                      <!-- 미디어 파일 부분 -->
                      <div class="app-chat-offcanvas border-start">
                        <div class="custom-app-scroll mh-n100" data-simplebar>
                          <div class="p-3 d-flex align-items-center justify-content-between">
                            <h6 class="fw-semibold mb-0 text-nowrap">
                              Media <span class="text-muted">(36)</span>
                            </h6>
                            <a class="chat-menu d-lg-none d-block text-dark fs-6 bg-hover-primary nav-icon-hover position-relative z-index-5"
                              href="javascript:void(0)">
                              <i class="ti ti-x"></i>
                            </a>
                          </div>
                          <div class="offcanvas-body p-9">

                            <div class="row mb-7 text-nowrap">
                              <div class="col-4 px-1 mb-2">

                                <img src="../assets/images/products/product-1.jpg" width="88" height="65" alt=""
                                  class="rounded" />

                              </div>
                              <div class="col-4 px-1 mb-2">

                                <img src="../assets/images/products/product-2.jpg" width="88" height="65" alt=""
                                  class="rounded" />

                              </div>
                              <div class="col-4 px-1 mb-2">

                                <img src="../assets/images/products/product-3.jpg" width="88" height="65" alt=""
                                  class="rounded" />

                              </div>
                              <div class="col-4 px-1 mb-2">

                                <img src="../assets/images/products/product-4.jpg" width="88" height="65" alt=""
                                  class="rounded" />

                              </div>
                              <div class="col-4 px-1 mb-2">

                                <img src="../assets/images/products/product-1.jpg" width="88" height="65" alt=""
                                  class="rounded" />

                              </div>
                              <div class="col-4 px-1 mb-2">

                                <img src="../assets/images/products/product-2.jpg" width="88" height="65" alt=""
                                  class="rounded" />

                              </div>

                            </div>
                            <div class="files-chat">
                              <h6 class="fw-semibold mb-3 text-nowrap">
                                Files <span class="text-muted">(36)</span>
                              </h6>
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
                              <a href="javascript:void(0)"
                                class="hstack gap-3 file-chat-hover justify-content-between text-nowrap mb-9">
                                <div class="d-flex align-items-center gap-3">
                                  <div class="rounded-1 text-bg-light p-6">
                                    <img src="../assets/images/chat/icon-figma.svg" alt="" width="24"
                                      height="24" />
                                  </div>
                                  <div>
                                    <h6 class="fw-semibold">
                                      homepage-design.fig
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
                              <a href="javascript:void(0)"
                                class="hstack gap-3 file-chat-hover justify-content-between text-nowrap mb-9">
                                <div class="d-flex align-items-center gap-3">
                                  <div class="rounded-1 text-bg-light p-6">
                                    <img src="../assets/images/chat/icon-chrome.svg" alt="" width="24"
                                      height="24" />
                                  </div>
                                  <div>
                                    <h6 class="fw-semibold">about-us.html</h6>
                                    <div class="d-flex align-items-center gap-3 fs-2 text-muted">
                                      <span>2 MB</span><span>2 Dec 2023</span>
                                    </div>
                                  </div>
                                </div>
                                <span class="position-relative nav-icon-hover download-file">
                                  <i class="ti ti-download text-dark fs-6 bg-hover-primary"></i>
                                </span>
                              </a>
                              <a href="javascript:void(0)"
                                class="hstack gap-3 file-chat-hover justify-content-between text-nowrap mb-9">
                                <div class="d-flex align-items-center gap-3">
                                  <div class="rounded-1 text-bg-light p-6">
                                    <img src="../assets/images/chat/icon-zip-folder.svg" alt="" width="24"
                                      height="24" />
                                  </div>
                                  <div>
                                    <h6 class="fw-semibold">
                                      work-project.zip
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
                              <a href="javascript:void(0)"
                                class="hstack gap-3 file-chat-hover justify-content-between text-nowrap">
                                <div class="d-flex align-items-center gap-3">
                                  <div class="rounded-1 text-bg-light p-6">
                                    <img src="../assets/images/chat/icon-javascript.svg" alt="" width="24"
                                      height="24" />
                                  </div>
                                  <div>
                                    <h6 class="fw-semibold">custom.js</h6>
                                    <div class="d-flex align-items-center gap-3 fs-2 text-muted">
                                      <span>2 MB</span><span>2 Dec 2023</span>
                                    </div>
                                  </div>
                                </div>
                                <span class="position-relative nav-icon-hover download-file">
                                  <i class="ti ti-download text-dark fs-6 bg-hover-primary"></i>
                                </span>
                              </a>
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
					   
					   		const sock = new SockJS("${contextPath}/chat"); // * 웹소켓서버와 연결됨 (=> ChatEchoHandler에 재정의해둔 afterConnectionEstablished의 메소드가 실행됨)
					   		sock.onmessage = onMessage;
					   		sock.onclose = onClose;
					   
					      // 메세지를 출력시키는 영역의 요소객체
					   		const $chatArea = $(".chat-area");
					      
					      // 전송하기 버튼 클릭시 실행되는 function
					      function sendMessage(){ // 사용자가 입력한 채팅메세지를 웹소켓으로 전송
					    	  sock.send( $("#message").val() ); // * websocket으로 메세지 전달(=> ChatEchoHandler의 handleMessage 메소드 실행)
					      	$("#message").val("");
					      }
					      
					      // 나에게 메세지가 왔을 때 실행되는 function
					      function onMessage(evt){ // evt : 웹소켓에서 클라이언트에게 보내준 데이터
					    	  console.log("evt", evt);
					      	console.log("evt.data", evt.data); // new TextMessage객체로 보내준 텍스트에
					      	
					      	let msgArr = evt.data.split("|"); // ["메세지유형(chat/entry/exit)", "메세지내용", "발신자아이디"]
					      	
					      	let $chatDiv = $("<div>"); // 채팅창에 append시킬 div요소 (각 조건에 따라 다르게 제작)
					      	if(msgArr[0] =="chat"){// 채팅메세지일 경우
					      		
					      		/*
					      		<div class="chat-message mine">
					            <div class="send-message">내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지</div>
					         </div>   
					         
					         <div class="chat-message other">
					            <span class="send-user">상대방</span>
					            <div class="send-message">남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지</div>
					         </div>
					      		*/
					      		// 내가보낸메세지든 상대방이보낸메세지든 공통적으로 만들어야되는 요소작업
										$chatDiv.addClass("chat-message")
														.addClass(msgArr[2] == "${loginUser.userId}" ? "mine" : "other") 
														.append( $("<div>").addClass("send-message").text(msgArr[1]) );
					      		
					      		// 상대방이 보낸 메세지일 경우만 따로 진행해야되는 작업
					      		$chatDiv.hasClass("other")
					      			&&  $chatDiv.prepend( $("<span>").addClass("send-user").text(msgArr[2]) );
					      		
					      	}else { // 입장 또는 퇴장메세지일 경우
					      		
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
					      	$chatArea.scrollTop($chatArea[0].scrollHeight); // 스크롤항상 하단으로 유지시켜주는 내용
					      	
					      }
					      
					      // 퇴장하기 클릭시 실행되는 function
					      function onClose(){
					    	  location.href = "/${contextPath}";
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
	
</body>
</html>
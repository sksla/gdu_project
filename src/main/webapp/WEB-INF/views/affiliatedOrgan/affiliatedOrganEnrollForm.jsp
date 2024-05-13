<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부속기관 등록 페이지</title>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/calSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
    <div class="container-fluid">
      <!-- 페이지 타이틀 -->
      <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
        <div class="card-body px-4 py-3">
          <div class="row align-items-center">
            <div class="col-9">
              <h4 class="fw-semibold mb-8">부속기관 예약</h4>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a class="text-muted text-decoration-none" href="../main/index.html"
                      >Home</a
                    >
                  </li>
                  <li class="breadcrumb-item" aria-current="page">부속기관 예약</li>
                </ol>
              </nav>
            </div>
            <div class="col-3">
              <div class="text-center mb-n5">
                <img
                  src=""
                  alt=""
                  class="img-fluid mb-n4"
                />
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 페이지 내용 -->
      <div class="card">
        <div class="card-body">
          <div class="wrap">
            <div class="content1">
                <div class="pic">
                    <!-- ------------------------------------------ -->
                    <!-- 2. With controls -->
                    <!-- ------------------------------------------ -->
                    <div class="col-lg-9">
                        <!-- start With controls -->
                        <div class="card">
                          <div class="card-body">
                            <div id="carouselExampleIndicators" class="carousel slide carousel-dark" data-bs-ride="carousel">
                              <ol class="carousel-indicators">
                                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="" class="active"></li>
                                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to=""></li>
                                <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to=""></li>
                              </ol>
                              <div class="carousel-inner">
                                <div class="carousel-item active">
                                  <img src="../assets/images/blog/blog-img1.jpg" class="d-block w-100" alt="..." />
                                </div>
                                <div class="carousel-item">
                                  <img src="../assets/images/blog/blog-img2.jpg" class="d-block w-100" alt="..." />
                                </div>
                                <div class="carousel-item">
                                  <img src="../assets/images/blog/blog-img3.jpg" class="d-block w-100" alt="..." />
                                </div>
                              </div>
                                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                                    data-bs-slide="prev">
                                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                                    data-bs-slide="next">
                                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                  <span class="visually-hidden">Next</span>
                                </a>
                            </div>
                          </div>
                        </div>
                        <!-- end With controls -->
                      </div>
                </div>
                <div class-="map">지도</div>
            </div>
            <div class="content2">
              <!-- 정보 -->
              <div class="info">
                <!-- Row -->
                <div class="row">
                  <div class="col-12">
                    <!-- start Project Assinging -->
                    <div class="card">
                      <form class="form-horizontal r-separator">
                        <div class="card-body">
                          <h5>기관정보</h5>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText1" class="col-3 text-end control-label col-form-label">이름</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="inputText1" placeholder="First Name Here" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText2" class="col-3 text-end control-label col-form-label">위치</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="inputText2" placeholder="Last Name Here" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputEmail1" class="col-3 text-end control-label col-form-label">관리자</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="email" class="form-control" id="inputEmail1" placeholder="Email Here" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText3" class="col-3 text-end control-label col-form-label">연락처</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="inputText3" placeholder="Contact No Here" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText3" class="col-3 text-end control-label col-form-label">기타사항</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="inputText3" placeholder="Contact No Here" />
                              </div>
                            </div>
                          </div>
                        </div>
                      </form>
                    </div>
                    <!-- end Project Assinging -->
                  </div>
                </div>
                <!-- End Row -->
              </div>
              <!-- 정보 끝 -->
              <div class="buttons">
                <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#save_info">저장</button>
                <button type="button" class="btn btn-light" onclick="history.back();">닫기</button>
              </div>

              <!-- 정보 저장 모달 시작 -->
              <div class="modal fade" id="save_info" tabindex="-1" aria-labelledby="exampleModalLabel1">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header d-flex align-items-center">
                      <h4 class="modal-title" id="exampleModalLabel1">
                      </h4>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form>
                        <div class="mb-3 d-flex flex-row">
                          <h4>저장되었습니다.</h4>            
                        </div>
                      </form>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="save_info-modal" data-bs-whatever="@mdo" aria-label="Close" onclick="location.href='부속기관리스트.html'">닫기</button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 정보 저장 모달 끝 -->
            </div>           
          </div>
        </div>
      </div>
    </div>
  </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>
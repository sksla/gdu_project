<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부속기관 예약페이지</title>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/stuLecSidebar.jsp"/>
    
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
            <div class="content1" style="display:flex;">
                <div class="pic" style="width:450px; margin-right: 180px;">
                    사진
                </div>
                <div id="map" style="width:400px;height:400px; float:right;"></div>
							
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0de54283cd0dd1d88f4512fabccae71c&libraries=services,clusterer,drawing"></script>
							
								<script>
								var container = document.getElementById('map');
								var options = {
										center: new kakao.maps.LatLng(33.450701, 126.570667),
										level: 3
										};
								var map = new kakao.maps.Map(container, options);
								</script>
								<script>
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(33.450752, 126.540667), // 지도의 중심좌표
                    level: 4 // 지도의 확대 레벨
                };  
               // 지도를 생성합니다    
               var map = new kakao.maps.Map(mapContainer, mapOption); 
               // 주소-좌표 변환 객체를 생성합니다
               var geocoder = new kakao.maps.services.Geocoder();
               // 검색할 주소
               var address = '${affiliatedOrgan.affLocation}';
               console.log(address);
               
               // 주소로 좌표 검색
               geocoder.addressSearch(address, function(result, status) {
                  // 정상적으로 검색이 완료됐으면 
                   if (status === kakao.maps.services.Status.OK) {
                       var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                   
                    // 결과값으로 받은 위치를 마커로 표시
                       var marker = new kakao.maps.Marker({
                           map: map,
                           position: coords
                         });
                    // 인포윈도우로 장소에 대한 설명을 표시
                       var infowindow = new kakao.maps.InfoWindow({
                           content: '<div style="width:150px;text-align:center;padding:6px 0;">${affiliatedOrgan.affName}</div>'
                       });
                       infowindow.open(map, marker);

                       // 지도의 중심을 결과값으로 받은 위치로 이동
                       map.setCenter(coords);
                   } else {
                       // 주소 검색 실패 시 처리
                       console.log('주소 검색 실패');
                   }
               });
               </script>
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
                              <label for="inputText1" class="col-3 text-end control-label col-form-label"></label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="hidden" class="form-control" id="affNo" value="${ affiliatedOrgan.affNo }" readonly />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText1" class="col-3 text-end control-label col-form-label">이름</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="affName" value="${ affiliatedOrgan.affName }" readonly />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText2" class="col-3 text-end control-label col-form-label">위치</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="affLocation" placeholder="" value="${ affiliatedOrgan.affLocation }" readonly/>
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputEmail1" class="col-3 text-end control-label col-form-label">관리학과</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="majorNo" placeholder="" value="${ affiliatedOrgan.majorNo }" readonly/>
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText3" class="col-3 text-end control-label col-form-label">기타사항</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="affEtc" placeholder="" value="${ affiliatedOrgan.affEtc }" readonly />
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
							<!-- 정보 스크립트 -->
							
							<!-- 정보 스크립트 -->
							
              <!-- 예약 -->
              <div class="reserv">
                <!-- Row -->
                <div class="row">
                  <div class="col-12">
                    <!-- start Project Assinging -->
                    <div class="card">
                      <form class="form-horizontal r-separator">
                        <div class="card-body">
                          <h5>예약정보</h5>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText1" class="col-3 text-end control-label col-form-label">사용기간</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <form class="d-flex flex-row">
                                  <span class="form-group">
                                    <input type="date" class="form-control" value="2018-05-13" style="width: 150px;">
                                    &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                                    <input type="date" class="form-control" value="2018-05-13" style="width: 150px;">
                                  </span>
                                </form>
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText2" class="col-3 text-end control-label col-form-label">사용자</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="inputText2" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText2" class="col-3 text-end control-label col-form-label">예약사유</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" class="form-control" id="inputText2" />
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
                <div class="buttons">
                  <button type="button" class="btn btn-info"  data-bs-toggle="modal" data-bs-target="#rev_aff">예약하기</button>
                  <button type="button" class="btn btn-light">닫기</button>
                </div>
              </div>
              <!-- 예약 끝-->  
            </div>

            <!-- 예약 모달 시작 -->
            <div class="modal fade" id="rev_aff" tabindex="-1" aria-labelledby="exampleModalLabel1">
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
                        <h4>예약되었습니다.</h4>            
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="save_info-modal" data-bs-whatever="@mdo" aria-label="Close" onclick="location.href='${contextPath}/aff/affiliatedOrgan.do'">닫기</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- 예약 모달 끝 -->  

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
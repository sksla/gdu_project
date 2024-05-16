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
            <div class="content1">
							<div class="pic">
								<div class="card card-body">
									<div class="mb-3">
										<label for="formFileMultiple" class="form-label">
											<h5>기관사진</h5>
										</label>
										<input class="form-control" type="file" id="formFileMultiple"  accept="image/*" style="width:800px" onchange="setThumbnail(event);"  multiple/>
										<div id="image_container"></div>
										<script>
											function setThumbnail(event){
												
												if(event.target.files.length > 4){
													alert("최대 4장까지만 첨부 가능합니다.");
													event.target.value = "";
													return;
												}
												for(var image of event.target.files){
													var reader = new FileReader();
													reader.onload = function(event){
														var img = document.createElement("img");
														img.setAttribute("src", event.target.result);
														img.setAttribute("width", "200");
														img.setAttribute("height", "200");
														document.querySelector("div#image_container").appendChild(img);
													};
													console.log(image);
													reader.readAsDataURL(image);
												}
											}
										</script>						
									</div>
								</div>
							</div>							
            </div>  
            <div class="content2">
              <!-- 정보 -->
              <div class="info">
                <!-- Row -->
                <div class="row">
                  <div class="col-12">
                    <!-- start Project Assinging -->
                    <div class="card">
                      <form class="form-horizontal r-separator" action="${contextPath}/aff/affiliatedOrganEnroll.do" method="post">
                        <div class="card-body">
                          <h5>기관정보</h5>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText1" class="col-3 text-end control-label col-form-label">이름</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" name="affName" class="form-control" id="inputText1" placeholder="" />
                              </div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText2" class="col-3 text-end control-label col-form-label">위치</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" name="affLocation" class="form-control" id="address" placeholder="주소를 검색하세요" />
                                <input type="text" name="affLocation" class="form-control" id="address_detail" placeholder="상세주소" />
                              </div>
                            </div>
                            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
														<script>
														window.onload = function(){
														    var postcode; // 변수 선언
														    // 페이지가 로드될 때 실행되는 함수
														    document.getElementById("address").addEventListener("click", function(){ // 주소 입력란 클릭 이벤트
														        // 카카오 지도 팝업
														        if (!postcode || postcode.iframeLoaded === false) { // 팝업이 열려있지 않을 때만 새로 열기
														            postcode = new daum.Postcode({
														                oncomplete: function(data) { // 주소 선택 완료 시 실행되는 콜백 함수
														                    document.getElementById("address").value = data.address; // 선택한 주소를 입력란에 채움
														                    var addressDetailInput = document.querySelector("input[name=address_detail]");
														                    if (addressDetailInput) { // 요소가 있는지 확인
														                        addressDetailInput.focus(); // 상세 주소 입력란으로 포커스 이동
														                    }
														                },
														                onclose: function() { // 팝업이 닫힐 때 실행되는 콜백 함수
														                    var addressDetailInput = document.querySelector("input[name=address_detail]");
														                    if (addressDetailInput) { // 요소가 있는지 확인
														                        addressDetailInput.focus(); // 주소 입력란으로 포커스 이동
														                    }
														                }
														            });
														            postcode.open();
														        }
														    });
														}
														</script>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputEmail1" class="col-3 text-end control-label col-form-label">담당학과</label>
                              <div class="form-group" style="width: 100px;">
	                              <select class="form-select w-auto" name="majorNo">
	                                <c:forEach var="major" items="${ list }">
	                                	<option name="majorNo" value="${ major.majorNo }">${ major.majorName }</option>
	                              	</c:forEach>
	                              </select>
                            	</div>
                            </div>
                          </div>
                          <div class="form-group mb-0">
                            <div class="row align-items-center">
                              <label for="inputText3" class="col-3 text-end control-label col-form-label">기타사항</label>
                              <div class="col-9 border-start pb-2 pt-2">
                                <input type="text" name="affEtc" class="form-control" id="inputText3" placeholder="" />
                              </div>
                            </div>
                          </div>
                        </div>
	                      <div class="buttons">
					                <button type="submit" class="btn btn-info" id="enrollButton">저장</button>
					                <button type="button" class="btn btn-light" onclick="history.back();">닫기</button>
					              </div>
					              <script>
											    document.getElementById("enrollButton").addEventListener("click", function() {
											        affiliatedOrganEnroll();
											    });
												</script>
                      </form>
                    </div>
                    <!-- end Project Assinging -->
                  </div>
                </div>
                <!-- End Row -->
              </div>
              <!-- 정보 끝 -->
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
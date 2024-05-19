<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 작성 틀</title>
  <style>
    /* div 스타일 (나중에 색 지울것) */
    .attend_wrap{
      width: 1000px;
      height: 1200px;
      margin: auto;
      display: flex;
      flex-direction: column;
      /*border: 1px solid black;*/
    }
  
    .attend_content1{
      height: 100px;
      display:flex;
      border: 1px solid lightgray;
    }
    .attend_title2{
      width: 600px;
      border: 3px solid skyblue;
    }
    .attend_title1, .attend_rate{
      width: 200px;
      border: 3px solid skyblue;
    }
  
    .attend_content2{
      display:flex;
      /*border: 1px solid lightgray;*/
    }
    .date{
      width: 70%;
      /*border: 3px solid gold;*/
    }
    .button{
      width: 30%;
      /*border: 3px solid palevioletred;*/
    }
    
    .attend_content3{
      height: 800px;
      display:flex;
      /*border: 3px solid greenyellow;*/
    }
  
    .attend_content4{
      height: 100px;
      display:flex;
      /*border: 1px solid lightgray;*/
    }
  
  </style>
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
        <!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
            
              <div class="row align-items-center my-3">
              
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">출석</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">출석</li>
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

          <!-- 페이지 내용 -->
          <div class="card">
        <div class="card-body">
          <div class="attend_wrap">
            <div class="attend_content1">
              <div class="attend_title1">XXXXX</div>
              <div class="attend_title2">과목명/교수명</div>
              <div class="attend_rate">출석율</div>
            </div> 
            <div class="attend_content3">
              <div class="list">
                <div class="card-body p-4">
                  <div class="d-flex flex-row justify-content-between">
                    <!-- 날짜 -->
                    <!-- start Input Type Date Time -->
                      <div class="date" style="width: 400px; height: 100px;">
                        <form class="mt-4">
                          <div class="form-group">
                            <input type="datetime-local" class="form-control" value="2008-05-13T22:33:00" />
                          </div>
                        </form>
                      </div>
                      <!-- end Input Type Date Time -->
                    <!-- 출석관련 버튼 -->
                    <div class="buttons">
                      <button type="button" class="btn btn-info">일괄출석</button>
                      <button type="button" class="btn btn-info">저장</button>
                      <button type="button" class="btn btn-light">엑셀로저장</button>
                    </div>
                  </div> 

                  <!-- 1번 양식 -->
                  <div class="table-responsive mb-4">
                    <table class="table border text-nowrap mb-0 align-middle app_doc_table overflow-hidden">
                      <thead class="text-dark fs-4">
                        <tr>
                          <th>
                            <input type="checkbox" name="" id="checkAll">
                          </th>
                          <th width="100px">
                            <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">사진</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">학과</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">학번</h6>
                          </th>
                          <th width="200px">
                            <h6 class="fs-4 fw-semibold mb-0">이름</h6>
                          </th>
                          <th width="100px">
                            <h6 class="fs-4 fw-semibold mb-0">출석</h6>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <input type="checkbox" name="" id="">
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">1</p>
                          </td>
                          <td>
                            <div class="d-flex align-items-center">
                              <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40" />
                            </div>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">경영학과</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">202411111</p>
                          </td>
                          <td>
                            <p class="mb-0 fw-normal fs-4">이름</p>
                          </td>
                          <td>
                            <div class="form-group" style="width: 100px;">
                              <select class="form-select w-auto">
                                <option value="1">출석</option>
                                <option value="2">결석</option>
                                <option value="3">지각</option>
                                <option value="4">조퇴</option>
                                <option value="5">공결</option>
                              </select>
                            </div>
                          </td>
                        </tr>
                        
                      </tbody>
                    </table>
                  </div>
                  <!-- 1번 양식 -->

                  <div>
                    <!-- 페이징바 -->
                    <ul class="pagination justify-content-center">
                      <li class="page-item">
                        <a class="page-link link" href="#" aria-label="Previous">
                          <span aria-hidden="true">
                            <i class="ti ti-chevrons-left fs-4"></i>
                          </span>
                        </a>
                      </li>
                      <li class="page-item">
                        <a class="page-link link active" href="#">1</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link link" href="#">2</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link link" href="#">3</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link link" href="#" aria-label="Next">
                          <span aria-hidden="true">
                            <i class="ti ti-chevrons-right fs-4"></i>
                          </span>
                        </a>
                      </li>
                    </ul>
                  </div>

                </div>
              </div>
            </div>
            

            <script>
              function changeActive(id){
                var id = $('#'+id);
                id.addClass("active")
              }
            </script>


            </div>
          </div>
        </div>

					<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
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
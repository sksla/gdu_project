<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의게시판</title>
<!-- 리스트 스타일 -->
<style>
  .app_doc_table th, .app_doc_table td{
    text-align: center;
    vertical-align: middle;}
</style>

</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/boardSidebar.jsp"/>
    
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
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">건의게시판</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html"
                          >Home</a
                        >
                      </li>
                      <li class="breadcrumb-item" aria-current="page">건의게시판</li>
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
          <div class="card ">
            <div class="card-body">
              <div class="mb-4">
                <div class="d-flex flex-row justify-content-between">
                  <div class="" style="height: 38.33px; width: 50%;">
                    <form class="d-flex flex-row">
                      <div class="form-group" style="width: 130px;">
                        <select class="form-select" id="exampleFormControlSelect1">
                          <option>글번호</option>
                          <option>글제목</option>
                          <option>작성자</option>
                        </select>
                      </div>
                      &nbsp;
                      <div class="input-group">
                          <input type="text" class="form-control" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
                          <button class="btn bg-secondary-subtle text-secondary " type="button">검색</button>
                      </div>
                      
                    </form>
                  </div>
                  <div>
                    <a type="button" class="btn btn-info" href="${contextPath}/board/proposalForm.page">등록하기</a> 
                  </div>
                </div>
              </div>
              <div class="table-responsive mb-4">
                <table class="table border text-nowrap mb-0 align-middle app_doc_table overflow-hidden">
                  <thead class="text-dark fs-4">
                    <tr>
                      <th width="50px">
                        <h6 class="fs-4 fw-semibold mb-0">글번호</h6>
                      </th>
                      <th width="300px">
                        <h6 class="fs-4 fw-semibold mb-0">제목</h6>
                      </th>
                      <th width="150px">
                        <h6 class="fs-4 fw-semibold mb-0">작성자</h6>
                      </th>
                      <th width="100px">
                        <h6 class="fs-4 fw-semibold mb-0">비밀글</h6>
                      </th>
                      <th width="150px">
                        <h6 class="fs-4 fw-semibold mb-0">작성일</h6>
                      </th>
                      <th width="100px">
                        <h6 class="fs-4 fw-semibold mb-0">조회수</h6>
                      </th>
                      <th width="100px">
                        <h6 class="fs-4 fw-semibold mb-0">첨부파일</h6>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:choose>
                			<c:when test="${ empty list }">
                				<tr>
                					<td colspan="7">조회된 게시글이 없습니다.</td>
                				</tr>
                			</c:when>
                			<c:otherwise>
                				<c:forEach var="b" items="${ list }">
                					<tr onclick="showModal('${contextPath}/board/${b.memId == loginUser.memId ? 'detail.do' : 'increase.do'}?no=${b.boardNo}', ${b.openStatus}, '${b.password}');">
                						 <td><p class="mb-0 fw-normal fs-4">${ b.boardNo }</p></td>
                						 <td><p class="mb-0 fw-normal fs-4">${ b.boardTitle }</p></td>
                						 <td><p class="mb-0 fw-normal fs-4">${ b.memId }</p></td>
                						 <td><p class="mb-0 fw-normal fs-4">${ b.openStatus == 2 ? '<i class="ti ti-lock"></i>' : 'x' }</p></td> <!-- <i class="ti ti-lock-open"></i> -->
                						 <td><p class="mb-0 fw-normal fs-4">${ b.registDate }</p></td>
                						 <td><p class="mb-0 fw-normal fs-4">${ b.count }</p></td>
                						 <td><p class="mb-0 fw-normal fs-4">${ b.attachCount > 0 
                						 																			? '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
																					                            <g fill="none">
																					                            <path fill="currentColor" d="m15.393 4.054l-.502.557zm3.959 3.563l-.502.557zm2.302 2.537l-.685.305zM3.172 20.828l.53-.53zm17.656 0l-.53-.53zM14 
																					                            21.25h-4v1.5h4zM2.75 14v-4h-1.5v4zm18.5-.437V14h1.5v-.437zM14.891 4.61l3.959 3.563l1.003-1.115l-3.958-3.563zm7.859 8.952c0-1.689.015-2.758-.41-3.714l-1.371.61c.266.598.281 1.283.281 3.104zm-3.9-5.389c1.353 1.218 1.853 1.688 2.119 2.285l1.37-.61c-.426-.957-1.23-1.66-2.486-2.79zM10.03 2.75c1.582 0 2.179.012 2.71.216l.538-1.4c-.852-.328-1.78-.316-3.248-.316zm5.865.746c-1.086-.977-1.765-1.604-2.617-1.93l-.537 1.4c.532.204.98.592 2.15 1.645zM10 21.25c-1.907 0-3.261-.002-4.29-.14c-1.005-.135-1.585-.389-2.008-.812l-1.06 1.06c.748.75 1.697 1.081 2.869 1.239c1.15.155 2.625.153 4.489.153zM1.25 14c0 1.864-.002 3.338.153 4.489c.158 1.172.49 2.121 1.238 2.87l1.06-1.06c-.422-.424-.676-1.004-.811-2.01c-.138-1.027-.14-2.382-.14-4.289zM14 22.75c1.864 0 3.338.002 4.489-.153c1.172-.158 2.121-.49 2.87-1.238l-1.06-1.06c-.424.422-1.004.676-2.01.811c-1.027.138-2.382.14-4.289.14zM21.25 14c0 1.907-.002 3.262-.14 4.29c-.135 1.005-.389 1.585-.812 2.008l1.06 1.06c.75-.748 1.081-1.697 1.239-2.869c.155-1.15.153-2.625.153-4.489zm-18.5-4c0-1.907.002-3.261.14-4.29c.135-1.005.389-1.585.812-2.008l-1.06-1.06c-.75.748-1.081 1.697-1.239 2.869C1.248 6.661 1.25 8.136 1.25 10zm7.28-8.75c-1.875 0-3.356-.002-4.511.153c-1.177.158-2.129.49-2.878 1.238l1.06 1.06c.424-.422 1.005-.676 2.017-.811c1.033-.138 2.395-.14 4.312-.14z"/><path stroke="currentColor" stroke-width="1.5" d="M13 2.5V5c0 2.357 0 3.536.732 4.268C14.464 10 15.643 10 18 10h4"/>
																					                            <ellipse cx="17" cy="14.5" fill="currentColor" rx="1" ry="1.5"/>
																					                            <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 17.5a5.408 5.408 0 0 0 6 0"/>
																					                            <ellipse cx="7" cy="14.5" fill="currentColor" rx="1" ry="1.5"/>
																					                            </g>
																					                          </svg>'
                						 																			: 'x'}</p>
                						 																			
                						  <script>
															    function showModal(url, openStatus, oripassword) {
															        if (openStatus == 2) {
															            $('#checkpass-modal').modal('show'); // 모달 표시
															            $('#checkpass-modal').data('url', url); // 데이터 속성에 URL 저장
															            $('#checkpass-modal').data('oripassword', oripassword); // 데이터 속성에 password 저장
															        } else {
															            location.href = url; // openStatus가 2가 아니면 바로 이동
															        }
															    }
															
															    function checkPassword() {
															        var password = $('#passwordInput').val(); // 입력된 비밀번호 가져오기
															        var url = $('#checkpass-modal').data('url'); // 모달에서 저장된 URL 가져오기
															        var oripassword = $('#checkpass-modal').data('oripassword');
															        // 비밀번호 확인 로직 작성 (예: AJAX 요청을 통한 서버에서의 비밀번호 확인)
															        // 비밀번호가 맞는 경우 페이지 이동
															        if(password === oripassword)){
																        location.href = url;
															        	
															        }else{
															        	alert("비밀번호를 확인해주세요.");
															        }
															       
															    }
															</script>
          
                						 </td>
                					</tr>
                				</c:forEach>
                			</c:otherwise>
                		</c:choose>
                  
                  </tbody>
                </table>
              </div>

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
          
          <!-- 비밀글 비밀번호 확인 modal content -->
               <div id="checkpass-modal" class="modal fade" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-lg">
                  <div class="modal-content">
                    <div class="modal-body">
                      <div class="text-center mt-2 mb-4">
                        <a href="../main/index.html" class="text-success">
                          <span>
                            <img src="../assets/images/logos/favicon.png" class="me-3" width="40" alt="" />
                          </span>
                        </a>
                      </div>
											<div class="text-center mt-2 mb-4">
                      	<h4 class="fw-semibold mb-8">비밀글입니다.</h4>
											</div>
                        
                          <div class="mb-3 row mx-7 align-center">
                            <label for="inputHorizontalSuccess" class="col-sm-2 form-label">비밀번호 확인</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control " id="passwordInput"
                               name="memPwd" placeholder="Enter your password" required />
                            </div>
                          </div>
                         
                        <div class="mb-3 text-center">
                          <button class="btn bg-info-subtle text-info " type="button" onclick="checkPassword();">
                            확인
                          </button>
                        </div>
                      
                    </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
          
          
         
          
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .out{margin-left:20px; margin-right:50px; cursor:pointer; color:blue;}
  .updateMajor{margin-right:50px; cursor:pointer; color:blue;}
  .updateJob{cursor:pointer; color:blue;}
  #selectStatus{margin-left: 880px;}
  #ingMember{margin-left: 20px;}
  #endMember{margin-left: 20px;}
  #searchForm {
      display: flex;
      flex-direction: row;
      align-items: center;
  }
  /* 페이징바를 한가운데로 */
  #search{
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  #searchName{
      width: 250px;
  }
  .text, .searchBtn {
      margin: 5px;
  }
  .modalText{
    color: black;
    font-size: 18px;
  }
  .modalCheck{
    padding: 20px;
    color: black;
    background-color: rgb(224, 224, 224);
    font-size: 15px;
    border-radius: 15px;
  }
  .updateModal{--bs-modal-width: 170px;}
  table tbody>tr{cursor: pointer;}
  .form-select{cursor: pointer;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
  <div class="body-wrapper">
    <div class="container-fluid">
      <!-- 페이지 타이틀 -->
      <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
        <div class="card-body px-4 py-3">
          <div class="row align-items-center">
            <div class="col-9">
              <h4 class="fw-semibold mb-8">인사</h4>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item">
                    <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                  </li>
                  <li class="breadcrumb-item" aria-current="page">직원관리</li>
                </ol>
              </nav>
            </div>
            <div class="col-3">
              <div class="text-center mb-n5">
                <img src="../assets/images/breadcrumb/ChatBc.png" alt="" class="img-fluid mb-n4" />
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 페이지 내용 -->
      <div class="card">
        <div class="card-body">
          
          <script>
            $(document).ready(function(){
              $("#allMember").prop('checked', true);
            })
          </script>
          
          <form id="searchForm" action="" method="Get" align="center">
            <input id="searchName" type="text" class="form-control" name="" placeholder="이름으로 검색">
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
          </form>

          <div id="selectStatus">
            <input type="radio" id="allMember" name="selectStatus"><span><label for="allMember">전체</label></span>
            <input type="radio" id="ingMember" name="selectStatus"><span><label for="ingMember">재직</label></span>
            <input type="radio" id="endMember" name="selectStatus"><span><label for="endMember">퇴직</label></span>
          </div>

          <div id="outAndUpdate"  style="display: none;">
            <div class="out" style="display: inline;" data-bs-toggle="modal" data-bs-target="#outModal" onclick="outModal();">퇴직처리</div>
            <div class="updateMajor" style="display: inline;" data-bs-toggle="modal" data-bs-target="#updateMajorModal">학과수정</div>
            <div class="updateJob" style="display: inline;" data-bs-toggle="modal" data-bs-target="#updateJobModal">직급수정</div>
          </div>

          <div class="table mb-4">
            <table class="table border text-nowrap mb-0 align-middle memberTable">
              <thead class="text-dark fs-3" align="center">
                <tr>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0"></h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">사번</h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">이름</h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">
                      <select class="form-select mb-n2" name="" style="width: 130px;">
                          <option selected value="0">전체학과</option>
                          <c:forEach var="major" items="${majorList}">
                          	<option value="${major.majorNo}">${major.majorName}</option>
                          </c:forEach>
                      </select>
                    </h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">
                      <select class="form-select mb-n2" name="" style="width: 130px;">
                        <option selected value="0">전체직급</option>
                        <c:forEach var="j" items="${jobList}">
                        	<option value="${j.jobNo}">${j.jobName}</option>
                        </c:forEach>
                      </select>
                    </h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">주민등록번호</h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">이메일</h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">주소</h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">입사일</h6>
                  </th>
                  <th>
                    <h6 class="fs-3 fw-semibold mb-0">연락처</h6>
                  </th>
                </tr>
              </thead>

              <script>
                $(document).ready(function(){
                  $(".selectMember").on("change", function(){
                    if($(this).is(":checked")){
                      $("#outAndUpdate").css("display", "block");
                    }else{
                      $("#outAndUpdate").css("display", "none");
                    }
                  })
                })
                
                function outModal(){
                	let checkedbox = $(".selectMember:checked");
                	let checkedboxCount = checkedbox.length;
                	
                	if(checkedboxCount == 1){
                		
                		// div 요소 활성화 및 비활성화 선택
                		$(".oneOut").css("display", "block");
                		$(".multiOut").css("display", "none");    		
                		// 한명일 때 회원이름 가져오기
                		let oneName = checkedbox.closest("tr").find(".memName").text();
                		// 가져온 이름 span요소에 추가
                		$(".outName").text(oneName);
                		// 체크박스의 밸류값 가져오기
                		let oneValue = checkedbox.val();
                		// 인풋타입 히든 만들어서 변수에 담고 퇴직 form에 어펜드
                		let inputHidden = "<input type='hidden' name='memNo' value='" + oneValue + "'>"
                		$("#outForm").append(inputHidden)
                		
                		$('#outModal').on('hidden.bs.modal', function () {
                		    $('#outForm').find('input[name="memNo"]').remove();
                		});
                		
                	}else{
                		
                		// div 요소 활성화 및 비활성화 선택
                		$(".multiOut").css("display", "block");
                		$(".oneOut").css("display", "none");
                		// 여러명일때 인원수 span요소에 추가
                		$(".outCount").text(checkedboxCount);
                		
                		// 체크박스 밸류값들 가져온 뒤 인풋타입 히든 만들어서 변수에 담고 퇴직form에 어펜드를 반복
	                 	checkedbox.each(function(){
	                 		let multiValue = $(this).val();
	                		let inputHidden = "<input type='hidden' name='memNo' value='" + multiValue + "'>"
	                		$("#outForm").append(inputHidden)
	                 	})
                		
                		$('#outModal').on('hidden.bs.modal', function () {
                		    $('#outForm').find('input[name="memNo"]').remove();
                		});
	                 	
                	}
                	// 현재 테이블내의 checkbox요소들 중에 checked 상태의 요소들을 선택해보고
                	// 해당 요소가 한개일 경우에는 클래스가 oneOut인 div요소 활성화
                	// 선택된 input type="checkbox" 요소로부터 이름값을 탐색해서 가져온 후에 클래스가 outName인 span요소 자리에 출력
                	// <input type="hidden" name="" value="" > 이 구문을 제작해서
                	// outForm에 어펜드

                	
                	
                	// 해당 요소가 여러개일 경우 클래스가 multiOut인 div요소 활성화
                	// 선택된 input type="checkbox" 요소의 갯수를 클래스가 outCount인 span요소 자리에 출력
                	// <input type="hidden" name="" value="" > 이 구문을 반복문 제작해서 outForm에 어펜드
                }
              </script>

              <tbody align="center">
              	<c:choose>
              		<c:when test="${empty list}">
              			<tr>
              				<th colspan="10">
              					<h6 class="fs-2 mb-0">직원이 없습니다.</h6>
              				</th>
              			</tr>
              		</c:when>
              		<c:otherwise>
              			<c:forEach var="m" items="${list}">
              				<tr>
              					<th>
              						<h6 class="fs-2 mb-0">
              							<input type="checkbox" class="selectMember" value="${m.memNo}"> 
              						</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.memNo}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0 memName">${m.memName}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.majorNo}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.jobNo}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.resident}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.email}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.address}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.hireDate}</h6>
              					</th>
              					<th>
              						<h6 class="fs-2 mb-0">${m.phone}</h6>
              					</th>
              				</tr>
              			</c:forEach>
              		</c:otherwise>
              	</c:choose>
              </tbody>
            </table>
          </div>

          <div style="text-align: right;">
            <button type="button" class="btn btn-secondary">직원등록</button>
          </div>

          <!-- 퇴직처리 모달-->
          <form class="mt-4" action="${contextPath}/admin/outMember.do" method="post" id="outForm">
            <div class="modal fade" id="outModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header d-flex align-items-center">
                    <h4 class="modal-title" id="myLargeModalLabel">
                      퇴직처리
                    </h4>
                  </div>
                  <hr>
                  <div class="modal-body myModalBody">
                    <div class="modalText">
                    
                    	<div class="oneOut" style="display: none;">
                    	  <span class="outName"></span>님을 퇴직처리하시겠습니까?<br>
                    		퇴직처리시 해당 사용자는 더이상 로그인할 수 없습니다.
                    	</div>
                    	
                    	<div class="multiOut" style="display: none;">
                    		선택한 <span class="outCount"></span>명의 사용자를 삭제하시겠습니까? <br>
                    		삭제시 사용자는 더이상 로그인할 수 없습니다.
                    	</div>
                    	
                    </div>
                    <br>
                    <div class="modalCheck">
                      <input type="checkbox" required> 소속된 학과의 정보가 사라집니다. <br>
                      <input type="checkbox" required> 그룹웨어 이용권한이 사라집니다.
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">
                      확인
                    </button>
                    <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">
                      취소
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </form>

          <!-- 학과수정 모달 -->
          <form class="mt-4" action="" method="post">
            <div class="modal fade" id="updateMajorModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered updateModal">
                <div class="modal-content">
                  <div class="modal-header d-flex align-items-center">
                    <h4 class="modal-title" id="myLargeModalLabel">
                      학과수정
                    </h4>
                  </div>
                  <hr>
                  <div class="modal-body myModalBody">
                    <!-- <div class="modalText">
                    XXX님은 경영학과에 소속되어있습니다.<br>
                    소속학과를 수정하시겠습니까?
                    </div> -->
                    <div class="modalDropdown">
                      <select class="form-select mb-n2" name="" style="width: 130px;">
                        <option value="">학과명1</option>
                        <option value="">학과명2</option>
                        <option value="">학과명3</option>
                        <option value="">학과명4</option>
                        <option value="">학과명5</option>
                        <option value="">학과명6</option>
                      </select>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">
                      수정
                    </button>
                    <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">
                      취소
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </form>

          <!-- 직급수정 모달 -->
          <form class="mt-4" action="" method="post">
            <div class="modal fade" id="updateJobModal" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered updateModal">
                <div class="modal-content">
                  <div class="modal-header d-flex align-items-center">
                    <h4 class="modal-title" id="myLargeModalLabel">
                      직급수정
                    </h4>
                  </div>
                  <hr>
                  <div class="modal-body myModalBody">
                    <!-- <div class="modalText">
                    XXX님은 직급은 대리입니다.<br>
                    XXX님의 직급을 수정하시겠습니까?
                    </div>
                    <br> -->
                    <div class="modalDropdown">
                      <select class="form-select mb-n2" name="" style="width: 130px;">
                        <option value="">직급명1</option>
                        <option value="">직급명2</option>
                        <option value="">직급명3</option>
                        <option value="">직급명4</option>
                        <option value="">직급명5</option>
                        <option value="">직급명6</option>
                      </select>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">
                      수정
                    </button>
                    <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">
                      취소
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </form>

          <!-- 페이징바 & 검색창-->
          <div id="search">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                
                <li class="page-item ${pi.currentPage==1 ? 'disabled' : ''}">
                  <a class="page-link link" href="${contextPath}/admin/memberList.do?page=${pi.currentPage-1}" aria-label="Previous">
                    <span aria-hidden="true">
                      <i class="ti ti-chevrons-left fs-4"></i>
                    </span>
                  </a>
                </li>
                
                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	                <li class="page-item">
	                  <a class="page-link link ${pi.currentPage == p ? 'disabled' : ''}" href="#">
	                  	${p}
	                  </a>
	                </li>
                </c:forEach>
                
                <li class="page-item ${pi.currentPage==pi.maxPage ? 'disabled' : ''}">
                  <a class="page-link link" href="${contextPath}/admin/memberList.do?page=${pi.currentPage+1}" aria-label="Next">
                    <span aria-hidden="true">
                      <i class="ti ti-chevrons-right fs-4"></i>
                    </span>
                  </a>
                </li>
                
              </ul>
            </nav>
          </div>

        </div>
      </div>

      <!-- <div class="card">
        <div class="card-body">
          여기에 내용작성
        </div>
      </div>

      <div class="card">
        <div class="card-body">
          여기에 내용작성
        </div>
      </div> -->

      

    </div>
  </div>
	
	<jsp:include page="/WEB-INF/views/common/settingbar.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
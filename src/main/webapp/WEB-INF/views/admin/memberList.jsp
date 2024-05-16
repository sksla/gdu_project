<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원관리 페이지</title>
<style>
  .out{margin-left:20px; margin-right:50px; cursor:pointer; color:blue;}
  .updateMajor{margin-right:50px; cursor:pointer; color:blue;}
  .updateJob{cursor:pointer; color:blue;}
  .selectStatus{margin-left: 880px;}
  #allMember{margin-left: 20px;}
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
  .updateModal{--bs-modal-width: 240px;}
  table tbody>tr{cursor: pointer;}
  .form-select{cursor: pointer;}
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
    
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
		          
		          <!-- <form id="searchForm" action="" method="Get" align="center">
		            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
		          </form> -->
		          <input id="searchName" type="text" class="form-control searchName" name="" placeholder="이름으로 검색">
		
		          <div class="selectStatus">
		            <input type="radio" id="ingMember" name="selectStatus" value="N"><span><label for="ingMember">재직</label></span>
		            <input type="radio" id="allMember" name="selectStatus" value="all"><span><label for="allMember">전체</label></span>
		            <input type="radio" id="endMember" name="selectStatus" value="Y"><span><label for="endMember">퇴직</label></span>
		          </div>
		
		          <div class="outAndUpdate">
		            <div class="out" style="display: inline;" data-bs-toggle="modal" data-bs-target="#outModal" onclick="outModal();">퇴직처리</div>
		            <div class="updateMajor" style="display: inline;" data-bs-toggle="modal" data-bs-target="#updateMajorModal" onclick="updateMajor();">학과수정</div>
		            <div class="updateJob" style="display: inline;" data-bs-toggle="modal" data-bs-target="#updateJobModal" onclick="updateJob();">직급수정</div>
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
		                      <select class="form-select mb-n2 ajaxSelect selectMajor" style="width: 130px;">
		                          <option selected value="0">전체학과</option>
		                          <c:forEach var="major" items="${majorList}">
		                          	<option value="${major.majorNo}">${major.majorName}</option>
		                          </c:forEach>
		                      </select>
		                    </h6>
		                  </th>
		                  <th>
		                    <h6 class="fs-3 fw-semibold mb-0">
		                      <select class="form-select mb-n2 ajaxSelect selectJob" style="width: 130px;">
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
		                </tr>
		              </thead>
		              <tbody align="center" class="tableBody">
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
		              						<h6 class="fs-2 mb-0">${m.birth}</h6>
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
		              				</tr>
		              			</c:forEach>
		              		</c:otherwise>
		              	</c:choose>
		              </tbody>
		            </table>
		          </div>
		          
             <script>
       
               $(document).ready(function(){
            	   
            	   // 퇴직학과직급 처리버튼 숨기기
            	   $(".outAndUpdate").css("display", "none");  
            	   // 라디오버튼 재직중에 체크
                 $("#ingMember").attr('checked', true);

               })
               //////////////////////////ready(function) 종료//////////////////////////
               
               // 이름으로 직원 검색기능
               $(document).on("input", ".searchName", function(){
            	   if($(this).val().trim() == ""){
            		   memberFilter(1);	
            	   }else{
            		   memberNameFilter(1);
            	   }
               })
               
               // 이름으로 직원검색
               function memberNameFilter(page){
            	   
            	   let contextPath = "<c:out value='${pageContext.request.contextPath}' />";
            	   
				    		 let status = $(".selectStatus input[type=radio]:checked").val();
								 let majorNo = $(".selectMajor option:selected").val();
						     let jobNo = $(".selectJob option:selected").val();
						     let memName = $(".searchName").val();
						     
							   console.log("재직N / 전체all / 퇴직Y - ", status);
							   console.log("학과번호", majorNo);
							   console.log("직급번호", jobNo);
							   console.log("검색한 직원이름", memName);
							   
							   $.ajax({
								   url:"${contextPath}/admin/nameFilterMemberList.do",
								   type:"get",
								   data:"majorNo=" + majorNo + "&jobNo=" + jobNo + "&status=" + status + "&page=" + page + "&memName=" + memName,
								   success:function(list){
									   
									   console.log("ajax통신 성공시 받아온 map객체: ", list);
									   console.log("ajax통신 성공시 받아온 map객체의 member타입의 길이: ", list.member.length);
									   $(".tableBody").empty();
									   $(".pagination").empty();
									   
					            let filterTable = "";
					            if(list.member.length == 0){
					
					                filterTable += "<tr>"
		                               +    "<th colspan='10'>"
		                               +      "<h6 class='fs-2 mb-0'>직원이 없습니다.</h6>"
		                               +    "</th>"
		                               +	 "</tr>";
					
					            }else{
					
					                for(let i=0; i<list.member.length; i++){
					                    filterTable += "<tr>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>"
		                                   +           "<input type='checkbox' class='selectMember' value='" + list.member[i].memNo + "'>"
		                                   +       "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].memNo + "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0 memName'>" + list.member[i].memName + "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].majorNo + "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].jobNo + "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].birth + "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].email + "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].address + "</h6>"
		                                   +   "</th>"
		                                   +   "<th>"
		                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].hireDate + "</h6>"
		                                   +   "</th>"
		                                   + "</tr>";
					                }
					            } 
					
							            $(".tableBody").append(filterTable);
							            
							            // 페이징처리
							            let filterPage = "";
							            if(list.pi.listCount > list.pi.boardLimit){
								            filterPage += "<li class='page-item " + (list.pi.currentPage == 1 ? 'disabled' : '') + "'>"
											                  +    "<a class='page-link link' onclick='memberNameFilter(" + (list.pi.currentPage-1) + ");' aria-label='Previous'>"
											                  +        "<span aria-hidden='true'>"
											                  +            "<i class='ti ti-chevrons-left fs-4'></i>"
											                  +        "</span>"
											                  +    "</a>"
											                  + "</li>";
					
														for (let p=list.pi.startPage; p<=list.pi.endPage; p++) {
														    filterPage += "<li class='page-item " + (list.pi.currentPage == p ? 'disabled' : '') + "'>"
											                      +    "<a class='page-link link' onclick='memberNameFilter(" + p + ");' >"
											                      +        p
											                      +    "</a>"
											                      + "</li>";
														}
					
														filterPage += "<li class='page-item " + (list.pi.currentPage == list.pi.maxPage ? 'disabled' : '') + "'>"
											                  +    "<a class='page-link link' onclick='memberNameFilter(" + (list.pi.currentPage+1) + ");' aria-label='Next'>"
											                  +        "<span aria-hidden='true'>"
											                  +            "<i class='ti ti-chevrons-right fs-4'></i>"
											                  +        "</span>"
											                  +    "</a>"
											                  + "</li>";
								
								            $(".pagination").append(filterPage);
							            }
							            
						   			},
						        error:function(){
						            console.log("직원정보 및 상태값 필터링 ajax 통신 실패");
						        }
						   			
							   })

               }
               
               
               
                
               	// 체크박스 체크시 왼쪽상단 퇴직직급학과 처리 div 보이고 안보이고 처리
                $(document).on("change", ".selectMember" , function(){
                  if($(this).is(":checked")){
                    $(".outAndUpdate").css("display", "block");
                  }else{
                    $(".outAndUpdate").css("display", "none");
                  }
                })
                
                
               
                // ajax로 학과직급필터링
								$(".ajaxSelect, .selectStatus").on("change", function(){									
										memberFilter(1);						
								})
                
               
               // 직급수정 함수
               function updateJob(){
               	let checkedbox = $(".selectMember:checked");
               	
               	checkedbox.each(function(){
               		let multiValue = $(this).val();
               		let inputHidden = "<input type='hidden' name='memNo' value='" + multiValue + "'>"
               		$("#updateJobForm").append(inputHidden)
               	})
               	
               	
               	$('#updateJobModal').on('hidden.bs.modal', function () {
            		   	$('#updateJobForm').find('input[name="memNo"]').remove();
            		});

               }
               
               // 학과수정 함수
               function updateMajor(){
               	let checkedbox = $(".selectMember:checked");
               	
               	checkedbox.each(function(){
               		let multiValue = $(this).val();
               		let inputHidden = "<input type='hidden' name='memNo' value='" + multiValue + "'>"
               		$("#updateMajorForm").append(inputHidden)
               	})
               	
            		$('#updateMajorModal').on('hidden.bs.modal', function () {
            		    $('#updateMajorForm').find('input[name="memNo"]').remove();
            		});
               }
               
               // 퇴직처리 함수
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
               }
               
               
		          function memberFilter(page){										
							
								let contextPath = "<c:out value='${pageContext.request.contextPath}' />";
							
						    let status = $(".selectStatus input[type=radio]:checked").val();
								let majorNo = $(".selectMajor option:selected").val();
						    let jobNo = $(".selectJob option:selected").val();
			
						    console.log("재직N / 전체all / 퇴직Y - ", status);
						    console.log("학과번호", majorNo);
						    console.log("직급번호", jobNo);
			
						    $.ajax({
						    		url:"${contextPath}/admin/filterMemberList.do",
						        type:"get",
						        data:"majorNo=" + majorNo + "&jobNo=" + jobNo + "&status=" + status + "&page=" + page,
						        success:function(list){
						
						            console.log("ajax통신 성공시 받아온 map객체: ", list);
						            console.log("ajax통신 성공시 받아온 map객체의 member타입의 길이: ", list.member.length);
						            $(".tableBody").empty();
						            $(".pagination").empty();
						
						            let filterTable = "";
						            if(list.member.length == 0){
						
						                filterTable += "<tr>"
			                               +    "<th colspan='10'>"
			                               +      "<h6 class='fs-2 mb-0'>직원이 없습니다.</h6>"
			                               +    "</th>"
			                               +	 "</tr>";
						
						            }else{
						
						                for(let i=0; i<list.member.length; i++){
						                    filterTable += "<tr>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>"
			                                   +           "<input type='checkbox' class='selectMember' value='" + list.member[i].memNo + "'>"
			                                   +       "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].memNo + "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0 memName'>" + list.member[i].memName + "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].majorNo + "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].jobNo + "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].birth + "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].email + "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].address + "</h6>"
			                                   +   "</th>"
			                                   +   "<th>"
			                                   +       "<h6 class='fs-2 mb-0'>" + list.member[i].hireDate + "</h6>"
			                                   +   "</th>"
			                                   + "</tr>";
						                }
						            } 
						
						            $(".tableBody").append(filterTable);
						            
						            // 페이징처리
						            let filterPage = "";
						            if(list.pi.listCount > list.pi.boardLimit){
							            filterPage += "<li class='page-item " + (list.pi.currentPage == 1 ? 'disabled' : '') + "'>"
										                  +    "<a class='page-link link' onclick='memberFilter(" + (list.pi.currentPage-1) + ");' aria-label='Previous'>"
										                  +        "<span aria-hidden='true'>"
										                  +            "<i class='ti ti-chevrons-left fs-4'></i>"
										                  +        "</span>"
										                  +    "</a>"
										                  + "</li>";
				
													for (let p=list.pi.startPage; p<=list.pi.endPage; p++) {
													    filterPage += "<li class='page-item " + (list.pi.currentPage == p ? 'disabled' : '') + "'>"
										                      +    "<a class='page-link link' onclick='memberFilter(" + p + ");' >"
										                      +        p
										                      +    "</a>"
										                      + "</li>";
													}
				
													filterPage += "<li class='page-item " + (list.pi.currentPage == list.pi.maxPage ? 'disabled' : '') + "'>"
										                  +    "<a class='page-link link' onclick='memberFilter(" + (list.pi.currentPage+1) + ");' aria-label='Next'>"
										                  +        "<span aria-hidden='true'>"
										                  +            "<i class='ti ti-chevrons-right fs-4'></i>"
										                  +        "</span>"
										                  +    "</a>"
										                  + "</li>";
							
							            $(".pagination").append(filterPage);
						            }
						        },
						        error:function(){
						            console.log("직원정보 및 상태값 필터링 ajax 통신 실패");
						        }
						    })
		
							}
             </script>
             
             
		          <!-- 퇴직처리 모달-->
		          <form class="mt-4" action="${contextPath}/admin/outMember.do" method="get" id="outForm">
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
		          <form class="mt-4" action="${contextPath}/admin/updateMajorMember.do" method="get" id="updateMajorForm">
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
		                    <div class="modalDropdown">
		                      <select class="form-select mb-n2" name="majorNo" style="width: 180px;">
		                        <c:forEach var="m" items="${majorList}">
			                        <option value="${m.majorNo}">${m.majorName}</option>
		                        </c:forEach>
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
		          <form class="mt-4" action="${contextPath}/admin/updateJobMember.do" method="get" id="updateJobForm">
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
		                    <div class="modalDropdown">
		                      <select class="form-select mb-n2" name="jobNo" style="width: 130px;">
		                        <c:forEach var="j" items="${jobList}">
		                        	<option value="${j.jobNo}">${j.jobName}</option>
		                        </c:forEach>
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
		                <c:if test="${pi.listCount > pi.boardLimit}">
			                <li class="page-item ${pi.currentPage==1 ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/admin/memberList.do?page=${pi.currentPage-1}" aria-label="Previous">
			                    <span aria-hidden="true">
			                      <i class="ti ti-chevrons-left fs-4"></i>
			                    </span>
			                  </a>
			                </li>
			                
			                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				                <li class="page-item">
				                  <a class="page-link link ${pi.currentPage == p ? 'disabled' : ''}" href="${contextPath}/admin/memberList.do?page=${p}">
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
		                </c:if>
		              </ul>
		            </nav>
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
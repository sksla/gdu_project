<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
  .app_doc_table th, .app_doc_table td{
    text-align: center;
    vertical-align: middle;
    }
  .set_options>span:hover{
  	cursor: pointer;
  }
  .sign_area>img{width: 100%;}
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
</style>
</head>
<body>
	<div class="main-wrapper">

		<!-- 각 페이지 별 사이드 바 -->
		<jsp:include page="/WEB-INF/views/common/appSidebar.jsp" />

		<div class="page-wrapper">

			<!-- 이쪽에 헤더(상단바) -->
			<jsp:include page="/WEB-INF/views/common/header.jsp" />

			<!----------------------------- 본문 시작 -------------------->
			<div class="body-wrapper">
				<div class="container-fluid">

					<!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
					<!-- 페이지 타이틀 -->
					<div
						class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
						<div class="card-body px-4 py-3">
							<div class="row align-items-center">
								<div class="col-9">
									<h4 class="fw-semibold mb-8">자주쓰는 결재선</h4>
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a
												class="text-muted text-decoration-none"
												href="${ contextPath }">Home</a>
											</li>
											<li class="breadcrumb-item" aria-current="page">전자결재</li>
											<li class="breadcrumb-item" aria-current="page">자주쓰는 결재선</li>
										</ol>
									</nav>
								</div>
								<div class="col-3">
									<div class="text-center mb-n5">
										<img src="" alt="" class="img-fluid mb-n4" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
								<div class="mb-4">
									<div class="d-flex justify-content-between">
										<div class="" style="height: 38.33px; width: 30%;">
											<form class="d-flex flex-row search_form">
												<div class="input-group">
													<input type="text" class="form-control" name="search"
														placeholder="결재선 이름을 입력하세요."
														aria-label="Recipient's username"
														aria-describedby="basic-addon2">
													<button class="btn bg-secondary-subtle text-secondary" onclick="return valSearch();">검색</button>
												</div>
											</form>
										</div>
										&nbsp;&nbsp;&nbsp;&nbsp;
	                  <!-- 결재선 modal -->
	                  <!-- ------------------------------------------ -->
	                  <button type="button" class="btn me-1 mb-1 sm-subtle text-info px-2 fs-4 " data-bs-toggle="modal"
	                    data-bs-target="#app_line_modal" onclick="resetEnrollLineModal();">
	                    <b>결재선 등록</b>
	                  </button>
									</div>
								</div>
			
								<div class=" mb-4">
									<table
										class="table border text-nowrap mb-0 align-middle app_doc_table">
										<thead class="text-dark fs-4">
											<tr>
												<th width="130px">
													<h6 class="fs-4 fw-semibold mb-0">No</h6>
												</th>
												<th>
													<h6 class="fs-4 fw-semibold mb-0" width="60%">결재선 이름</h6>
												</th>
												<th width="180px">
													<h6 class="fs-4 fw-semibold mb-0">등록일</h6>
												</th>
												<th width="25%">
													<h6 class="fs-4 fw-semibold mb-0">설정</h6>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ empty lineList }">
													<tr>
														<td colspan="5">
															<p class="mb-0 fw-normal fs-4">등록된 결재선이 없습니다.</p>
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="line" items="${ lineList }"
														varStatus="varStatus">
														<tr>
															<td>
																<p class="mb-0 fw-normal fs-4">${ varStatus.count }</p>
															</td>
															<td>
																<p class="mb-0 fw-normal fs-4 app_title">
					                      	${ line.lineTitle }
					                      </p>
															</td>
															<td>
					                      <p class="mb-0 fw-normal fs-4">${ line.enrollDate }</p>
					                    </td>
															<td class="set_options">
																<span class="mb-0 fw-normal fs-4 app_title me-2 text-info modify_btn">
																	수정
																	<input type="hidden" name="no" value="${ line.lineNo }">
																	<input type="hidden" name="lineTitle" value="${ line.lineTitle }">
																</span> |
																<span class="mb-0 fw-normal fs-4 app_title ms-2 delete_btn" style="color: red;">
																	삭제
																	<input type="hidden" name="no" value="${ line.lineNo }">
																</span>
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
									<li class="page-item"><a
										class="page-link link ${pi.currentPage == pi.startPage ? 'disabled' : ''}"
										href="${contextPath}/approval/categoryList.do?page=${pi.currentPage - 1}&${keywordString}"
										aria-label="Previous"> <span aria-hidden="true"> <i
												class="ti ti-chevrons-left fs-4"></i>
										</span>
									</a></li>
									<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
										<li class="page-item"><a
											class="page-link link ${pi.currentPage == p ? 'active' : ''}"
											href="${contextPath}/approval/categoryList.do?page=${p}&${keywordString}">${p}</a>
										</li>
									</c:forEach>
									<li class="page-item"><a
										class="page-link link ${pi.maxPage == pi.currentPage ? 'disabled' : ''}"
										href="${contextPath}/approval/categoryList.do?page=${pi.currentPage + 1}&${keywordString}"
										aria-label="Next"> <span aria-hidden="true"> <i
												class="ti ti-chevrons-right fs-4"></i>
										</span>
									</a></li>
								</ul>
								
							</div>
						</div>
			
						<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
					</div>
				</div>
				<!-- body-wrapper end 본문 끝-->
		
			</div>
			<!-- page-wrapper end -->
	
		<!-- 세팅메뉴(바) -->
		<jsp:include page="/WEB-INF/views/common/settingbar.jsp" />

	</div>
	<!-- main-wrapper end -->
	
	<!-- modal content -->
    <div class="modal fade" id="app_line_modal" tabindex="-1"
      aria-labelledby="bs-example-modal-lg" aria-hidden="true">
      <div class="modal-dialog modal-xl">
        <div class="modal-content">
          <div class="modal-header d-flex align-items-center border-bottom">
            <h4 class="modal-title fw-semibold" id="myLargeModalLabel">
              결재선 등록
            </h4>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
              aria-label="Close"></button>
          </div>
          <div class="modal-body mx-4 my-2">
            <div class="mb-4 pb-4 row align-items-center border-bottom">
            	<form action="${ contextPath }/approval/enrollLine.do" method="post" id="line_form">
            		<input type="hidden" name="memNo" value="${ loginUser.memNo }">
	              <label for="" class="form-label fw-semibold col-sm-2 col-form-label fs-4">결재선 이름</label>
	              <div class="col-sm-7">
	                <input type="text" name="lineTitle" id="line_title_input" class="form-control" required>
	              </div>
              </form>
            </div>
            <div class="input-group mb-3">
              <div class="col-3">
                <div class="input-group">
                  <input type="text" class="form-control" id="search_box" placeholder="이름/부서명을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
                </div>
              </div>
              <span class="mx-2">
	                <div class="custom-control py-2 custom-radio">
	                  <input type="radio" id="customRadio1" name="searchRadio" value="name"
	                  			checked class="form-check-input searchRadio" />
	                  <label class="form-check-label" for="customRadio1">직원이름으로 검색</label>
	                </div>
	              </span>
	              <span class="mx-2">
	                <div class="custom-control py-2 custom-radio">
	                  <input type="radio" id="customRadio2" name="searchRadio" value="major" 
	                  			class="form-check-input searchRadio" />
	                  <label class="form-check-label" for="customRadio2">학과명으로 검색</label>
	                </div>
	              </span>
            </div>
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
                <div style="height: 220px; margin-bottom: 10px;">
                  <div class="app_mem_etc">
                    <div>
                      <div class="mb-2 add_collaborator" onclick="addAppMember('collaborator');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                      <div class="remove_collaborator" onclick="removeAppMember('collaborator');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                    </div>
                  </div>
                  <div class="app_collaborator app_mem">
                    <div class="box_header">협조자</div>
                    <div class="mem_list">
                    
                    </div>
                  </div>
                </div>
                <div style="height: 80px; margin-bottom: 10px;">
                  <div class="app_mem_etc">
                    <div>
                      <div class="mb-2 add_approver" onclick="addAppMember('approver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m10.5 9l3 3l-3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                      <div class="remove_approver" onclick="removeAppMember('approver');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="2em" height="2em" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" stroke-linejoin="round" d="m13.5 9l-3 3l3 3"/><path d="M2 12c0-4.714 0-7.071 1.464-8.536C4.93 2 7.286 2 12 2c4.714 0 7.071 0 8.535 1.464C22 4.93 22 7.286 22 12c0 4.714 0 7.071-1.465 8.535C19.072 22 16.714 22 12 22s-7.071 0-8.536-1.465C2 19.072 2 16.714 2 12Z" opacity="0.5"/></g></svg>
                      </div>
                    </div>
                  </div>
                  <div class="app_approver app_mem">
                    <div class="box_header">결재자</div>
                    <div class="mem_list">
                    
                    </div>
                  </div>
                </div>
                <div style="height: 80px;">
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
            <button type="button" class="btn btn-primary waves-effect text-start enroll_line_btn"
              onclick="confirmAppLine(this);">
              등록
            </button>
            <button type="button" class="btn btn-primary waves-effect text-start hide modify_line_btn"
              onclick="confirmAppLine(this);">
              수정
            </button>
            <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start"
              data-bs-dismiss="modal">
              닫기
            </button>
          </div>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>

	<!-- 해당 페이지 JavaScript 영역 start -->
	<script>
		// 검색 옵션 관련 전역변수
		let $search = "${optionMap.search}";
		// let $searchType = "${optionMap.searchType == null ? 'noOption' : optionMap.searchType}";
		// let $category = "${optionMap.category}";
		// let $tmp = "${optionMap.tmp}";

		$(document).ready(function() {

			$(".search_form input").val($search);
			// $("select[name='searchType']").val($searchType);
			
			// 결재선 삭제 처리
			$(".delete_btn").on("click", function(){
				if(confirm("결재선을 삭제하시겠습니까?")){
       		var $form = $("<form>", {
       		    "action": "${contextPath}/approval/delLine.do",
       		    "method": "post"
       		});
       		
       		$("body").append($form);
       		$form.append($(this).children("input").clone()).submit();
				}
			})
			
			// 결재선 수정 페이지
			$(".modify_btn").on("click", function(){
				resetEnrollLineModal();
				let $lineNo = $(this).children("input[name='no']").val();
				let $lineTitle = $(this).children("input[name='lineTitle']").val();
				$.ajax({
					url: "${contextPath}/approval/modifyPage.do",
					data: {no: $lineNo},
					method: "post",
					success: function(result){
						$("#line_form").append("<input type='hidden' name='lineNo' value='" + $lineNo + "'>");
						$("#line_title_input").val($lineTitle);
						// 협조자 추가
						if(result.collaboratorList != null){
							for(let collaborator of result.collaboratorList){
								let $collaborator = $("<div>" + collaborator.memName + " (" + collaborator.majorNo + ", " + collaborator.jobNo + ")" + "</div>");
								$collaborator.addClass("selected_collaborator")
								$collaborator.append("<span class='hide'>" + collaborator.memNo + "</span>")
												 		 .append("<span class='hide'>" + collaborator.majorNo + "</span>")
												 		 .append("<span class='hide'>" + collaborator.jobNo + "</span>")
												 		 .append("<span class='hide'>" + collaborator.memName + "</span>");
		       			$(".app_collaborator>.mem_list").append($collaborator);
							}
						}
						// 결재자 추가
						let $approver = $("<div>" + result.approver.memName + " (" + result.approver.majorNo + ", " + result.approver.jobNo + ")" + "</div>");
						$approver.addClass("selected_approver")
						$approver.append("<span class='hide'>" + result.approver.memNo + "</span>")
										 .append("<span class='hide'>" + result.approver.majorNo + "</span>")
										 .append("<span class='hide'>" + result.approver.jobNo + "</span>")
										 .append("<span class='hide'>" + result.approver.memName + "</span>");
       			$(".app_approver>.mem_list").append($approver);
						// 수신자 추가
       			let $receiver = $("<div>" + result.receiver.memName + " (" + result.receiver.majorNo + ", " + result.receiver.jobNo + ")" + "</div>");
       			$receiver.addClass("selected_receiver")
						$receiver.append("<span class='hide'>" + result.receiver.memNo + "</span>")
										 .append("<span class='hide'>" + result.receiver.majorNo + "</span>")
										 .append("<span class='hide'>" + result.receiver.jobNo + "</span>")
										 .append("<span class='hide'>" + result.receiver.memName + "</span>");
       			$(".app_receiver>.mem_list").append($receiver);
       			
       			$(".enroll_line_btn").addClass("hide");
       			$(".modify_line_btn").removeClass("hide");
       			
						$("#app_line_modal").modal("show");
					},
					error: function(){
						console.log()
					}
				})
			})
			
			// 결재선 선택 모달용 javascript *************************************
   		// 부서목록 리스트 조회
   		createMajorList("");
   		
			// 결재선 검색 기능
   		document.getElementById("search_box").onkeyup = function(e) {
   			let $searchType = $(".searchRadio:checked").val();
   			let $search = $("#search_box").val();
   			if($searchType == "name"){
   				if($search == ""){
       			$(".my_mem_list").empty();
       		}else{
          		$.ajax({
          			url:"${contextPath}/approval/searchMember.do",
          			data:{ search: $search },
          			type:"get",
          			success: function(list){
          				createMemList(list); // 변경
          			},
          			error: function(){
          				console.log("부서목록 생성 ajax 통신 실패");
          			}
          		})
       		}
       	}else{
       		if($search == ""){
       			createMajorList(""); // 변경
      		}else{
        		createMajorList($search);
      		}
	     	}
	    }
   		// **************************************************************
			
		})

		function valSearch() {
			if ($(".search_form input").val() == "") {
				alert("검색어를 입력해주세요.");
				return false;
			}
		}
		
		// 결재선 모달용 javascript ********************************************
    	// treeview의 부서 목록 생성
    	function createMajorList(search){
    		$.ajax({
    			url: "${contextPath}/approval/majorTreeList.do",
    			type: "get",
    			data: {search: search},
    			success: function(list){
    				majorTree = [];
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
    				testTreeView(search);
    			},
    			error: function(){
    				console.log("부서 목록 조회 실패");
    			}
    		})
    	}
    	
    	// 직원 목록 생성 함수
    	function createMemList(list){
				$(".my_mem_list").empty();
				for(const member of list){
					let $newEl = $("<div>" + member.memName + " (" + member.majorNo + ", " + member.jobNo + ")" + "</div>");
					$newEl.append("<span class='hide'>" + member.memNo + "</span>")
								.append("<span class='hide'>" + member.majorNo + "</span>")
								.append("<span class='hide'>" + member.jobNo + "</span>")
								.append("<span class='hide'>" + member.memName + "</span>");
					$(".my_mem_list").append($newEl);
				}
    	}
      
    	// 부서목록 treeview 생성 함수
    	function testTreeView(search){
    		
        $("#myTreeview").treeview({
            levels: (search == "" ? 1 : 99),
            selectedBackColor: "#03a9f3",
            onhoverColor: "rgba(0, 0, 0, 0.05)",
            expandIcon: "ti ti-plus",
            collapseIcon: "ti ti-minus",
            nodeIcon: "ti ti-circle",
            data: majorTree,
            showTags: true,
            highlightSelected: true,
        }).on("click", function(){ // 학과 treeview 클릭 이벤트
        	let $badge = $(".node-selected").find(".badge");
        	if($badge.eq(1).text() == "major"){
        		$.ajax({
        			url:"${contextPath}/approval/memberList.do",
        			data:{ majorNo: $badge.eq(0).text() },
        			type:"get",
        			success: function(list){
        				createMemList(list);
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
     		createMajorList("");
       	$(".mem_list").each(function(index, el){
       		$(el).empty();
       	})
       	$("#line_title_input").val("");
       	$(".modify_line_btn").addClass("hide");
				$(".enroll_line_btn").removeClass("hide");
     	}
    	
    	// 선택한 결재선 적용
    	function confirmAppLine(el){
    		if($(".app_approver>.mem_list").html().trim() == "" || $(".app_receiver>.mem_list").html().trim() == ""){
    			alert("결재자와 수신자를 지정해주세요.")
    			return false;
    		}
    		if($("#line_title_input").val().trim() == ""){
    			alert("결재선 이름을 입력해주세요.")
    			return false;
    		}
    		// 협조자
    		$("#line_form>input[name='collaboratorNo']").each(function(index, el){
    			$(el).remove();
    		});
    		if($(".selected_collaborator").length != 0){
    			$(".selected_collaborator").each(function(index, el){
    				$("#line_form").append('<input type="hidden" name="collaboratorNo" value="' + $(el).children().eq(0).text() + '">');
    			})
    		}
    		// 결재자
    		$("#line_form>input[name='approverNo']").remove();
    		if($(".selected_approver").length != 0){
    			let $selectedApproverProp = $(".selected_approver>span");
    			$("#line_form").append('<input type="hidden" name="approverNo" value="' + $selectedApproverProp.eq(0).text() + '">');
    		}
    		// 수신자
    		$("#line_form>input[name='receiverNo']").remove();
    		if($(".selected_receiver").length != 0){
    			let $selectedReceiverProp = $(".selected_receiver>span");
    			$("#line_form").append('<input type="hidden" name="receiverNo" value="' + $selectedReceiverProp.eq(0).text() + '">');
    		}
    		$("#line_form>input[name='modifyYN']").remove();
    		if(el.innerText == "수정"){
    			$("#line_form").append('<input type="hidden" name="modifyYN" value="Y">');
    		}
    		$("#line_form").submit();
    	}
    	// *****************************************************************
    	
	</script>
	<!-- 해당 페이지 JavaScript 영역 end-->

	<!-- footer-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- ck editor 연동 스크립트 -->
	
	<!-- treeview 연동 스크립트 -->
	<script src="../assets/libs/bootstrap-tree/dist/bootstrap-treeview.min.js"></script>
	<script src="../assets/js/plugins/bootstrap-treeview-init.js"></script>
</body>
</html>
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
									<h4 class="fw-semibold mb-8">
										결재양식 보관함<c:if test="${ optionMap.tmp eq 'Y' }">[임시저장]</c:if>
									</h4>
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a
												class="text-muted text-decoration-none"
												href="${ contextPath }">Home</a>
											</li>
											<li class="breadcrumb-item" aria-current="page">전자결재</li>
											<li class="breadcrumb-item" aria-current="page">결재양식 보관함</li>
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
														placeholder="결재양식 이름을 입력하세요."
														aria-label="Recipient's username"
														aria-describedby="basic-addon2">
													<button class="btn bg-secondary-subtle text-secondary "
														onclick="return valSearch();"
													>검색</button>
												</div>
											</form>
										</div>
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
													<h6 class="fs-4 fw-semibold mb-0" width="60%">결재양식 이름</h6>
												</th>
												<th width="180px">
													<div class="btn-group">
														<select class="form-select fs-4 fw-semibold selectGroupping"
															id="selectCategory" style="border: 0;">
															<option value="all" selected>구분</option>
															<c:forEach var="appCategory" items="${appCategories}">
																<option value="${appCategory}">${appCategory}</option>
															</c:forEach>
														</select>
													</div>
												</th>
												<th width="25%">
													<h6 class="fs-4 fw-semibold mb-0">설정</h6>
												</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ empty formList }">
													<tr>
														<td colspan="5">
															<p class="mb-0 fw-normal fs-4">결재양식이 존재하지 않습니다.</p>
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach var="form" items="${ formList }"
														varStatus="varStatus">
														<tr>
															<td>
																<p class="mb-0 fw-normal fs-4">${ varStatus.count }</p>
															</td>
															<td>
																<p class="mb-0 fw-normal fs-4 app_title">
					                      	${ form.appFormName }&nbsp;<c:if test="${ optionMap.tmp eq 'Y' }">[임시저장]</c:if>
					                      </p>
															</td>
															<td>
					                      <p class="mb-0 fw-normal fs-4">${ form.appCategory }</p>
					                    </td>
															<td class="set_options">
																<span class="mb-0 fw-normal fs-4 app_title me-2 text-info modify_btn">
																	수정
																	<input type="hidden" name="no" value="${ form.appNo }">
																</span>
																<c:if test="${ optionMap.tmp ne 'Y' }">
																 |
																<span class="mb-0 fw-normal fs-4 app_title ms-2 delete_btn" style="color: red;">
																	삭제
																	<input type="hidden" name="appNo" value="${ form.appNo }">
																</span>
																</c:if>
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

	<!-- 해당 페이지 JavaScript 영역 start -->
	<script>
		// 검색 옵션 관련 전역변수
		let $search = "${optionMap.search}";
		// let $searchType = "${optionMap.searchType == null ? 'noOption' : optionMap.searchType}";
		let $category = "${optionMap.category}";
		let $tmp = "${optionMap.tmp}";

		$(document).ready(function() {

			$("#selectCategory").val($category);
			$(".search_form input").val($search);
			// $("select[name='searchType']").val($searchType);

			$(".selectGroupping")
					.on(
							"change",
							function() {
								$category = $("#selectCategory").val();
								location.href = "${contextPath}/approval/categoryList.do?search="+ $search
																																			+ "&category=" + $category
																																			+ "&tmp=" + $tmp;
							});
			
			// 양식 삭제 처리
			$(".delete_btn").on("click", function(){
				if(confirm("삭제된 결재양식은 임시문서로 이동합니다.\n 삭제하시겠습니까?")){
       		var $form = $("<form>", {
       		    "action": "${contextPath}/approval/delForm.do",
       		    "method": "post"
       		});
       		
       		$("body").append($form);
       		$form.append($(this).children("input").clone()).submit();
				}
			})
			
			// 양식 수정페이지로 이동
			$(".modify_btn").on("click", function(){
     		var $form = $("<form>", {
     		    "action": "${contextPath}/approval/modifyForm.page",
     		    "method": "post"
     		});
     		
     		$("body").append($form);
     		$form.append($(this).children("input").clone()).submit();
			})
			
		})

		function valSearch() {
			if ($(".search_form input").val() == "") {
				alert("검색어를 입력해주세요.");
				return false;
			} else {
				$(".search_form")
						.append(
								"<input type='hidden' name='category' value='" + $category + "'>")
						.append(
								"<input type='hidden' name='tmp' value='" + $tmp + "'>");
			}
		}
	</script>
	<!-- 해당 페이지 JavaScript 영역 end-->

	<!-- footer-->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- ck editor 연동 스크립트 -->
</body>
</html>
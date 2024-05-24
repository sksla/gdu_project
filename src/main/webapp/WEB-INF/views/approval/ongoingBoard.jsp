<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재</title>
<style>
  .app_doc_table th, .app_doc_table td{
    text-align: center;
    vertical-align: middle;}
  .app_title:hover{cursor: pointer;}
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/appSidebar.jsp"/>
    
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
                <h4 class="fw-semibold mb-8">전자결재</h4>
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a class="text-muted text-decoration-none" href="../main/index.html"
                        >Home
                      </a>
                    </li>
                    <li class="breadcrumb-item" aria-current="page">결재문서함</li>
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
              <div class="d-flex justify-content-between">
                <div class="" style="height: 38.33px; width: 30%;">
                  <form action="${contextPath}/approval/ongoingBoard.do" method="get" class="d-flex flex-row search_form">
                    <div class="input-group">
                      <input type="text" class="form-control" name="search" placeholder="문서 제목을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
                      <button class="btn bg-secondary-subtle text-secondary" onclick="return valSearch();">검색</button>
                    </div>
                    <!-- 
                    <div class="form-group" style="width: 150px;">
                      <select class="form-select" name="searchType" id="">
	                      <option value="noOption" selected>검색옵션</option>
	                      <option value="title">제목</option>
	                      <option value="no">문서번호</option>
                      </select>
                    </div>
                     -->
                  </form>
                </div>
                <form action="${contextPath}/approval/ongoingBoard.do" class="d-flex flex-row date_form" style="height: 38.33px;">
                  <label for="" class="form-label fw-semibold col-form-label fs-3">기안일 :</label>&nbsp;&nbsp;
                  <span class="form-group">
                    <input type="date" name="startDate" class="form-control" value="2024-05-20">
                  </span>
                  &nbsp;<label for="" class="form-label fw-semibold col-form-label fs-3"> ~ </label>&nbsp;
                  <span class="form-group">
                    <input type="date" name="endDate" class="form-control">
                  </span>
                  <button class="btn btn-info dateSearch">검색</button>
                </form>
              </div>
            </div>
            <div class=" mb-4">
              <table class="table border text-nowrap mb-0 align-middle app_doc_table">
                <thead class="text-dark fs-4">
                  <tr>
                    <th width="130px">
                      <h6 class="fs-4 fw-semibold mb-0">No</h6>
                    </th>
                    <th>
                      <h6 class="fs-4 fw-semibold mb-0">제목</h6>
                    </th>
                    <th width="140px">
                      <h6 class="fs-4 fw-semibold mb-0">기안일</h6>
                    </th>
                    <th width="180px">
                      <div class="btn-group">
                        <select class="form-select fs-4 fw-semibold selectGroupping" id="selectCategory" style="border:0;">
                          <option value="all" selected>구분</option>
                          <c:forEach var="appCategory" items="${appCategories}">
                         		<option value="${appCategory}">${appCategory}</option>
                         	</c:forEach>
                      	</select>
                      </div>
                    </th>
                    <th width="130px">
                      <div class="btn-group">
                        <select class="form-select fs-4 fw-semibold selectGroupping" id="selectStatus" style="border:0;">
                          <option value="all">상태</option>
                          <option value="10">협조</option>
                          <option value="20">결재</option>
                          <option value="30">수신</option>
                      	</select>
                      </div>
                    </th>
                  </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${ empty appDocList }">
                			<tr>
		                    <td colspan="5">
		                      <p class="mb-0 fw-normal fs-4">결재문서가 존재하지 않습니다.</p>
		                    </td>
		                  </tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="appDoc" items="${ appDocList }" varStatus="varStatus">
                			<tr>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${ varStatus.count }</p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4 app_title">
		                      	${ appDoc.docTitle }
                						<input type=hidden name="no" value="${ appDoc.docNo }">
		                      </p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${ appDoc.draftDate }</p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${ appDoc.appCategory }</p>
		                    </td>
		                    <td>
		                      <p class="mb-0 fw-normal fs-4">${ appDoc.status }</p>
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
                <a class="page-link link ${pi.currentPage == pi.startPage ? 'disabled' : ''}" href="${contextPath}/approval/ongoingBoard.do?page=${pi.currentPage - 1}&${keywordString}" aria-label="Previous">
                  <span aria-hidden="true">
                    <i class="ti ti-chevrons-left fs-4"></i>
                  </span>
                </a>
              </li>
              <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
              <li class="page-item">
                <a class="page-link link ${pi.currentPage == p ? 'active' : ''}" href="${contextPath}/approval/ongoingBoard.do?page=${p}&${keywordString}">${p}</a>
              </li>
              </c:forEach>
              <li class="page-item">
                <a class="page-link link ${pi.maxPage == pi.currentPage ? 'disabled' : ''}" href="${contextPath}/approval/ongoingBoard.do?page=${pi.currentPage + 1}&${keywordString}" aria-label="Next">
                  <span aria-hidden="true">
                    <i class="ti ti-chevrons-right fs-4"></i>
                  </span>
                </a>
              </li>
            </ul>

          </div>
        </div>    
				<!-- ----------------------------- 실제 내용 작성 영역 end ----------------------------- -->
				
        </div>
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 해당 페이지 JavaScript 영역 start -->
    <script>
    	// 검색 옵션 관련 전역변수
   		let $search = "${optionMap.search}";
   		// let $searchType = "${optionMap.searchType == null ? 'noOption' : optionMap.searchType}";
			let $category = "${optionMap.category}";
      let $status = "${optionMap.status}";
      let $startDate = "${optionMap.startDate}"
      let $endDate = "${optionMap.endDate}"
      
    	$(document).ready(function(){
    		
    		$("#selectCategory").val($category);
    		$("#selectStatus").val($status);
    		$(".search_form input").val($search);
    		// $("select[name='searchType']").val($searchType);
    		$("input[name='startDate']").val($startDate);
    		$("input[name='endDate']").val($endDate);
    		
    		$(".selectGroupping").on("change", function(){
       		$category = $("#selectCategory").val();
       		$status = $("#selectStatus").val();
       		location.href="${contextPath}/approval/ongoingBoard.do?search=" + $search 
       																												+ "&category=" + $category 
       																												+ "&status=" + $status
       																												+ "&startDate=" + $startDate
       																												+ "&endDate=" + $endDate;
       	})
       	
       	$(".dateSearch").on("click", function(){
       		$(".date_form").append("<input type='hidden' name='category' value='" + $category + "'>")
												 .append("<input type='hidden' name='status' value='" + $status + "'>")
												 .append("<input type='hidden' name='search' value='" + $search + "'>")
       	})
       	
       	// post 방식으로 이동
       	$(".app_title").on("click", function(){
       		var $form = $("<form>", {
       		    "action": "${contextPath}/approval/detail.do",
       		    "method": "post"
       		});
       		
       		$("body").append($form);
       		$form.append($(this).children("input")).submit();
       	})
        
    	})

      function valSearch(){
  			if($(".search_form input").val() == ""){
  				alert("검색어를 입력해주세요.");
  				return false;
  			}else{
  				$(".search_form").append("<input type='hidden' name='category' value='" + $category + "'>")
  												 .append("<input type='hidden' name='status' value='" + $status + "'>")
  												 .append("<input type='hidden' name='startDate' value='" + $startDate + "'>")
  												 .append("<input type='hidden' name='endDate' value='" + $endDate + "'>");
  			}
  		}
    	
    </script>
    <!-- 해당 페이지 JavaScript 영역 end-->
    
    <!-- 세팅메뉴(바) -->
	  <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>
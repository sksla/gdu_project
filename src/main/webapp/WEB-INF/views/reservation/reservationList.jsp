<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 목록</title>

<style>
	.search-style{
	  height:35px; 
	  color:#5a6a85; 
	  border: 1px solid #dfe5ef;
	}
	
	.unreturn-col-1{width:237px; max-width: 237px;}
  .unreturn-col-2{width:305px; max-width: 305px;}
  .unreturn-col-3{width:242px; max-width: 242px;}
  .unreturn-col-4{width:271px; max-width: 271px;}
  .reserve-col-1{width:135px; max-width: 135px;}
  .reserve-col-2{width:208px; max-width: 208px;}
  .reserve-col-3{width:370px; max-width: 370px;}
  .reserve-col-4{width:160px; max-width: 160px;}
  .reserve-col-5{width:180px; max-width: 180px;}
  
  .ellipsis{
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
 }

</style>

</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/reservationSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">나의 예약 목록</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">예약</li>
                      <li class="breadcrumb-item" aria-current="page">나의 예약 목록</li>
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
              <h5 class="fw-semibold mb-8">미반납 비품 내역</h5>
              <br>

              <table class="unreturned_table table border text-nowrap mb-0 align-middle">
                <thead align="center">
                  <tr>
                    <th width="237px">자원명</th>
                    <th width="305px">예약시간</th>
                    <th width="242px">예약수량</th>
                    <th width="271px">상세조회</th>
                  </tr>
                </thead>
                <tbody align="center">
                  
                </tbody>
              </table>
              <br>

              <ul class="pagination justify-content-center unreturned_pagination">
                
              </ul>
            </div>
          </div>

          <div class="card">
            <div class="card-body">
              <h5 class="fw-semibold mb-8">예약 내역</h5>
              <br>
							<div class="d-flex">
	              <form id="searchForm" class="mt-3">
	                <select name="condition" class="search-style" id="condition" onchange="ajaxSearchReservationList(1);">
	               		<option value="0">전체</option>
	                   <option value="1">회의실</option>
	                   <option value="2">강의실</option>
	                   <option value="3">기타</option>
	                   <option value="4">비품</option>
	                </select>
	                <input type="text" class="search-style" name="keyword" id="keyword">
	                <button type="button" class="btn btn-outline-primary" onclick='clickSearchBtn();'>검색</button>
	              </form>
	              <div class="d-flex justify-content-start align-items-end">
	                <a href="#" id="resetBtn" onclick="resetSearch();" style="display:none; text-decoration:none; color:#49beff;"><i class="ti ti-reload"></i>검색 취소</a>
	              </div>
							</div>
              <br>

              <table class="table border reservation_table">
                <thead align="center">
                  <tr>
                    <th width="135px">분류</th>
                    <th width="208px">자원명</th>
                    <th width="370px">예약시간</th>
                    <th width="160px">예약상태</th>
                    <th width="180px">상세조회</th>
                  </tr>
                </thead>
                <tbody align="center">
                  <tr>
                   
                  </tr>
                </tbody>
              </table>
              <br>

              <ul class="pagination justify-content-center reservation_pagination">
                
              </ul>

            </div>
          </div>

          <!-- The Modal -->
          <div class="modal" id="detailModal">
            <div class="modal-dialog">
              <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                  <h4 class="modal-title">예약 상세 조회</h4>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                	<input type="hidden" name="revNo" value="0">
                  <table class="table">
                    <tbody>
                      <tr>
                        <th width="100px">자원명</th>
                        <td id="resName"></td>
                      </tr>
                      <tr>
                        <th>예약시간</th>
                        <td id="revDate"></td>
                      </tr>
                      <tr>
                        <th>신청자</th>
                        <td id="memName"></td>
                      </tr>
                      <tr>
                        <th>사용 용도</th>
                        <td id="revReason"></td>
                      </tr>
                      <!-- * 비품 예약일 경우 -->
                      <tr id="revCount" style="display:none;">
                        <th>예약 수량</th>
                        <td></td>
                      </tr>
                      <tr>
                        <th>예약 상태</th>
                        <td id="status"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer justify-content-center">
                  <button type="button" class="btn btn-danger deleteBtn" data-bs-dismiss="modal" onclick="deleteValidate();">삭제</button>
                  <button type="button" class="btn btn-info" data-bs-dismiss="modal">확인</button>
                </div>

              </div>
            </div>
          </div>
          
          <script>
          	//let reserveArr;
          	//let unreturnedArr;
          	$(document).ready(function(){
          		ajaxSearchReservationList(1);
          		ajaxSelectUnreturnedList(1);
          	})
          	
          	function ajaxSearchReservationList(requestPage){
          		
          		$.ajax({
          			url:"${contextPath}/reservation/searchReservation.do",
          			type:"post",
         				async:false,
          			data:{
          				page:requestPage,
          				condition:$("#condition").val(),
          				keyword:$("#keyword").val()
          			},
          			success:function(rep){
          				//reserveArr = new Array();
          				
          				let list = rep.list;
          				let tbody = "";
          				
          				if(list.length > 0){
          					for(let i=0; i<list.length; i++){
		          				let resType = list[i].resType;
		  								let resTypeStr = resType == "1" ? "회의실" 
		  																								: (resType == "2" ? "강의실" 
		  																																	: (resType == "3" ? "기타" : "비품")); 
		  								let status  = "승인";
		  								let color = "blue";
		  								
		  								if(resType == "4"){
		  									status = list[i].status == "1" ? "미반납" : "반납";
		  									color = list[i].status == "1" ? "red" : "blue";
		  								}
          						let reserveTime = resType == "4" ? list[i].revDate : list[i].revDate + " " + list[i].startTime + " ~ " + list[i].endTime;
		  								let buttonHtml = "<button type='button' class='btn btn-primary btn-sm' onclick='openDetailModal(" 
		  								    + list[i].revNo + ","
		  								    + "\"" + list[i].resType + "\", "
		  								    + "\"" + list[i].resNo + "\", "
		  								    + "\"" + reserveTime + "\", "
		  								    + "\"" + list[i].memName + "\", "
		  								    + "\"" + list[i].revReason + "\", "
		  								    + "\"" + status + "\", "
		  								    + "0"
		  								    + ");'>상세조회</button>";
		  								tbody += "<tr>"
          	                 +		"<td class='reserve-col-1 ellipsis'>" + resTypeStr + "</td>"
          	                 +		"<td class='reserve-col-2 ellipsis'>" + list[i].resNo + "</td>"
          	                 +		"<td class='reserve-col-3 ellipsis'>" + reserveTime + "</td>"
          	                 +		"<td class='reserve-col-3 ellipsis' style='color:" + color + ";'>" + status + "</td>"
          	                 +		"<td class='reserve-col-5 ellipsis'>"
          	                 +		buttonHtml
          	                 +		"</td>"
          	                 + "</tr>";
          						
   	                 //reserveArr.push(list[i]);
   	                 
          					}
          					
	          				drawPage(1, rep.pi);
          					
          				}else{
          					tbody += "<tr><td colspan='5'>조회 결과가 없습니다.</td></tr>";
          				}
          				
          				$(".reservation_table tbody").html(tbody);
          			}, 
          			error:function(){
          				console.log("예약 내역 목록 조회용 ajax 통신 실패");
          			}
          		})
          	}
          	
          	function ajaxSelectUnreturnedList(requestPage){
          		$.ajax({
          			url:"${contextPath}/reservation/unreturedList.do",
          			type:"post",
          			async:false,
          			data:{page:requestPage},
          			success:function(rep){
          				//unreturnedArr = new Array();
          				console.log("rep",rep.list);
          				let list = rep.list;
          				let tbody = "";
          				if(list.length > 0){
          					for(let i=0; i<list.length; i++){
          						
          						let status = list[i].status == "1" ? "미반납" : "반납";
          						
          						tbody += "<tr>"
          	                 +		"<td class='unreturn-col-1 ellipsis'>" + list[i].resNo + "</td>"
          	                 +		"<td class='unreturn-col-2 ellipsis'>" + list[i].revDate + "</td>"
          	                 +		"<td class='unreturn-col-3 ellipsis'>" + list[i].revCount + "개</td>"
          	                 +		"<td class='unreturn-col-4 ellipsis'><button type='button' class='btn btn-primary btn-sm' onclick=\"openDetailModal(" + list[i].revNo + ", '4'"  + ", '" + list[i].resNo + "', '" + list[i].revDate + "', '" + list[i].memName + "', '" + list[i].revReason + "', '" + status + "'," + list[i].revCount + ");\">상세조회</button></td>"
          	                 + "</tr>";
          	                 
          						//unreturnedArr.push(list[i]);
		          				drawPage(2, rep.pi);
          					}
          				}else{
          					tbody += "<tr><td colspan='5'>조회 결과가 없습니다.</td></tr>";
          				}
          				
          				$(".unreturned_table tbody").html(tbody);
          			},
          			error:function(){
          				console.log("미반납 예약 내역 목록 조회용 ajax 통신실패");
          			}
          		})
          	}
          	
          	function drawPage(type, pi){
          		console.log(pi);
          		let ulClassName = (type == 1 ? ".reservation_pagination" : ".unreturned_pagination");
          		let functionName =  (type == 1 ? "ajaxSearchReservationList" : "ajaxSelectUnreturnedList");
          		let paging = "";
          		
          		paging += "<li class='page-item " + (pi.currentPage == 1 ? "disabled" : "") + "'>"
          						+		"<a class='page-link link' href='#' onclick='" + functionName + "(" + (pi.currentPage - 1 ) + ");'" +  " aria-label='Previous'>"
          						+			"<span aria-hidden='true'>"
          						+				"<i class='ti ti-chevrons-left fs-4'></i>"
          						+			"</span>"
          						+		"</a>"
          						+	"</li>";
   						
   						for(let p=pi.startPage; p<=pi.endPage; p++){
          			if(p == pi.currentPage){
          				paging += "<li class='page-item'><a class='page-link link active' onclick='" + functionName + "(" + p + ");' href='#'>" + p + "</a></li>";
          			}else{
          				paging += "<li class='page-item'><a class='page-link link' onclick='" + functionName + "(" + p + ");' href='#'>" + p + "</a></li>";
          			}
        			}
   						
   						paging += "<li class='page-item " + (pi.currentPage == pi.maxPage ? "disabled" : "") + "'>"
				  						+		"<a class='page-link link' href='#' onclick='"+ functionName + "(" + (pi.currentPage + 1 ) + ");'" +  " aria-label='Next'>"
				  						+			"<span aria-hidden='true'>"
				  						+				"<i class='ti ti ti-chevrons-right fs-4'></i>"
				  						+			"</span>"
				  						+		"</a>"
				  						+	"</li>";
          						
          		$(ulClassName).html(paging);
          	}
          	
          	// 검색버튼 클릭
          	function clickSearchBtn(){
          		if($("#keyword").val() == null || $("#keyword").val().trim().length == 0 ){
          			alert("검색어를 입력해주세요.");
          		}else{
          			ajaxSearchReservationList(1);
          			$("#resetBtn").css("display", "block");
          		}
          	}
          	
          	// 검색 초기화 검색 취소
          	function resetSearch(){
          		const selectElement = document.getElementById("condition");
              const options = selectElement.options;
          		
              const keyword = document.getElementById("keyword");
          		keyword.value = "";
          		
          		for(let i=0; i<options.length; i++){
          			options[i].selected = false;
          		}
          		$("#resetBtn").css("display", "none");
          		ajaxSearchReservationList(1);
          	}
          	
          	// 상세조회 모달창 열기
          	function openDetailModal(revNo, resType, resName, revDate, memName, revReason, status, revCount){
          		//let arr = type == 1 ? reserveArr : unreturnedArr;
          		
          		if(resType == "4"){
          			$("#detailModal #revCount td").text(revCount + "개");
          			$("#detailModal #revCount").css("display", "table-row");
          		}else{
          			$("#detailModal #revCount").css("display", "none");
          		}
          		
          		$("#detailModal .deleteBtn").css("display", (status == "미반납" ? "none" : "inline"));
          		
          		$("#detailModal input[type='hidden'][name='revNo']").val(revNo);
          		$("#detailModal #resName").text(resName);
          		$("#detailModal #revDate").text(revDate);
          		$("#detailModal #memName").text(memName);
          		$("#detailModal #revReason").text(revReason);
          		$("#detailModal #status").text(status);
          		$("#detailModal").modal("show");
          	}
          	
          	// 예약 내역 삭제
          	function ajaxDeleteReservation(revNo){
          		
          			$.ajax({
          				url:"${contextPath}/reservation/deleteReservation.do",
          				type:"post",
          				data:{no:revNo},
          				success:function(result){
          					if(result > 0){
          						alert("예약이 성공적으로 삭제되었습니다.");
          					}else{
          						alert("예약 삭제에 실패하였습니다.");
          					}
          				},
          				error:function(){
          					console.log("예약 삭제 ajax 통신 실패");
          				}
          			})
          		
          	}
          	
          	function deleteValidate(){
          		let $revNo = $("#detailModal input[type='hidden'][name='revNo']").val();
          		let status = document.getElementById("status").textContent;
          		let revDate = document.getElementById("revDate").textContent;
          		// type == 1(시설) | 2(비품)
          		let type = revDate.indexOf("~") == -1 ? 2 : 1;
          		
          		if(type == 2 && confirm("예약 내역을 삭제하시겠습니까?")){
          			
          			ajaxDeleteReservation($revNo);
          			
          		}else{
          			// 문자열에서 시작 시간과 종료 시간 추출
          			let now = new Date();
       	        let [datePart, timePart] = revDate.split(/ (.+)/);
       	        let [startTime, endTime] = timePart.split(' ~ ');

       	        // 문자열을 Date 객체로 변환
       	        let startDateTime = new Date(datePart + ' ' + startTime);
       	        let endDateTime = new Date(datePart + ' ' + endTime);

       	        // 현재 시간과 예약 시간 비교
       	        if (now < startDateTime) {
     	            // 현재 시간이 시작 시간보다 이전인 경우
     	            let confirmCancel = confirm('예약을 취소하시겠습니까?');
     	            if (confirmCancel) {
     	            	ajaxDeleteReservation($revNo);
     	            } 
       	            
       	        } else if (now >= startDateTime && now <= endDateTime) {
     	            // 현재 시간이 예약 시간 내에 있는 경우
     	            alert('현재 예약이 진행중이므로 삭제할 수 없습니다.');
       	        } else if (now > endDateTime) {
     	            // 현재 시간이 종료 시간보다 이후인 경우
     	            let confirmDelete = confirm('예약 내역을 삭제하시겠습니까?');
     	            
     	            if (confirmDelete) {
	 	                // 예약 삭제 로직
	 	                ajaxDeleteReservation($revNo);
     	            } 
       	        }
          		}
          		ajaxSearchReservationList(1);
          		ajaxSelectUnreturnedList(1);
          		
          	}
          	
          </script>
          
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자원관리</title>
<style>
  .updateResource{margin-left:20px; margin-right:50px; cursor:pointer; color:blue;}
  .deleteResource{margin-right:50px; cursor:pointer; color:blue;}
  .myModalBody *{font-size: 12px;}
  .modalText{
    color: black;
    font-size: 17px;
  }
  .deleteCheck{
    margin-right: 7px;
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
  .modalText *{font-size: 18px;}
  .tableBody tr{cursor: pointer;}
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/adminSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">자원 리스트</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자원</li>
                      <li class="breadcrumb-item" aria-current="page">자원 리스트</li>
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
							
              <div class="filter" style="text-align: right;">
                <select class="form-select mb-n2 ajaxSelect" style="width: 180px; display: inline-block;" >
                  <option value="0" selected>전체(${allCount}개)</option>
                  <option value="1">회의실(${meetingCount}개)</option>
                  <option value="2">강의실(${recCount}개)</option>
                  <option value="3">기타(${thatCount}개)</option>
                  <option value="4">비품(${objectCount}개)</option>
                </select> <br><br>
              </div>
              
              <input id="searchName" type="text" class="form-control searchName" placeholder="자원명으로 검색">
							<br>
              <div id="deleteAndUpdate"  style="display: none;">
                <div class="updateResource" style="display: inline;" data-bs-toggle="modal" data-bs-target="" onclick="updateResource();">수정</div>
                <div class="deleteResource" style="display: inline;" data-bs-toggle="modal" data-bs-target="#deleteResource" onclick="deleteResource();">삭제</div>
              </div>
            
              <table class="table border text-nowrap mb-0 align-middle">
                <thead class="text-dark fs-3" align="center">
                  <tr>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0"></h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">타입</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">자원명</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">위치</h6>
                    </th>
                    <th>
                      <h6 class="fs-3 fw-semibold mb-0">비고</h6>
                    </th>
                  </tr>
                </thead>
                <tbody align="center" class="tableBody">
                	<c:forEach var="r" items="${resourceList}">
	                  <tr onclick="resourceDetail(${r.resNo});">
	                    <th class="selectResourceCheck">
	                      <h6 class="fs-2 mb-0">
	                        <input type="checkbox" value="${r.resNo}" class="selectResource" onclick="event.stopPropagation();">
	                        <input type="hidden" value="${r.resDetail}" class="resDetail" >
	                      </h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0 resType">${r.resType}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0 resName">${r.resName}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0 resGps">${r.resGps}</h6>
	                    </th>
	                    <th>
	                      <h6 class="fs-2 mb-0 stock">
	                      	<c:choose>
	                      		<c:when test="${r.stock eq '0'}">
	                      			-
	                      		</c:when>
	                      		<c:otherwise>
	                      			${r.stock}개
	                      		</c:otherwise>
	                      	</c:choose>
	                      </h6>
	                    </th>
	                  </tr>
                  </c:forEach>
                </tbody>
              </table>
              <br><br>

              <div style="text-align: right;">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#insertResource">자원등록</button>
              </div>

              <!-- 자원삭제 모달 -->
              <form class="mt-4" action="${contextPath}/admin/deleteResource.do" method="post" id="deleteForm">
                <div class="modal fade" id="deleteResource" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered deleteModal">
                    <div class="modal-content">
                      <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title" id="myLargeModalLabel">
                          자원삭제
                        </h4>
                      </div>
                      <hr>
                      <div class="modal-body myModalBody">
                        <div class="modalText">
                         	<div class="oneDelete" style="display: none;">
                         		<span class="deleteName"></span>을(를) 삭제 하시겠습니까??<br>
                         		삭제시 해당 자원은 이용 및 조회가 불가능합니다.
                         	</div>
                         	<div class="multiDelete" style="display: none;">
                         		선택한 <span class="deleteCount"></span>개의 자원을 삭제하시겠습니까?<br>
                         		삭제시 해당 자원들은 이용 및 조회가 불가능합니다.
                         	</div>
                         	<br>
                          <div class="deleteCheck">
                            <input type="checkbox" required > &nbsp; 삭제하겠습니다 (필수)
                          </div>   
                        </div>
                        <br>
                        <textarea class="form-control" name="delContent" rows="3" placeholder="삭제사유를 입력해주세요.(분실/파손/기타 사유 직접입력)"></textarea>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">삭제</button>
                        <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">취소</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>


              <!-- 자원등록 모달 -->
              <form class="mt-4" action="${contextPath}/admin/insertResource.do" method="post">
                <div class="modal fade" id="insertResource" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered updateModal">
                    <div class="modal-content">
                      <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title" id="myLargeModalLabel">
                          자원등록
                        </h4>
                      </div>
                      <hr>
                      <div class="modal-body myModalBody">
                      	<table>
                      		<tr>
                      			<td>종류: </td>
                      			<td>
		                      		<select class="form-select mb-n2 selectType" name="resType" style="width: 130px;">
		                            <option value="1">회의실</option>
		                            <option value="2">강의실</option>
		                            <option value="3">기타</option>
		                            <option value="4">비품</option>
		                          </select>
                      			</td>
                      		</tr>
                      	</table>
                      	<br>
                      	<table>
                      		<tr>
                      			<td>자원명: </td>
                      			<td><input type="text" class="form-control" name="resName" style="width: 300px;" placeholder="등록할 자원명을 입력해주세요."></td>
                      		</tr>
                      		<tr>
                      			<td>위치: </td>
                      			<td><input type="text" class="form-control gps" name="resGps" style="width: 300px;" placeholder="(위치를 입력해주세요.)"></td>
                      		</tr>
                      		<tr>
                      			<td>수량: </td>
                      			<td><input type="number" class="form-control stock" name="stock" style="width: 300px;" placeholder="(비품일 경우에 입력해주세요.)"></td>
                      		</tr>
                      		<tr>
                      			<td colspan="2"><textarea class="form-control" name="resDetail" rows="3" placeholder="상세설명"></textarea></td>
                      		</tr>
                      	</table>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">등록</button>
                        <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">취소</button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>

              <!-- 자원수정 모달 -->
              <form class="mt-4" action="${contextPath}/admin/updateResource.do" method="post" id="updateForm">
                <div class="modal fade" id="updateResource" tabindex="-1" aria-labelledby="vertical-center-modal" style="display: none;" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered updateModal">
                    <div class="modal-content">
                      <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title" id="myLargeModalLabel">수정하기</h4>
                      </div>
                      <hr>
                      <div class="modal-body myModalBody">
                      	<table>
                      		<tr>
                      			<td>종류: </td>
                      			<td>
		                      		<select class="form-select mb-n2 selectType" name="resType" style="width: 130px;">
		                            <option value="1">회의실</option>
		                            <option value="2">강의실</option>
		                            <option value="3">기타</option>
		                            <option value="4">비품</option>
		                          </select>
                      			</td>
                      		</tr>
                      	</table>
                      	<br>
                      	<table>
                      		<tr>
                      			<td>자원명: </td>
                      			<td><input type="text" class="form-control" name="resName" style="width: 300px;" placeholder="수정명을 입력해주세요."></td>
                      		</tr>
                      		<tr>
                      			<td>위치: </td>
                      			<td><input type="text" class="form-control gps" name="resGps" style="width: 300px;" placeholder="(위치를 입력해주세요.)"></td>
                      		</tr>
                      		<tr>
                      			<td>수량: </td>
                      			<td><input type="number" class="form-control stock" name="stock" style="width: 300px;" placeholder="(비품일 경우에 입력해주세요.)"></td>
                      		</tr>
                      		<tr>
                      			<td>상세설명: </td>
                      			<td colspan="2"><textarea class="form-control" name="resDetail" rows="3" placeholder="상세설명"></textarea></td>
                      		</tr>
                      	</table>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn bg-danger-subtle text-danger  waves-effect text-start">수정</button>
                        <button type="button" class="btn bg-danger-subtle text-danger  waves-effect text-start" data-bs-dismiss="modal">취소</button>
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
			                  <a class="page-link link" href="${contextPath}/admin/adminResourceList.page?page=${pi.currentPage-1}" aria-label="Previous">
			                    <span aria-hidden="true">
			                      <i class="ti ti-chevrons-left fs-4"></i>
			                    </span>
			                  </a>
			                </li>
			                
			                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				                <li class="page-item">
				                  <a class="page-link link ${pi.currentPage == p ? 'disabled' : ''}" href="${contextPath}/admin/adminResourceList.page?page=${p}">
				                  	${p}
				                  </a>
				                </li>
			                </c:forEach>
			                
			                <li class="page-item ${pi.currentPage==pi.maxPage ? 'disabled' : ''}">
			                  <a class="page-link link" href="${contextPath}/admin/adminResourceList.page?page=${pi.currentPage+1}" aria-label="Next">
			                    <span aria-hidden="true">
			                      <i class="ti ti-chevrons-right fs-4"></i>
			                    </span>
			                  </a>
			                </li>
		                </c:if>
                  </ul>
                </nav>
              </div>

              <script>
              
              	// ready function
              	$(document).ready(function(){
              		$("input[name='stock']").attr("disabled", true);
              	});
              
              	// 자원 수정시 타입 비품 선택시 위치 입력양식 비활성화
              	$(document).on("change", ".selectType", function(){
              		let selectType = $(this).val();
              		
              		if(selectType != "4"){
              			$(".stock").attr("disabled", true);
              			$(".stock").removeAttr("name");
              		}else{
              			$(".stock").removeAttr("disabled");
              			$(".stock").attr("name", "stock");
              		};
              	});
              
              	// 체크박스 체크 현황에 따라 수정,삭제 글자 숨기기
              	$(document).on("change", ".selectResource", function(){
              		if($(".selectResource:checked").length > 0){
              			$("#deleteAndUpdate").css("display", "block");
              		}else{
              			$("#deleteAndUpdate").css("display", "none");
              		};
              	});
              	
              	// 자원수정 함수
              	function updateResource(){
              		let checkedbox = $(".selectResource:checked");
              		let checkedboxCount = checkedbox.length;
              		
              		if(checkedboxCount > 1){
              			alert("자원은 다중수정이 불가능합니다.");
              			return false;
              		}else if(checkedboxCount == 1){
              			
	              		checkedbox.each(function(){
	              			// 체크박스와 동일한 위치의 tr값들을 가져옴
	              			let multiValue = $(this).val();
	              			let row = $(this).closest('tr');
                      let resDetailValue = row.find('.resDetail').val();
                      let resTypeValue = row.find('.resType').text();
                      let resNameValue = row.find('.resName').text();
                      let resGpsValue = row.find('.resGps').text();
                      let stockValue = row.find('.stock').text().trim();
                      
                      let form = $("#updateForm");
                      form.find('select[name="resType"] option').each(function() {
                        if ($(this).text() === resTypeValue) {
                          $(this).prop('selected', true);
                        } else {
                          $(this).prop('selected', false);
                        }
                      });
                      form.find('input[name="resName"]').val(resNameValue);
                      form.find('input[name="resGps"]').val(resGpsValue);
                      form.find('textarea[name="resDetail"]').val(resDetailValue);
                      
                      if(stockValue != '-'){
                      	form.find('input[name="stock"]').val(parseInt(stockValue));
                      	form.find("input[name='stock']").removeAttr("disabled");
                      }
                      
                      
	              			
	              			let inputHidden = "<input type='hidden' name='resNo' value='" + multiValue + "'>";
	              			$("#updateForm").append(inputHidden);
	              			
	              		});

	              		// 모달이 닫혔을 때 append 됐던 name값을 지우는 구문
	              		$('#updateResource').on('hidden.bs.modal', function () {
	              			$('#updateForm').find('input[name="resNo"]').remove();
	                  });
	              		
		              	// 모달 띄우기
		                $('#updateResource').modal('show');
	              		
              		}

              	}
              	
              	// 자원삭제 함수
              	function deleteResource(){
              		let checkedbox = $(".selectResource:checked");
              		let checkedboxCount = checkedbox.length;

              		if(checkedboxCount == 1){
              			$(".oneDelete").css("display", "block");
              			$(".multiDelete").css("display", "none");
              			// 한개일 때 자원명 가져오기
              			let oneName = checkedbox.closest("tr").find(".resName").text();
              			// 가져온 자원명 span요소에 추가
              			$(".deleteName").text(oneName);
              			// 체크박스 밸류값 가져오기
              			let oneValue = checkedbox.val();
              			let inputHidden = "<input type='hidden' name='resNo' value='" + oneValue + "'>";
              			$("#deleteForm").append(inputHidden);
              			
              			$('#deleteResource').on('hidden.bs.modal', function () {
                 		    $('#deleteForm').find('input[name="resNo"]').remove();
                   	});
              			
              		}else{
              			
              			$(".oneDelete").css("display", "none");
              			$(".multiDelete").css("display", "block");
              			// 여러개일 때 갯수 span요소에 추가
              			$(".deleteCount").text(checkedboxCount);
              			// 체크박스 밸류값들 가져온 뒤 인풋타입 히든 만들어서 변수에 담고 삭제form에 어펜드를 반복
              			checkedbox.each(function(){
              				let multiValue = $(this).val();
              				let inputHidden = "<input type='hidden' name='resNo' value='" + multiValue + "'>";
              				$("#deleteForm").append(inputHidden);
              			});
              			
              			$('#deleteResource').on('hidden.bs.modal', function () {
                 		    $('#deleteForm').find('input[name="resNo"]').remove();
                   	});
              			
              		}
              		
              	}
              	
              	// 자원 상세페이지로 이동
              	function resourceDetail(resNo){
              		let contextPath = "<c:out value='${pageContext.request.contextPath}' />";
              		location.href = contextPath+"/admin/resourceDetail.do?resNo=" + resNo;
              	}
              	
              	// 검색 및 필터로 ajax 조회함수 호출용
              	$(document).on("change keyup", ".ajaxSelect, .searchName", function(){
              		resourceFilter(1);
              	});
              	
              	function resourceFilter(page){
              		// 값 찾아서 담기
              		let resType = $(".ajaxSelect option:selected").val();
              		let resName = $(".searchName").val();
										
              		// ajax 호출
              		$.ajax({
              			url:"${contextPath}/admin/ajaxFilterResourceList.do",
              			type:"get",
              			data:"resType=" + resType + "&resName=" + resName + "&page=" + page,
              			success:function(map){
              				console.log(map);
              				$(".tableBody").empty();
              				$(".pagination").empty();
              				let filterTable = "";
              				let filterPage = "";
              				
              				if(map.resourceList.length == 0){
              					filterTable +=	"<tr>"
              											+			"<th colspan='5'>"
              											+				"<h6 class='fs-2 mb-0 resType'>조건에 맞는 자원이 없습니다.</h6>"
              											+			"</th>"
              											+		"</tr>";
              				}else{
              					
	              				for(let i=0; i<map.resourceList.length; i++){
	              					filterTable +=	"<tr onclick='resourceDetail(" + map.resourceList[i].resNo + ");'>"
	              											+			"<th class='selectResourceCheck'>"
	              											+				"<h6 class='fs-2 mb-0'>"
	              											+					"<input type='checkbox' value='" + map.resourceList[i].resNo + "' class='selectResource' onclick='event.stopPropagation();'>"
	              											+					"<input type='hidden' value='" + map.resourceList[i].resDetail + "' class='resDetail'>"
	              											+				"</h6>"
	              											+			"</th>"
	              											+			"<th>"
	              											+				"<h6 class='fs-2 mb-0 resType'>" + map.resourceList[i].resType + "</h6>"
	              											+			"</th>"
	              											+			"<th>"
	              											+				"<h6 class='fs-2 mb-0 resName'>" + map.resourceList[i].resName + "</h6>"
	              											+			"</th>"
	              											+			"<th>"
	              											+				"<h6 class='fs-2 mb-0 resGps'>" + map.resourceList[i].resGps + "</h6>"
	              											+			"</th>"
	              											+			"<th>"
	              											+				"<h6 class='fs-2 mb-0 stock'>";
							             											if(map.resourceList[i].stock == 0){
							             												filterTable += "-";
							             											}else{
							             												filterTable += map.resourceList[i].stock + "개";
							             											}
							            filterTable	+=			"</h6>"
							            						+			"</th>"
							            						+		"</tr>";
							            
	              											
	              				}
	              				
              				}
              				
              				
              				
              				
              				$(".tableBody").append(filterTable);
              				
					            // 페이징처리
											if(map.pi.listCount > map.pi.boardLimit){
												filterPage += "<li class='page-item " + (map.pi.currentPage == 1 ? 'disabled' : '') + "'>"
																		+		"<a class='page-link link' onclick='resourceFilter(" + (map.pi.currentPage-1) + ");' aria-label='Previous'>"
																		+			"<span aria-hidden='true'>"
																		+				"<i class='ti ti-chevrons-left fs-4'></i>"
																		+			"</span>"
																		+		"</a>"
																		+	"</li>";
												
												for (let p=map.pi.startPage; p<=map.pi.endPage; p++) {
													filterPage += "<li class='page-item " + (map.pi.currentPage == p ? 'disabled' : '') + "'>"
								                      +   "<a class='page-link link' onclick='resourceFilter(" + p + ");' >"
								                      +    	p
								                      +   "</a>"
								                      + "</li>";
												}
												
												filterPage += "<li class='page-item " + (map.pi.currentPage == map.pi.maxPage ? 'disabled' : '') + "'>"
								                   +    "<a class='page-link link' onclick='resourceFilter(" + (map.pi.currentPage+1) + ");' aria-label='Next'>"
								                   +       "<span aria-hidden='true'>"
								                   +          "<i class='ti ti-chevrons-right fs-4'></i>"
								                   +        "</span>"
								                   +    "</a>"
								                   + 	"</li>";
								        $(".pagination").append(filterPage);
											}
              			},
              			error:function(){
              				console.log("자원 필터별 ajax 통신 실패");
              			}
              		})
              	}
              </script>
              
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
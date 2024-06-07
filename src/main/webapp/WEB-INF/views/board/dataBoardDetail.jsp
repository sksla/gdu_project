<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료게시판 상세조회</title>
<!-- 리스트 스타일 -->
<style>
    .innerOuter{    
      width:900px;
      margin:auto;
      background:white;
    }

    table *{margin:5px;}
    table{width:100%;}

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
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center my-3">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">자료게시글 상세조회</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">게시판</li>
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/board/dataBoardList.page">자료게시판</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">자료게시글 상세조회</li>
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

              <div class="content">
                <br><br>
                <div class="innerOuter">
                  <h2>자료게시글 상세보기</h2>
                  <br> 
                  <div>
									<a class="btn btn-sm btn-light" style="float:left;" href="#" onclick="clipboard();">url 복사</a>                  
                  <a class="btn btn-secondary" style="float:right" href="${ contextPath }/board/dataBoardList.page">목록으로</a>
                  </div>
                  <br><br>
                  <table id="contentArea" align="center" class="table">
                    <tr>
                      <th width="100">제목</th>
                      <td colspan="3">${ board.boardTitle }</td>
                    </tr>
                    <tr>
                      <th>작성자</th>
                      <td width="300">${ board.memName }</td>
                      <th width="100">작성일</th>
                      <td>${ board.registDate }</td>
                    </tr>
                    <tr>
                      <th>첨부파일</th>
                      <td colspan="3">
                       <c:forEach var="at" items="${ board.attachList }">
                       	 <a href="${ contextPath }${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a> <br>
                    		</c:forEach>
                      </td>
                    </tr>
                    <tr>
                      <th>내용</th>
                      <td colspan="3"></td>
                    </tr>
                    <tr>
                      <td colspan="4">${ board.boardContent }</td>
                    </tr>
                  </table>
                  <br>
        
                  <div align="center">
                  	<c:if test="${not empty loginUser and loginUser.memId == board.memId}">
	                    <form id="frm" action="" method="post" align="center">
												<input type="hidden" name="no" value="${board.boardNo }">
												<!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
				                <button type="submit" class="btn btn-primary" onclick="return frmSubmit(1);">수정하기</button>
				                <button type="submit" class="btn btn-danger" onclick="return frmSubmit(2);" >삭제하기</button>
					            </form>
                    </c:if>
                  </div><br><br>
        					
        					<!--  댓글 영역 -->
                  <table id="replyArea" class="table" align="center">
                    <thead>
                      <tr>
                        <th colspan="2">
                          <textarea class="form-control" name="" id="replyContent" cols="55" rows="2" placeholder="댓글 입력(50자 이내)" style="resize:none; width:100%" maxlength="50"></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="ajaxInsertReply();">등록하기</button></th>
                      </tr>
                      <tr>
                        <td colspan="3">댓글 (<span id="rcount">3</span>) </td> 
                      </tr>
                    </thead>
                    <tbody>
                      
                    </tbody>
                  </table>
                </div>
                <br><br>
              </div>
              
            </div>
            
            <script>
            	$(document).ready(function(){
            		ajaxReplyList();
            		
            		// 댓글 삭제 버튼에 클릭이벤트 걸기
            		$(document).on("click", ".removeReply", function(){
            			
            			if(confirm("해당 댓글을 삭제하시겠습니까?")){
            				
            				// 댓글삭제용 ajax
	            			$.ajax({
	            				url:"${contextPath}/board/removeReply.do",
	            				type:"get",
	            				data:"no=" + $(this).data("replyno"),
	            				success:function(rep){
	            					if(rep == "SUCCESS"){
	            						alert("댓글이 성공적으로 삭제되었습니다.");
	            						ajaxReplyList();
	            					}
	            				}
	            				
	            			})
            			}
            			
            		})
            		
            		// 댓글 수정 버튼에 클릭이벤트 걸기
            		$(document).on("click", ".modifyReply", function(){
            			
            			let replyNo = $(this).data("replyno");
            			let replyContentTd = $(this).closest("tr").find("td:nth-child(2)");
            			let replyButtonsTd = $(this).closest("tr").find("td:nth-child(3)");
            			let originalContent = replyContentTd.text().trim();
            			
            			replyContentTd.html(`
		        				<textarea class="form-control editReplyContent" max-length="50" cols="40" rows="2" placeholder="댓글 입력(50자 이내)" style="resize:none; height: 100%;">${originalContent}</textarea>
		                
		        			`);
            			
            			replyButtonsTd.html(`
            				<div>	
           					<button class="btn btn-sm btn-success saveReply mx-2" style="height: 45%;">저장</button>
 		                <button class="btn btn-sm btn-secondary cancelReply" style="height: 45%;">취소</button>
 		                </div>
         					`);

			            replyContentTd.find(".editReplyContent").val(originalContent);
			            replyButtonsTd.find(".saveReply").data("replyno", replyNo);
            			
            		})// 끝
            		
            		// 댓글 수정 저장
            		$(document).on("click", ".saveReply", function(){
            			let replyNo = $(this).data("replyno");
            			let newContent = $(this).closest("tr").find(".editReplyContent").val().trim();
            		
	            		if(newContent.length == 0){
	            			alert("내용을 입력해주세요.");
	            			return;
	            		}
									
	            		$.ajax({
	            			url:"${contextPath}/board/modifyReply.do",
	            			type:"post",
	            			data:{
	            				replyNo:replyNo,
	            				replyContent:newContent
	            			},
	            			success:function(rep){
	            				if(rep == "SUCCESS"){
	            					ajaxReplyList();
	            				}else{
	            					alert("댓글 수정에 실패했습니다. 잠시후 다시 시도해주세요");
	            				}
	            			},
	            			error:function(){
	            				console.log("댓글 수정용 ajax 통신 실패");
	            			}
	            			
	            		});
            		
            		}) // 댓글수정 저장 끝
            		
            		// 댓글 수정 취소
         		    $(document).on("click", ".cancelReply", function(){
        		    	ajaxReplyList();
         		    })
            		
            		
            	})
            	
            	// 글 수정,삭제버튼에 요청하는 url 각각 다르게 주는 function
            	function frmSubmit(num){
            		$("#frm").attr("action", num==1 ? "${contextPath}/board/dataModifyForm.do"
            																		: "${contextPath}/board/dataDelete.do");
            		
            		if(num == 2 && !confirm("해당 게시글을 삭제하시겠습니까?")){
            			return false;
            		}
            		
            	}
            	
            	// 댓글 리스트 ajax조회 후 화면에 뿌리는 function
            	function ajaxReplyList(){
            		$.ajax({
            			url:"${contextPath}/board/replyList.do",
            			type:"get",
            			data:"boardNo=${board.boardNo}",
            			success:function(rep){
            				
            				$("#rcount").text(rep.length);
            				
            				let tbody = "";
            				
            				if(rep.length > 0){
            					
	            				for(let i=0; i<rep.length; i++){
	            					tbody += "<tr height='100'>"
	          				          +   "<th width='150' style='height: 100px;'>" + rep[i].memName + "</th>"
	          				          +   "<td style='height: 100px;'><p style='white-space:pre-wrap;'>" + rep[i].replyContent + "</p></td>"
	          				          +   "<td style='height: 100px;' class='d-flex-column justify-content-end'>" + rep[i].registDate;
	
	          				    // 현재 로그인한 회원이 해당 댓글의 작성자인 경우
	          				    if (rep[i].writerMem == '${loginUser.memId}') {
	          				        tbody += "<div><button style='height: 45%;' class='btn btn-sm btn-primary modifyReply mx-2' data-replyno='" + rep[i].replyNo + "'>수정</button>"
	          				              + "<button style='height: 45%;' class='btn btn-sm btn-danger removeReply' data-replyno='" + rep[i].replyNo + "'>삭제</button></div>";
	          				    }
	
	          				    tbody += "</td>"
	          				          + "</tr>";
	            				}
            					
            				}else{
            					tbody += "<tr height='100'><td colspan='3' style='height: 100px;'>등록된 댓글이 없습니다.</td></tr>"
            				}
            				
            				$("#replyArea tbody").html(tbody);
            				
            			},
            			error:function(){
            				console.log("댓글 조회용 ajax 통신실패");
            			}
            			
            		})
            	}
            	
            	// 댓글 등록 ajax
            	function ajaxInsertReply(){
            		
            		if($("#replyContent").val().trim().length != 0){
            			// 글자 1자이상 입력시
            			
            			$.ajax({
            				url:"${contextPath}/board/registReply.do",
            				type:"post",
            				data:{
            					replyContent:$("#replyContent").val(),
            					boardNo:${board.boardNo}
            				},
            				success:function(result){
            					if(result == "SUCCESS"){
            						$("#replyContent").val("");
            						ajaxReplyList();
            					}else if(result == "FAIL"){
            						alert("다시 입력해주세요.");
            					}
            				},
            				error:function(){
            					console.log("댓글 작성용 ajax 통신 실패");
            				}
            				
            				
            			})
            			
            		}else{
            			alert("댓글 내용을 입력해주세요.");
            		}
            	}
            
            	// 게시글 url 복사
            	function clipboard(){
            		let url = '';
            		const textarea = document.createElement("textarea");
            		document.body.appendChild(textarea);
            		url = window.document.location.href;
            		textarea.value = url;
            		textarea.select();
            		document.execCommand("copy");
            		document.body.removeChild(textarea);
            		alert("URL이 복사되었습니다.");
            	
            	}
            	
						</script>
          </div>

          


        </div>
      </div>
	    <!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의게시판</title>
<!-- 상세 스타일 -->
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
        <!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">게시글 상세</h4>
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
              </div>
            </div>
          </div>

          <!-- 페이지 내용 -->
          <div class="card">
            <div class="card-body">

              <div class="content">
                <br><br>
                <div class="innerOuter">
                  <h2>게시글 상세보기</h2>
                  <br> 
                  <!-- 로그인후 상태일 경우만 보여지는 글쓰기 버튼-->
                  <a class="btn btn-secondary" style="float:right" href="${ contextPath }/board/proposalList.do">목록으로</a>
                  <br><br>
                  <table id="contentArea" align="center" class="table">
                    <tr>
                      <th width="100">제목</th>
                      <td colspan="3">${ board.boardTitle }</td>
                    </tr>
                    <tr>
                      <th>작성자</th>
                      <td width="300">${ board.memId }</td>
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
                    <tr height="150">
                      <th> 내용</th>
                      <td colspan="3">${ board.boardContent }</td>
                    </tr>
                  </table>
                  <br>
        
                  <div align="center">
	                  <c:if test="${loginUser.memId == board.memId}">               
					            <form id="frm" action="" method="post" align="center">
														<input type="hidden" name="no" value="${board.boardNo }">
														<!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
						                <button  type="submit" class="btn btn-primary" onclick="frmSubmit(1);">수정하기</button>
						                <button type="submit" class="btn btn-danger" onclick="frmSubmit(2);" >삭제하기</button>
					            </form><br><br>
					            <script>
					            	function frmSubmit(num){
					            		$("#frm").attr("action", num==1 ? "${contextPath}/board/modifyForm.page"
					            																		: "${contextPath}/board/remove.do");	
					            	}
											</script>
					          </c:if>
                  </div>
                  
                  
                  
                  
        
                  <!-- 답변 부분 -->
                  <table id="replyArea" class="table" align="center">
                    <thead>
                      <tr>
                        <td colspan="3">답변 (<span id="rcount">3</span>) </td> 
                      </tr>
                    <c:if test="${loginUser.jobNo == '행정관리'}">     
                      <tr>
                        <th colspan="2">
                          <textarea class="form-control" name="" id="replyContent" cols="55" rows="2" style="resize:none; width:100%" placeholder="답변내용을 입력하세요."></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="ajaxInsertReply();">등록하기</button></th>
                      </tr>
                    </c:if>
                    </thead>
                    <tbody >
                      
                    </tbody>
                  </table>
                </div>
                <br><br>
              </div>
              
            </div>
          </div>
          
          <script>
          $(document).ready(function(){
      		ajaxReplyList();
      		
      		// 동적으로 만들어진 요소에 이벤트 걸때 => 이벤트 메소드방식 안됨
      		//$(".removeReply").click(function(){
      		//$(".removeReply").on("click", function(){
      		$(document).on("click", ".removeReply", function(){
      			
      			
      			// 해당 댓글 삭제용 ajax 요청
							$.ajax({
								url:"${contextPath}/board/removeReply.do",
								type:"get",
								data:"no=" +  $(this).data("replyno"),
								success:function(result){
									if(result == "SUCCESS"){
										alert("삭제되었습니다.");
										ajaxReplyList();
									}
								}
							})
							
     			})
     			
     			// 댓글 수정
				    $(document).on("click", ".modifyReply", function() {
				        let replyNo = $(this).data("replyno");
				        let replyContentTd = $(this).closest("tr").find("td:nth-child(2)");
				        let originalContent = replyContentTd.text().trim();
				
				        replyContentTd.html(`
				        				<textarea class="form-control editReplyContent" style="height: 100px;">${originalContent}</textarea>
				                <button class="btn btn-sm btn-success saveReply">저장</button>
				                <button class="btn btn-sm btn-secondary cancelReply">취소</button>
				        `);

		            replyContentTd.find(".editReplyContent").val(originalContent);
		            replyContentTd.find(".saveReply").data("replyno", replyNo);
				    });
				
				    // 댓글 수정 저장
				    $(document).on("click", ".saveReply", function() {
				        let replyNo = $(this).data("replyno");
				        let newContent = $(this).siblings(".editReplyContent").val().trim();
				
				        if (newContent.length == 0) {
				            alert("내용을 입력해주세요.");
				            return;
				        }
				
				        $.ajax({
				            url: "${contextPath}/board/modifyReply.do",
				            type: "post",
				            data: {
				                replyNo: replyNo,
				                replyContent: newContent
				            },
				            success: function(result) {
				                if (result == "SUCCESS") {
				                    ajaxReplyList();
				                } else {
				                    alert("수정 실패. 다시 시도해주세요.");
				                }
				            },
				            error: function() {
				                console.log("댓글 수정용 ajax 통신 실패");
				            }
				        });
				    });


     		    // 댓글 수정 취소
     		    $(document).on("click", ".cancelReply", function(){
     		        ajaxReplyList();
     		    })
     			
     			
      	})
          
         
          
	       // 답변 ajax로 작성 요청하는 function
	      	function ajaxInsertReply(){
	      		
	      		if($("#replyContent").val().trim().length != 0){
	      			
	      			$.ajax({
	      				url:"${contextPath}/board/registReply.do",
	      				type:"post",
	      				data: {
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
	      				},error:function(){
	      					console.log("댓글 작성용 ajax 통신 실패");
	      				}
	      			})
	      			
	      		}else{
	      			alert("내용을 입력해주세요.");
	      		}
	      	}
      		
	     // 현재 게시글의 댓글 리스트를 ajax로 조회해서 뿌리는 function
        	function ajaxReplyList(){
        		// 비동기식으로 "/board/replyList.do" url요청
        		// 요청처리 결과로 조회된 댓글리스트를 응답데이터로 받기
        		// 해당 응답데이터 가지고 댓글 한개당 하나의 tr요소로 만들어서
        		// tbody 영역에 뿌리기
        		// + 댓글 갯수도 수정
        		
        		$.ajax({
        			url:"${contextPath}/board/replyList.do",
        			type:"get",
        			data:"boardNo=${board.boardNo}",
        			success:function(result){
	        			
        				console.log(result); // [{}, {}, {}]
        				
        					$("#rcount").text(result.length);
        				
        				let tbody = "";
	    					
        				for (let i = 0; i < result.length; i++) {
        				    tbody += "<tr height='100'>"
        				          +   "<th width='150' style='height: 100px;'>" + result[i].writerMem + "</th>"
        				          +   "<td style='height: 100px;'>" + result[i].replyContent + "</td>"
        				          +   "<td style='height: 100px;' class='d-flex justify-content-end'>" + result[i].registDate;

        				    // 현재 로그인한 회원이 해당 댓글의 작성자인 경우
        				    if (result[i].writerMem == '${loginUser.memId}') {
        				        tbody += "<button style='height: 45%;' class='btn btn-sm btn-primary modifyReply mx-2' data-replyno='" + result[i].replyNo + "'>수정</button>"
        				              + "<button style='height: 45%;' class='btn btn-sm btn-danger removeReply' data-replyno='" + result[i].replyNo + "'>삭제</button>";
        				    }

        				    tbody += "</td>"
        				          + "</tr>";
        				}
	    								
	    					$("#replyArea tbody").html(tbody);
	    					
								
							},error:function(){
								console.log("댓글조회용 ajax 통신 실패");
							}
        		})
		        		
        		
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
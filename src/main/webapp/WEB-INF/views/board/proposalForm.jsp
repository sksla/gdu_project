<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의게시판</title>

<!-- cs editor 관련 css파일 연동 -->
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/toolbarconfigurator/lib/codemirror/neo.css">
<link rel="stylesheet" href="${contextPath}/assets/libs/ckeditor/samples/css/samples.css">

<!-- 상세 스타일 -->
<style>
    
    .innerOuter{    
      width:900px;
      margin:auto;
      background:white;
    }

    table *{margin:5px;}
    table{width:100%;}
    
    #passwordInput {
        display: none;
    }

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
                  <h4 class="fw-semibold mb-8">게시글 등록</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }"
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
                <div class="innerOuter">
                  <h2>게시글 작성하기</h2>
                  <br>
                  <form id="enrollForm" action="${ contextPath }/board/proposalRegist.do" method="post" enctype="multipart/form-data">
                    <table align="center">
                      <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                      </tr>
                      <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${loginUser.memId }" name="memId" readonly>
                        		<input type="hidden" id="memNo" class="form-control" value="${loginUser.memNo }" name="memNo" readonly>
                        </td>
                      </tr>
                      <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFiles" multiple></td>
                      </tr>
                      <tr>
                      	<th><label for="secret">비밀글</label>
                      	<td>
                      		<input class="form-check-input primary check-light-primary" type="checkbox" id="primary-light-check" name="openStatusCheckbox" value="1">
                      		<input type="hidden" name="openStatus" value="1"> <!-- 선택되지 않은 경우를 위한 hidden input 추가 -->
                      		<label class="form-check-label" for="primary-light-check">비밀글</label>
                      		<div id="passwordInput">
											        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password (4자리)" maxlength="4">
											    </div>
                      	</td>
                      </tr>
                      <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                      </tr>
                      <tr>
                        <th colspan="2">
                        <!--<textarea class="form-control" required name="boardContent" id="content" rows="10" style="resize:none;"></textarea> -->
                        <textarea cols="80" id="testedit" name="boardContent" rows="10" data-sample="1" data-sample-short required>
		                    	내용을 작성하세요.
		                  	</textarea>
			                  <div style="display:none;">
				                  <textarea cols="80" id="editor1" disabled>
												</textarea>
												</div>
                        </th>
                      </tr>
                    </table>
                    <br>
        
                    <div align="center">
                      <button type="submit" class="btn btn-primary">등록하기</button>
                      <button type="reset" class="btn btn-danger">취소하기</button>
                    </div>
                  </form>
                </div>
                <br><br>
              </div> 
            </div>
          </div>
          
          <!-- 비밀글 비밀번호 부분 -->
          <script>
			        document.getElementById('primary-light-check').addEventListener('change', function() {
			            var passwordInputDiv = document.getElementById('passwordInput');
			            if (this.checked) {
			                passwordInputDiv.style.display = 'block';
			            } else {
			                passwordInputDiv.style.display = 'none';
			            }
			        });
			    </script>
			    
			    <!-- 체크박스 체크값 변경 부분 -->
			    <script>
			    document.addEventListener('DOMContentLoaded', (event) => {
			        const checkbox = document.getElementById('primary-light-check');
			        checkbox.addEventListener('change', function() {
			            if (this.checked) {
			            	document.querySelector('input[name="openStatus"]').value = '2'; // hidden input의 값 변경
			            } else {
			            	document.querySelector('input[name="openStatus"]').value = '1'; // hidden input의 값 변경
			            }
			        });
			    });
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
	
	<!-- ck editor 연동 스크립트 -->
  <script src="${ contextPath }/assets/libs/ckeditor/ckeditor.js" type="text/javascript"></script>
  <script src="${ contextPath }/assets/libs/ckeditor/samples/js/sample.js" type="text/javascript"></script>
  <script src="${ contextPath }/assets/js/plugins/ckeditor-init.js" type="text/javascript"></script>
</body>
</html>
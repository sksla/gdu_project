<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 개별등록</title>
<style>
  .memberLeave{
    display: flex;
  }
  .one, .two{cursor: pointer;}
  .split{
    margin-left: 10px;
    margin-right: 10px;
  }
  .split, .two{
    color: rgb(185, 181, 181);
  }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음 주소 api -->
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
                  <h4 class="fw-semibold mb-8">직원개별등록</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }/member/mainpage">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">인사</li>
                      <li class="breadcrumb-item" aria-current="page">직원등록</li>
                      <li class="breadcrumb-item" aria-current="page">직원개별등록</li>
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

              <div class="memberLeave">
                <h2 class="one" onclick="location.href='${contextPath}/admin/insertOneMemberEnrollForm.do'">직원개별등록</h2>
                <h2 class="split">|</h2>
                <h2 class="two" onclick="location.href='${contextPath}/admin/insertManyMember.page'">직원일괄등록</h2>
              </div>

              <br><br><br>
              <form action="${contextPath}/admin/insertOneMember.do" method="post">
                <!-- 비번1111, 연차12개 인풋타입히든-->
                <div class="row">
                  <div class="col-lg-6 mb-4 mb-lg-0">
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">이름</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" name="memName" id="example-search-input" placeholder="이름을 입력해주세요" required/>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputText17" class="form-label fw-semibold col-sm-3 col-form-label">아이디</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" name="memId" id="example-text-input" placeholder="아이디를 입력해주세요" required/>
                    </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">학과</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <select class="form-select mb-n2" name="majorNo" style="width: 130px;">
                            <c:forEach var="m" items="${majorList}">
                            	<option value="${m.majorNo}">${m.majorName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">직급</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <select class="form-select mb-n2" name="jobNo" style="width: 130px;">
                            <c:forEach var="j" items="${jobList}">
                            	<option value="${j.jobNo}">${j.jobName}</option>
                            </c:forEach>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">전화번호</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="tel" name="phone" id="example-tel-input" placeholder="010-xxxx-xxxx" required/>
                      </div>
                    </div>
                  </div>

                  <div class="col-lg-6">
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" name="email" id="example-email-input" value="@gdu.com" placeholder="아이디@gdu.com" required/>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <input class="form-control" type="text" id="example-search-input" onclick="execPostCode();" name="address" placeholder="클릭해서 주소를 선택해주세요" required/>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">상세주소</label>
                      <div class="col-sm-9">
                        <div class="input-group">
                          <input class="form-control" type="text" id="example-search-input" name="addressDetail" placeholder="상세주소 입력 (필수x)"/>
                        </div>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">급여</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="" id="example-email-input" name="salary" placeholder="숫자만 입력" required/>
                      </div>
                    </div>
                    <div class="mb-4 row align-items-center">
                      <label for="exampleInputSelect4" class="form-label fw-semibold col-sm-3 col-form-label">주민등록번호</label>
                      <div class="col-sm-9">
                        <input class="form-control" type="text" value="" id="example-email-input" name="resident" placeholder="-포함 입력" required/>
                      </div>
                    </div>
                  </div>
                </div>

								<script>
								
			        	/* 우편번호 찾기 api부분 */
			            function execPostCode() {
			                new daum.Postcode({
			                    oncomplete: function(data) {
			                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			        
			                       // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
			                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                       var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
			                       var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			        
			                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                           extraRoadAddr += data.bname;
			                       }
			                       // 건물명이 있고, 공동주택일 경우 추가한다.
			                       if(data.buildingName !== '' && data.apartment === 'Y'){
			                          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                       }
			                       // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                       if(extraRoadAddr !== ''){
			                           extraRoadAddr = ' (' + extraRoadAddr + ')';
			                       }
			                       // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			                       if(fullRoadAddr !== ''){
			                           fullRoadAddr += extraRoadAddr;
			                       }
			        
			                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                       console.log(data.zonecode);
			                       console.log(fullRoadAddr);
			                       
			                       
			                       $("[name=addr1]").val(data.zonecode);
			                       $("[name=address]").val(fullRoadAddr);
			                       
			                       /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
			                       document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
			                       document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
			                   }
			                }).open();
			                
			               
			            }
			            /* 우편번호 찾기 부분 끝 */
			            
								</script>

                <br><br>

                <div align="center">
                  <button type="submit" class="btn btn-secondary">등록하기</button>
                </div>

              </form>

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
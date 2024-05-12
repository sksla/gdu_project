<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 조직도 css */
    * {margin: 0; padding: 0;}
    .tree ul {
        padding-top: 20px; position: relative;
        
        transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    .tree li {
        float: left; text-align: center;
        list-style-type: none;
        position: relative;
        padding: 20px 5px 0 5px;
        
        transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }
    .tree li::before, .tree li::after{
        content: '';
        position: absolute; top: 0; right: 50%;
        border-top: 1px solid #ccc;
        width: 50%; height: 20px;
    }
    .tree li::after{
        right: auto; left: 50%;
        border-left: 1px solid #ccc;
    }
    .tree li:only-child::after, .tree li:only-child::before {
        display: none;
    }
    .tree li:only-child{ padding-top: 0;}
    .tree li:first-child::before, .tree li:last-child::after{
        border: 0 none;
    }
    .tree li:last-child::before{
        border-right: 1px solid #ccc;
        border-radius: 0 5px 0 0;
        -webkit-border-radius: 0 5px 0 0;
        -moz-border-radius: 0 5px 0 0;
    }
    .tree li:first-child::after{
        border-radius: 5px 0 0 0;
        -webkit-border-radius: 5px 0 0 0;
        -moz-border-radius: 5px 0 0 0;
    }
    .tree ul ul::before{
        content: '';
        position: absolute; top: 0; left: 50%;
        border-left: 1px solid #ccc;
        width: 0; height: 20px;
    }
    .tree li a{
        border: 1px solid #ccc;
        padding: 25px 35px; /*텍스트 주변 여백조정*/
        text-decoration: none;
        color: #666;
        font-family: arial, verdana, tahoma;
        font-size: 20px; /* 글자크기 */
        display: inline-block;
        
        border-radius: 5px;
        -webkit-border-radius: 5px;
        -moz-border-radius: 5px;
        
        transition: all 0.5s;
        -webkit-transition: all 0.5s;
        -moz-transition: all 0.5s;
    }

    /* ******************내가 추가한****************** css*/
    .major:hover {
        background: #c8e4f8; /* 마우스를 올린 학과명의 배경색 변경 */
        color: #000; /* 마우스를 올린 학과명의 글자색 변경 */
        border: 1px solid #94a0b4; /* 마우스를 올린 학과명의 테두리 변경 */
    }
    #admin{
        font-weight: bold;
        font-size: 15px;
        text-align: center; /* 글자 가로세로 기준 한가운데로(없어도 됨) */
        color: black;
    }
    .college{
        font-weight: bold;
        background: skyblue;
    }
    #admin, .college{ 
        cursor: default; /* 마우스커서가 포인터로 안변하게 */
    }
    #content_1{
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    /* 각 요소 사이의 간격을 조정. */
    .text, .searchBtn {
        margin: 5px;
    }
    #searchForm {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
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
    .btn{
      --bs-btn-padding-x:55px;
      font-size: 16px;
    }
    .btn-gruop{
      margin-left: 450px;
    }
    #btnGroupVerticalDrop1{
      margin-right: 15px;
    }
    .btn-college{
      --bs-btn-padding-x: 30px;
    }
    .nameSpan{
      font-size: 18px;
    }
    .createdCollege{
      display: flex;
    }
    .updateMajor{
      display: flex;
    }
    .majorUser>tbody{
      cursor: pointer;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

      <div class="body-wrapper">
        <div class="container-fluid">
          <!-- 페이지 타이틀 -->
          <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
            <div class="card-body px-4 py-3">
              <div class="row align-items-center">
                <div class="col-9">
                  <h4 class="fw-semibold mb-8">조직도</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="../main/index.html">Home</a>
                      </li>
                      <!-- <li class="breadcrumb-item" aria-current="page">출석</li> -->
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
		    
		    <script>
		
		        $(document).ready(function(){
		        	
					    console.log(${majorList.size()});
			      
			        	for(var i=0; i<${majorList.size()}; i++){
				        	//console.log("음");
									//console.log(${majorList.get(i).majorName})
									//${majorList.get(1).colNo}
									var aTag = document.createElement("a");
									aTag.textContent = "${majorList.get(i).majorName}";
									aTag.href = "#";
									aTag.classList.add("major");
									aTag.classList.add(${majorList.get(i).colNo});
									
									var laTag = document.createElement("li");
									laTag.appendChild(aTag);
									
									var ulTag = document.createElement("ul");
									ulTag.appendChild(laTag);
									
									var college1Li = document.getElementById("college1");
									college1Li.appendChild(ulTag);

			        }
			       
									/*	
                	<ul>
                    <li>
                      <a href="#" class="major">학과명</a>
                    </li>
                  </ul> 
			        		*/
		
			        // 학과테이블 보여지는 펑션
			        // 테이블 숨길지말지 추후수정 -----------------------
			        var isHidden = true;
			
			        $("#major").hide();
			        $("#search").hide();
			
			        $(".major").on("click", function(){
			        if (isHidden) {
			            $("#major").show();
			            $("#search").show();
			            isHidden = false;
			        } else {
			            $("#major").hide();
			            $("#search").hide();
			            isHidden = true;
			        }
			        });
			        //-------------------------------------------------
			        

		        });
		    </script>
		    
		    
		    <c:forEach var="i" items="${majorList}">
		    	${i.majorName}
		    </c:forEach>
		    				${majorList.get(0).majorName}
		    				${majorList.get(1).majorName}
								${majorList.get(1).colNo}
                <div id="content_1">
                    <div class="tree originTree">
                      <ul class="oneUl">
                        <li class="oneLi">
                          <a href="#" id="admin" class="fs-8 gdu">GDU</a>
                          <ul class="twoUl">
                          <!-- 동적으로 조직도 생성범위 -->
                            <li id="college1">
                              <a href="#" class="college college1">${colList[0].colName}</a>
<!--                               <ul>
                                <li>
                                  <a href="#" class="major">학과명</a>
                                  <ul>
                                    <li>
                                      <a href="#" class="major">학과명</a>
                                      <ul>
                                        <li>
                                          <a href="#" class="major">학과명</a>
                                        </li>
                                      </ul>
                                    </li>
                                  </ul>
                                </li>
                              </ul> -->
                            </li>
                            <li id="college2">
                              <a href="#" class="college college2">${colList[1].colName}</a>
                              <ul>
                                <li>
                                  <a href="#" class="major">학과명</a>
                                  <ul>
                                    <li>
                                      <a href="#" class="major">학과명</a>
                                      <ul>
                                        <li>
                                          <a href="#" class="major">학과명</a>
                                        </li>
                                      </ul>
                                    </li>
                                  </ul>
                                </li>
                              </ul>
                            </li>
                            <li id="college3">
                              <a href="#" class="college college3">${colList[2].colName}</a>
                              <ul>
                                <li>
                                  <a href="#" class="major">학과명</a>
                                  <ul>
                                    <li>
                                      <a href="#" class="major">학과명</a>
                                      <ul>
                                        <li>
                                          <a href="#" class="major">학과명</a>
                                        </li>
                                      </ul>
                                    </li>
                                  </ul>
                                </li>
                              </ul>
                            </li>
                          <!-- 동적으로 조직도 생성범위 -->
                          </ul>
                        </li>
                      </ul>
                    </div> 
                    <br><br><br><br>
    
                    <div id="major">
                      <!--학과 펼쳐질 영역-->
                      <!-- ajax 통해 동적스크립트로 처리 예정-->
                      <p class="fs-7 fw-semibold">XX과</p>
                      <div class="table-responsive mb-4">
                        <table class="table border text-nowrap mb-0 align-middle majorUser">
                          <thead class="text-dark fs-4">
                            <tr align="center">
                              <th>
                                <h6 class="fs-4 fw-semibold mb-0">이름</h6>
                              </th>
                              <th>
                                <h6 class="fs-4 fw-semibold mb-0">사번</h6>
                              </th>
                              <th>
                                <h6 class="fs-4 fw-semibold mb-0">직급</h6>
                              </th>
                              <th>
                                <h6 class="fs-4 fw-semibold mb-0">연락처</h6>
                              </th>
                              <th>
                                <h6 class="fs-4 fw-semibold mb-0">이메일</h6>
                              </th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>
                                <div class="d-flex align-items-center">
                                  <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                                  <div class="ms-3">
                                    <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">15-76096582</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">대리</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div class="d-flex align-items-center">
                                  <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                                  <div class="ms-3">
                                    <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">15-76096582</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">대리</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div class="d-flex align-items-center">
                                  <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                                  <div class="ms-3">
                                    <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">15-76096582</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">대리</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div class="d-flex align-items-center">
                                  <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                                  <div class="ms-3">
                                    <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">15-76096582</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">대리</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <div class="d-flex align-items-center">
                                  <img src="../assets/images/profile/user-2.jpg" class="rounded-circle" width="40" height="40">
                                  <div class="ms-3">
                                    <h6 class="fs-4 fw-semibold mb-0">홍길동</h6>
                                  </div>
                                </div>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">15-76096582</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">대리</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">010-1111-2222</p>
                              </td>
                              <td>
                                <p class="mb-0 fw-normal fs-4">gduAcademy@gdu.com</p>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                    <br><br>
    
                    <div id="search">
                      <nav aria-label="Page navigation example">
                        <ul class="pagination">
                          <li class="page-item">
                            <a class="page-link link" href="#" aria-label="Previous">
                              <span aria-hidden="true">
                                <i class="ti ti-chevrons-left fs-4"></i>
                              </span>
                            </a>
                          </li>
                          <li class="page-item">
                            <a class="page-link link" href="#">1</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link link" href="#">2</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link link" href="#">3</a>
                          </li>
                          <li class="page-item">
                            <a class="page-link link" href="#" aria-label="Next">
                              <span aria-hidden="true">
                                <i class="ti ti-chevrons-right fs-4"></i>
                              </span>
                            </a>
                          </li>
                        </ul>
                      </nav>

                      <form id="searchForm" action="" method="Get" align="center">
                          <input id="searchName" type="text" class="form-control" name="" placeholder="이름으로 검색">
                          <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                      </form>
                    </div>
                  </div>

            </div>
          </div>

        </div>
      </div>
  <jsp:include page="/WEB-INF/views/common/settingbar.jsp" />
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
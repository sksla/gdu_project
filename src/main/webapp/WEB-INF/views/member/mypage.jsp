<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<!-- 마이페이지 스타일 -------------------------------------------------->
    <style>
      /* Add any necessary CSS styles here */
      #canvasModal {
          display: none;
          position: fixed;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background-color: rgba(0, 0, 0, 0.5);
          z-index: 9999;
      }
  
      #canvasContainer {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          background-color: #fff;
          padding: 20px;
          width: 440px;
      }
  
      #canvas {
          border: 1px solid #ccc;
      }
  </style>

</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/memberSidebar.jsp"/>
    
    <div class="page-wrapper">
    
    	<!-- 이쪽에 헤더(상단바) -->
	    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    	
	    <!----------------------------- 본문 시작 -------------------->
	    <div class="body-wrapper">
        <div class="container-fluid">
        <!-- ----------------------------- 실제 내용 작성 영역 ----------------------------- -->
          <!--  Row 1  프로필이미지 부분-->
            <div>
                <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center  pb-2">
                        <div align="center" class="">
                          <img
                            src="../assets/images/profile/user-2.jpg"
                            class="shadow-warning rounded-2"
                            alt=""
                            width="72"
                            height="72"
                          />
                        </div>
                        
                        <button class="btn bg-primary-subtle text-primary w-10 mt-3" onclick="$('#profileImgFile').click();"> 프로필 변경 </button>
                        <input type="file" id="profileImgFile" style="display:none;" >
                        <div>
                          
                        </div>
                      </div>
                      
                    </div>

                     

                

              <div class="card">
                <div class="card-body">
                  <h5>마이페이지</h5>
                  <p class="card-subtitle mb-3">
                    All bootstrap element classies
                  </p>
                  <form class="form">

                    <!-- start Default Basic Forms -->
                    <div class="card-body">
                        <div class="tab-content" id="pills-tabContent">
                          <div class="tab-pane fade show active" id="pills-personal-info" role="tabpanel"
                            aria-labelledby="pills-personal-info-tab" tabindex="0">
                            <div class="row">
                              <div class="col-lg-6 mb-4 mb-lg-0">
                                <div class="mb-4 row align-items-center">
                                  <label for="exampleInputText17" class="form-label fw-semibold col-sm-3 col-form-label">사번</label>
                                  <div class="col-sm-9">
                                    <input class="form-control" type="text" value="${ loginUser.memNo }" id="example-text-input" disabled/>
                                </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                  <label for="exampleInputSelect4"
                                    class="form-label fw-semibold col-sm-3 col-form-label">이름</label>
                                  <div class="col-sm-9">
                                    <input class="form-control" type="text" value="${ loginUser.memName }"
                                      id="example-search-input" />
                                  </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                  <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">학과</label>
                                  <div class="col-sm-9">
                                    <div class="input-group">
                                        <input class="form-control" type="text" value="${ loginUser.majorNo }"
                                        id="example-search-input" />
                                    </div>
                                  </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">직급</label>
                                    <div class="col-sm-9">
                                      <div class="input-group">
                                        <input class="form-control" type="text" value="${ loginUser.jobNo }"
                                        id="example-search-input" />
                                      </div>
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">아이디</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" value="${ loginUser.memId }"
                                        id="example-email-input" disabled />
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">전화번호</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="tel" value="${ loginUser.phone }"
                                            id="example-tel-input" />
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">이메일</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="email" class="form-control" value="${ loginUser.email }" />
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">주소</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" value="${ loginUser.address }"
                                             id="example-address-input" />
                                    </div>
                                </div>
                                
                                
                              </div>

                              <div class="col-lg-6">
                                <div class="mb-4 row align-items-center">
                                  <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">생년월일
                                    </label>
                                  <div class="col-sm-9">
                                    <input type="text" class="form-control" value="${ loginUser.birth }">
                                 </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">입사일
                                      </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" value="${ loginUser.hireDate }" disabled>
                                    </div>
                                </div>
                                <!-- 퇴사일 null아닐경우에만 보여지게 조건처리  -->
                                <!--
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">퇴사일
                                      </label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="date" value="${ loginUser.endDate }" id="example-date-input" />
                                    </div>
                                </div>
                                -->

                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">서명이미지
                                      </label>
                                    <div class="col-sm-9">
                                        <img
                                            src="../assets/images/profile/user-2.jpg"
                                            class="shadow-warning rounded-2"
                                            alt=""
                                            width="72"
                                            height="72"
                                        />
                                        <input class="form-control form-control-sm" id="formFileSm" type="file">
                                        <button type="button" class="btn btn-success rounded-pill px-4" data-bs-toggle="modal" data-bs-target="#canvasModal">
                                            서명만들기  
                                        </button>
                                    </div>
                                    <!-- 캔버스 모달 ------------>
                                    <div class="mb-3 row" id="canvasModal">
                                        <div class="col-md-10" id="canvasContainer">
                                           <canvas id="canvas" width="400" height="200"></canvas>
                                           <div class="d-flex justify-content-center ">
                                             <button type="button" class="btn btn-success  px-4" id="saveButton">저장</button>
                                             <button type="button" class="btn btn-success  px-4" id="erase">지우기</button>
                                             <button  class="btn btn-success  px-4" id="closeButton">닫기</button>
                                           </div>
                                        </div>
                                     </div>
																		<!-- 캔버스모달 끝 -------- -->
                                </div>

                              </div>
                            </div>
                          </div>
                          
                          
                        </div>
                      </div>
                
                  <div class="mb-3 row">
                    
                    <div class="form-actions text-end">
                        <div class="card-body border-top">
                          <button type="button" class="btn btn-success  px-4" data-bs-toggle="modal" data-bs-target="#changepass-modal">
                            비밀번호변경
                          </button>
                          <button type="submit" class="btn btn-primary px-4 ms-6">Submit</button>
                          <button type="button" class="btn bg-danger-subtle text-danger  px-4 ms-6">
                            Cancel
                          </button>
                        </div>
                      </div>


                  </form>
                  </div>
                </div>
              </div>
              
               <!-- 비밀번호변경 modal content -->
               <div id="changepass-modal" class="modal fade" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable modal-lg">
                  <div class="modal-content">
                    <div class="modal-body">
                      <div class="text-center mt-2 mb-4">
                        <a href="../main/index.html" class="text-success">
                          <span>
                            <img src="../assets/images/logos/favicon.png" class="me-3" width="40" alt="" />
                          </span>
                        </a>
                      </div>

                      

                        <form action="${ contextPath }/member/modifyPwd.do" method="post" class="form-horizontal">
                          <div class="mb-3 row">
                            <label for="inputHorizontalSuccess" class="col-sm-2 form-label">현재 비밀번호</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control is-valid" id="inputHorizontalSuccess"
                               name="memPwd" placeholder="Enter your password" />
                              <div class="valid-feedback">
                                Success! You've done it.
                              </div>
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="inputHorizontalDnger" class="col-sm-2 form-label">새 비밀번호</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control is-invalid" id="inputHorizontalDnger"
                               name="updatePwd" placeholder="Enter your password" />
                              <div class="invalid-feedback">
                                영문,숫자,특수문자 포함 8~15자
                              </div>
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="inputHorizontalDnger" class="col-sm-2 form-label">새 비밀번호 확인</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control is-invalid" id="inputHorizontalDnger"
                              placeholder="Enter your password" />
                              <div class="invalid-feedback">
                                비밀번호 확인해주세요.
                              </div>
                            </div>
                          </div>
                        

                        <div class="mb-3 text-center">
                          <button class="btn bg-info-subtle text-info " type="submit">
                            변경하기
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
              <!-- end Default Basic Forms -->

                  </div>
                  
        </div>
        
        <!-- 캔버스 api 스크립트------------------------------------------------->
            <script>
            
            const signatureButton = document.getElementById('signatureButton');
            const canvasModal = document.getElementById('canvasModal');
            const canvas = document.getElementById('canvas');
            const context = canvas.getContext('2d');
            let isDrawing = false;

            // Handle button click event
            function handleSignatureClick(shipSeq) {
                canvasModal.style.display = 'block';
                context.clearRect(0, 0, canvas.width, canvas.height);
                isDrawing = false;
            }

            // mouse로 그리기 & 터치로 그리기 이벤트 추가
            canvas.addEventListener('mousedown', startDrawing);
            canvas.addEventListener('mousemove', draw);
            canvas.addEventListener('mouseup', endDrawing);
            canvas.addEventListener('touchstart', startDrawing);
            canvas.addEventListener('touchmove', draw);
            canvas.addEventListener('touchend', endDrawing);

            // Start drawing
            function startDrawing(event) {
                isDrawing = true;
                const { offsetX, offsetY } = getCoordinates(event);
                context.beginPath();
                context.moveTo(offsetX, offsetY);
            }

            // Draw on the canvas
            function draw(event) {
                if (!isDrawing) return;
                event.preventDefault();
                const { offsetX, offsetY } = getCoordinates(event);
                context.lineTo(offsetX, offsetY);
                context.stroke();
            }

            // End drawing
            function endDrawing() {
                isDrawing = false;
            }

            // Get the coordinates of the event (mouse or touch)
            function getCoordinates(event) {
            let offsetX, offsetY;
            if (event.type.startsWith('mouse')) {
                offsetX = event.offsetX;
                offsetY = event.offsetY;
            } else if (event.type.startsWith('touch')) {
                const rect = canvas.getBoundingClientRect();
                offsetX = event.touches[0].clientX - rect.left;
                offsetY = event.touches[0].clientY - rect.top;
            }
            return { offsetX, offsetY };
            }


            // Handle save button click event
            const saveButton = document.getElementById('saveButton');
            saveButton.addEventListener('click', () => {
                
                const signatureImage = canvas.toDataURL('image/png');
                // Perform further processing with the signature image data
                console.log('Signature image:', signatureImage);

                // Close the canvas modal
                canvasModal.style.display = 'none';

                const file = dataURLtoFile(signatureImage, 'sign_image.png');
                let formData = new FormData();
                formData.append('file', file);

                const headers = {
                    'Content-Type': 'multipart/form-data',
                };

                // Send image upload request to the server using Fetch
                // ajax로 바꾸기
                axios.put('apiURL', formData, { headers })
                .then(response => {
                    console.log(response);
                })
                .catch(error => {
                    console.log(error);
                });

            });

            // url -> 파일로 변경하기
            function dataURLtoFile(dataURL, filename) {
                const arr = dataURL.split(',');
                const mime = arr[0].match(/:(.*?);/)[1];
                const bstr = atob(arr[1]);
                let n = bstr.length;
                const u8arr = new Uint8Array(n);
                while (n--) {
                    u8arr[n] = bstr.charCodeAt(n);
                }
                return new File([u8arr], filename, { type: mime });
            }

            // 닫기 이벤트
            const closeButton = document.getElementById('closeButton');
            closeButton.addEventListener('click', (event) => {
                canvasModal.style.display = 'none';
            });

            // 지우기 이벤트
            const eraseButton = document.getElementById('erase');
            eraseButton.addEventListener('click', eraseCanvas);
            function eraseCanvas() {
                event.preventDefault();
                context.clearRect(0, 0, canvas.width, canvas.height);
            }

          </script> <!--  캔버스 api끝 --------- -->
        
        
        
        
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>
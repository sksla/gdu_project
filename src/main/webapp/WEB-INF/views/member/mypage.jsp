<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script>

	//전화 번호 입력 시 자동 - 넣기
	const addHyphen = (target) => {
	target.value = target.value
	  .replace(/[^0-9]/g, '')
	  .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
</script>

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
                            src="${ contextPath }<c:out value='${loginUser.profileUrl}' default='/assets/images/profile/user-2.jpg'/>"
                            class="shadow-warning rounded-2"
                            alt=""
                            width="72"
                            height="72"
                          />
                        </div>
                        
                        <button class="btn bg-primary-subtle text-primary w-10 mt-3" onclick="$('#profileImgFile').click();"> 프로필 변경 </button>
                        <input type="file" name="profileUrl" id="profileImgFile" style="display:none;" >
                        <div>
                          
                          <!-- 프로필이미지 변경용  -->
                          <script> 
								            $(document).ready(function(){
								            	$("#profileImgFile").on("change", function(evt){
								            
								            		if(this.files.length != 0){ // 현재 선택된 파일이 있을 경우
								            			
								            			let formData = new FormData();
								            			formData.append("uploadFile", this.files[0]);
								            			
								            			$.ajax({
								            				url:"${contextPath}/member/modifyProfile.do",
								            				type:"post",
								            				data: formData,
								            				processData:false,
								            				contentType:false,
								            				success:function(result){
								            					
								            					if(result == "SUCCESS"){
								            						location.reload(); // 새로고침
								            						
								            					}else if(result == "FAIL"){
								            						alertify.alert("프로필 변경 서비스", "프로필 변경에 실패하였습니다.");	
								            					}
								            					
								            				},error:function(){
								            					console.log("프로필 이미지 변경용 ajax 통신 실패");
								            				}
								            			})
								            		}
								            		
								            	})
								            })
								            
								         </script>
                          
                          
                        </div>
                      </div>
                      
                    </div>

                     

                

              <div class="card">
                <div class="card-body">
                  <h5>마이페이지</h5>
                  <p class="card-subtitle mb-3">
                    All bootstrap element classies
                  </p>
                  <form class="form" action="${ contextPath }/member/modify.do" method="post">

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
                                    <input class="form-control" type="text" name="memNo" value="${ loginUser.memNo }" readonly />
                                </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                  <label for="exampleInputSelect4"
                                    class="form-label fw-semibold col-sm-3 col-form-label">이름</label>
                                  <div class="col-sm-9">
                                    <input class="form-control" type="text" name="memName" value="${ loginUser.memName }"
                                       />
                                  </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                  <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">학과</label>
                                  <div class="col-sm-9">
                                    <div class="input-group">
                                        <input class="form-control" type="text" name="majorNo" value="${ loginUser.majorNo }" readonly />
                                    </div>
                                  </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="startDate3" class="form-label fw-semibold col-sm-3 col-form-label">직급</label>
                                    <div class="col-sm-9">
                                      <div class="input-group">
                                        <input class="form-control" type="text" name="jobNo" value="${ loginUser.jobNo }" readonly/>
                                      </div>
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">아이디</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" name="memId" value="${ loginUser.memId }"
                                        id="example-email-input" readonly />
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">전화번호</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="tel" name="phone" value="${ loginUser.phone }"
                                            id="example-tel-input" oninput="addHyphen(this)" />
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">이메일</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="email" name="email" class="form-control" value="${ loginUser.email }" />
                                    </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputSelect4"
                                      class="form-label fw-semibold col-sm-3 col-form-label">주소</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" name="address" value="${ loginUser.address }"
                                             id="example-address-input"  onclick="execPostCode();" />
                                    </div>
                                </div>
                                
                                
                              </div>

                              <div class="col-lg-6">
                                <div class="mb-4 row align-items-center">
                                  <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">생년월일
                                    </label>
                                  <div class="col-sm-9">
                                    <input type="text" class="form-control" value="${ loginUser.birth }" readonly>
                                 </div>
                                </div>
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">입사일
                                      </label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" value="${ loginUser.hireDate }" readonly>
                                    </div>
                                </div>
                                <!-- 퇴사일 null아닐경우에만 보여지게 조건처리  -->
                              <c:if test="${ not empty loginUser.endDate }">
                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">퇴사일
                                      </label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" value="${ loginUser.endDate }"  />
                                    </div>
                                </div>
                              </c:if>

                                <div class="mb-4 row align-items-center">
                                    <label for="exampleInputText18" class="form-label fw-semibold col-sm-3 col-form-label">서명이미지
                                      </label>
                                    <div class="col-sm-9">
                                    <c:if test="${ not empty loginUser.signUrl }">
                                        <img
                                            src="${ contextPath }${loginUser.signUrl}"
                                            class="shadow-warning rounded-2"
                                            alt=""
                                            width="150"
                                            height="100"
                                        />
                                   </c:if>
                                        <input class="form-control form-control-sm" id="formFileSm" name="signUrl" type="file" style="display: none;">
                                        <button type="button" id="createSign" class="btn btn-success rounded-pill px-4 createSign" data-bs-toggle="modal" data-bs-target="#canvasModal">
                                           <c:choose>
																			        <c:when test="${not empty loginUser.signUrl}">
																			            서명변경
																			        </c:when>
																			        <c:otherwise>
																			            서명만들기
																			        </c:otherwise>
																			    	</c:choose>
                                        </button>
                                    </div>
                                    <!-- 캔버스 모달 ------------>
                                    <div class="mb-3 row" id="canvasModal">
                                        <div class="col-md-10" id="canvasContainer">
                                           <canvas id="canvas" width="400" height="200"></canvas>
                                           <div class="d-flex justify-content-center ">
                                             <button type="button" class="btn btn-success  px-4" id="saveButton">저장</button>
                                             <button type="button" class="btn btn-success  px-4" id="erase">지우기</button>
                                             <button type="button" class="btn btn-success  px-4" id="closeButton">닫기</button>
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
                          <button type="submit" class="btn btn-primary px-4 ms-6">submit</button>
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

                      

                        <form action="${ contextPath }/member/modifyPwd.do" method="post" class="form-horizontal" id="changePwd_form">
                          <div class="mb-3 row">
                            <label for="inputHorizontalSuccess" class="col-sm-2 form-label">현재 비밀번호</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control " id="inputHorizontalSuccess"
                               name="memPwd" placeholder="Enter your password" required />
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="inputHorizontalDnger" class="col-sm-2 form-label">새 비밀번호</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control " id="memPwd"
                               name="updatePwd" placeholder="Enter your password" required/>
                              <div class="invalid-feedback" id="pwdCheck_result">
                                영문,숫자,특수문자 포함 8~15자
                              </div>
                            </div>
                          </div>
                          <div class="mb-3 row">
                            <label for="inputHorizontalDnger" class="col-sm-2 form-label">새 비밀번호 확인</label>
                            <div class="col-sm-10">
                              <input type="password" class="form-control " id="checkPwd"
                              placeholder="Enter your password"  required/>
                              <div class="invalid-feedback" id="pwdEqualCheck_result">
                                비밀번호 확인해주세요.
                              </div>
                            </div>
                          </div>
                        

                        <div class="mb-3 text-center">
                          <button class="btn bg-info-subtle text-info " type="submit" disabled>
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
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음주소찾기 -->
        
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
                $(".modal-backdrop").css("display", "block");
               
            		
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
                formData.append('uploadFile', file);

                const headers = {
                    'Content-Type': 'multipart/form-data',
                };

                // Send image upload request to the server using Fetch
                // ajax로 
                $.ajax({
            				url:"${contextPath}/member/modifySign.do",
            				type:"post",
            				data: formData,
            				processData:false,
            				contentType:false,
            				success:function(result){
            					
            					if(result == "SUCCESS"){
            						location.reload(); // 새로고침
            						
            					}else if(result == "FAIL"){
            						alert("사인 변경에 실패하였습니다.");	
            					}
            					
            				},error:function(){
            					console.log("사인 이미지 변경용 ajax 통신 실패");
            				}
            			})
                
                

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
            	 	eraseCanvas();
                canvasModal.style.display = 'none';
                $(".modal-backdrop").css("display", "none");
                
            });

            // 지우기 이벤트
            const eraseButton = document.getElementById('erase');
            eraseButton.addEventListener('click', eraseCanvas);
            function eraseCanvas() {
                event.preventDefault();
                context.clearRect(0, 0, canvas.width, canvas.height);
            }

          </script> <!--  캔버스 api끝 --------- -->
        
        
        	<script>
        	
        	let pwdResult = false;
        	let pwdEqualResult = false;
        	
        	$(document).ready(function(){
        		
        		document.getElementById('createSign').addEventListener('click', function() {
	            	
        			
	                
	                $(".modal-backdrop").css("display", "block");  
	                $("#canvasModal").css("display", "block");  
	                
	            })
        		
        		
						$("#changePwd_form input[name=updatePwd]").on("keyup", function(){ // 비밀번호 유효성 검사
								
								let regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&*!])[A-Za-z\d@#$%^&*!]{8,15}$/;
								
								if( $(this).val().trim().length == 0 ){
									pwdResult = checkPrint("#pwdCheck_result", "valid-feedback invalid-feedback", "", "");
									$(this).removeClass("is-invalid"); // is-invalid 클래스 제거
									$(this).removeClass("is-valid");
								}else{
									if (regExp.test($(this).val())){
										pwdResult = checkPrint("#pwdCheck_result", "invalid-feedback", "valid-feedback", "사용가능한 비밀번호입니다.");
										 $(this).removeClass("is-invalid"); // is-invalid 클래스 제거
					        	 $(this).addClass("is-valid"); // is-valid 클래스 추가
									}else {
										pwdResult = checkPrint("#pwdCheck_result", "valid-feedback", "invalid-feedback", "영문자, 숫자, 특수문자로 8~15자로 작성해주세요.");
											$(this).removeClass("is-valid"); // is-valid 클래스 제거
				        		  $(this).addClass("is-invalid"); // is-invalid 클래스 추가
									}
								}
								
								validate();
							})  // 비밀번호 유효성 검사 끝 ---------------------------------------------
     		
        		
        		
        		
        		$("#changePwd_form input[id=checkPwd]").on("keyup", function() {  // 새 비밀번호 같은지 확인
        		    var newPassword = $(this).val().trim(); // 입력된 새 비밀번호
        		    var originalPassword = $("#changePwd_form input[name=updatePwd]").val(); // 기존 비밀번호
								
        		    if( newPassword.length == 0 ){
        		    	pwdEqualResult = checkPrint("#pwdEqualCheck_result", "valid-feedback invalid-feedback", "", "");
        		    	$(this).removeClass("is-invalid"); // is-invalid 클래스 제거
        		    	$(this).removeClass("is-valid");
									}else{
										if (newPassword == originalPassword){
											pwdEqualResult = checkPrint("#pwdEqualCheck_result", "invalid-feedback", "valid-feedback", "비밀번호가 일치합니다.");
											 $(this).removeClass("is-invalid"); // is-invalid 클래스 제거
						        	 $(this).addClass("is-valid"); // is-valid 클래스 추가
										}else {
											pwdEqualResult = checkPrint("#pwdEqualCheck_result", "valid-feedback", "invalid-feedback", "비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
												$(this).removeClass("is-valid"); // is-valid 클래스 제거
					        		  $(this).addClass("is-invalid"); // is-invalid 클래스 추가
										}
									}
      
        		    validate();
        		})	// 새 비밀번호 같은지 확인 끝-------------------------------------
        		
        		
        	})
        	
        	function checkPrint(selector, rmClassNm, addClassNm, msg){  
								$(selector).removeClass(rmClassNm)
														.addClass(addClassNm)
														.text(msg);
								return addClassNm == "valid-feedback" ? true : false;

					}	
        	
        	
        	function validate(){ // 폼 제출 확인 함수
						
						if(pwdResult && pwdEqualResult ){
							$("#changePwd_form :submit").removeAttr("disabled");
						}else{
							$("#changePwd_form :submit").attr("disabled", true);					
						}
					}
        	
        	
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
        
        
        
      </div><!-- body-wrapper end 본문 끝-->
      
    </div><!-- page-wrapper end -->
    
    <!-- 세팅메뉴(바) -->
	    <jsp:include page="/WEB-INF/views/common/settingbar.jsp"/>
    
	</div><!-- main-wrapper end -->
	
	<!-- footer-->
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>
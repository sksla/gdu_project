<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 할일</title>
<style>

	.to-do-list-wrap>.to-do-list{ 
		width:45%; 
		box-sizing: border-box; 
		min-height: 500px; 
		border: 2px solid #ebf3fe; 
		border-radius: 10px;
	}
	
	.to-do-list>h4{
		margin: 15px;
    text-align: center;
	}
	.todo-title-color{color:#7986CB;}
	.todo-date{width:30%; margin:auto;}
	.todo-input-wrap{width:50%; margin:auto;}
	#input-text{border:2px dashed #7986CB; width:55%;}
	#addTaskBtn{background-color: #7986CB;}
	#addTaskBtn>i{color:white;}
	
	
	.todo-item {
		display: flex; 
		justify-content: space-between; 
		align-items: center; 
		padding: 10px; 
		background-color: #ebf3fe; 
		border-radius: 10px;
		margin-bottom: 5px;
	}
	
	#ongoing-tasks, #done-tasks{
		min-height: 550px;
		max-height:550px;
		overflow-y:auto;
	}
	
	.todo-item.completed .text{ 
		text-decoration: line-through;
		color: gray;
	}
	.form-check-input[type=checkbox]{
		border-color:gray;
	}
	#delAllDoneBtn{
		background-color: #7986CB; 
		color:white; 
		margin:10px 30px;
	}
	
 	/* 스크롤바 스타일 */
	#ongoing-tasks::-webkit-scrollbar {
	  width: 8px;
	  
	}
	#ongoing-tasks::-webkit-scrollbar-thumb {
	  background-color: #7986CB;
	  border-radius: 5px;
	}

  #done-tasks::-webkit-scrollbar {
 	 width: 8px;
  }
  #done-tasks::-webkit-scrollbar-thumb {
	  background-color: #7986CB;
	  border-radius: 5px;
	}
</style>
</head>
<body>
	<div class="main-wrapper">
	
		<!-- 각 페이지 별 사이드 바 -->
    <jsp:include page="/WEB-INF/views/common/calSidebar.jsp"/>
    
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
                  <h4 class="fw-semibold mb-8">오늘의 할일</h4>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a class="text-muted text-decoration-none" href="${ contextPath }">Home</a>
                      </li>
                      <li class="breadcrumb-item" aria-current="page">일정</li>
                      <li class="breadcrumb-item" aria-current="page">오늘의 할일</li>
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
              <h5 class="fw-semibold mb-8">오늘의 할일</h5><br>

              <div class="todo-container">
                <div class="input_todo">

                </div>
                <div class="todo-content-wrap d-flex-column justify-content-evenly align-items-center">
                  <div class="todo-header d-flex-column align-items-center">
                    <div class="todo-date form-group d-flex justify-content-center">
                      <button type="button" class="btn" onclick="moveDate(1);"><i class="ti ti-chevrons-left" style="font-size: 20px;"></i></button>
                      <input type="date" class="form-control" value="" style="width:60%;">
                      <button type="button" class="btn" onclick="moveDate(2);"><i class="ti ti-chevrons-right" style="font-size: 20px;"></i></button>
                    </div>
                    <br>
                    <div class="todo-input-wrap form-group d-flex justify-content-evenly">
                      <span class="fs-7 fw-semibold todo-title-color" >Todo List</span>&nbsp;&nbsp;&nbsp;
                      
                      <input type="text" name="" id="input-text" maxlength="30" style="border:2px solid #7986CB; width:55%; border-radius: 5px;" placeholder="오늘의 할일을 입력하세요(30자 이내)">&nbsp;&nbsp;&nbsp;
                      <button type="button" id="addTaskBtn" class="btn" onclick="addTodoList();"><i class="ti ti-plus"></i></button>
                      
                    </div>
                  </div>
                  <div class="d-flex justify-content-end" style="height:57px;">
                    <button class="btn" id="delAllDoneBtn" type="button">완료 항목 일괄 삭제</button>
                  </div>
                  <div class="to-do-list-wrap d-flex justify-content-evenly">
                    
                    <div class="card to-do-list" >
                      <h4 class="fw-semibold todo-title-color">To do</h4>
                      <div class="card-body" id="ongoing-tasks">
                        
                      </div>
                    </div>

                    <div class="card to-do-list" >
                      <h4 class="fw-semibold todo-title-color">Done</h4>
                      <div class="card-body" id="done-tasks">
                        
                      </div>
                    </div>

                  </div>
                </div>
              </div>



          </div>

          <script>
            $(document).ready(function(){
              setToday();
              
              ajaxSelectTodoList();
              countTodoList();
              
              $(".todo-date>input[type=date]").on("change", function(){
            	  //console.log("실행됨");
            	  ajaxSelectTodoList();
              })
              
              $("#delAllDoneBtn").on("click", function(event){
            	  ajaxDeleteTodo(event, 2, 0);
              })
              
              
              
            })
            
            
            // input[type="date"] value값 오늘로 지정하는 함수
            function setToday(){
              let now = new Date();
              let year = now.getFullYear();
              let month = (now.getMonth() + 1 ) < 10 ? "0" + (now.getMonth() + 1) : (now.getMonth() + 1);
              let date = now.getDate() < 10 ? "0" + now.getDate() : now.getDate();
              
              let nowStr = year + "-" + month + "-" + date;
              $(".todo-header input[type='date']").val(nowStr);
              
            }
            
            // 날짜 하루씩 이동하는 버튼
            function moveDate(dir){
              let dateVal = $(".todo-header input[type='date']").val();
              let date = new Date(dateVal);
              let moveDate = new Date(dateVal);
              
              if(dir == 1){
                moveDate.setDate(date.getDate() - 1);
              }else{
                moveDate.setDate(date.getDate() + 1);
              }
              
              let yyyy = moveDate.getFullYear();
              let mm = String(moveDate.getMonth() + 1).padStart(2, "0");
              let dd = String(moveDate.getDate()).padStart(2, "0");
              
              $(".todo-header input[type='date']").val(yyyy + "-" + mm + "-" + dd);
              ajaxSelectTodoList();
            }
            
            // 투두리스트 등록용 ajax
            function addTodoList(){
              const input = document.getElementById("input-text");
              const taskText = input.value.trim();
              const ongoingTasks = document.getElementById("ongoing-tasks");
							const todoItems = ongoingTasks.getElementsByClassName('todo-item');
              
              if(taskText == ""){
                alert("할 일을 입력해주세요!");
                return;
              }
              
              $.ajax({
            	  url:"${contextPath}/calendar/insertTodo.do",
            	  type:"post",
            	  data:{
            		  tdlDate:$(".todo-header input[type='date']").val(),
            		  tdlContent:taskText,
            	  },
            	  success:function(result){
            		  console.log(result);
            		  if(result == "SUCCESS"){
            			  ajaxSelectTodoList();
            		  }else{
            			  alert("등록에 실패했습니다.");
            		  }
            	  },
            	  error:function(){
            		  console.log("투두리스트 등록용 ajax통신 실패");
            	  }
              })
							
              /*
              const todoItem = createTodoItem(0,taskText);
              ongoingTasks.appendChild(todoItem);
              //let ongoingTasks = $("#ongoing-tasks");
          		//ongoingTasks.scrollTop(ongoingTasks.get(0).scrollHeight);
							*/
          		ongoingTasks.scrollTop = ongoingTasks.scrollHeight;
              input.value = "";
              
            }
						
            // todo-item (할 일 ) 요소 만드는 function
            function createTodoItem(tdlNo ,taskText, isCompleted){

              const todoItem = document.createElement("div");
              // todo-item 생성
              todoItem.className = "todo-item";
              //taskItem.draggable = true;
              //taskItem.addEventListener('dragstart', handleDragStart);
              //taskItem.addEventListener('dragend', handleDragEnd);

              // todo-item 안 내용과 버튼 박스 div 생성
              const contentDiv = document.createElement("div");
              contentDiv.className = "form-check form-check-inline";
              const btnDiv = document.createElement("div");
              btnDiv.className = "btn-group";

              // 체크박스와 할일 내용 생성
              const checkbox = document.createElement('input');
              checkbox.type = "checkbox";
              checkbox.className = "form-check-input primary";
              checkbox.name = "tdlNo";
              checkbox.value = tdlNo;
              checkbox.addEventListener('change', toggleTodoCompletion);
              
              checkbox.checked = (isCompleted == "Y" ? true : false);

              const text = document.createElement('span');
              text.className = "text"
              text.textContent = taskText;

              contentDiv.append(checkbox, text);

              // button 생성
              const btnGroup = document.createElement("div");
              //const editBtn = document.createElement("button");
              //const editIcon = document.createElement("i");
              const delBtn = document.createElement("button");
              const delIcon = document.createElement("i");
              //editBtn.className = "btn";
              //editBtn.type = "button";
              delBtn.className = "btn";
              delBtn.type = "button";
              //editIcon.className = "ti ti-pencil"
              delIcon.className = "ti ti-trash";
              //editBtn.appendChild(editIcon);
              delBtn.appendChild(delIcon);
              delBtn.addEventListener('click', function(event){
            	  ajaxDeleteTodo(event, 1, tdlNo);
              });

              btnDiv.append(delBtn);

              todoItem.append(contentDiv, btnDiv);

              return todoItem;
            }

            // 체크박스 여부에 따라 상태값 변경하는 function
            function toggleTodoCompletion(event){
              const todoItem = event.target.closest(".todo-item");
              const isCompleted = event.target.checked ? "Y" : "N";
              const tdlNo = event.target.value;
							
              //console.log(todoItem);
							/*
              if(isCompleted){
                //todoItem.classList.add('completed');
                //document.getElementById("done-tasks").appendChild(todoItem);
                ajaxUpdateIsCompleted(checkboxValue,"Y");
              }else{
                //todoItem.classList.remove("completed");
                //document.getElementById("ongoing-tasks").appendChild(todoItem);
                ajaxUpdateIsCompleted(checkboxValue,"N");
              }
							*/
							$.ajax({
            		url:"${contextPath}/calendar/toggleTodoStatus.do",
            		type:"post",
            		data:{
            			tdlNo:tdlNo,
            			isCompleted:isCompleted
            		},
            		success:function(result){
            			//console.log(result);
            			if(result != "SUCCESS"){
            				alert("완료여부 변경에 실패했습니다.");
            			}
            			ajaxSelectTodoList();  
            			countTodoList();
            		},
            		error:function(){
            			
            		}
            	})
              //ajaxUpdateIsCompleted(tdlNo,( isCompleted ? "Y" : "N" ) );
							
            }
            
            // 투두리스트 조회
            function ajaxSelectTodoList(){
            	$.ajax({
            		url:"${contextPath}/calendar/todoList.do",
            		type:"post",
            		data:{
            			tdlDate:$(".todo-header input[type='date']").val()
            		},
            		success:function(list){
            			console.log("조회 ajax실행");
            			$('#ongoing-tasks .no-todo-item').remove();
            			$('#ongoing-tasks .todo-item').remove();
            			$('#done-tasks .todo-item').remove();
            			$('#done-tasks .no-todo-item').remove();
            			
            			let ongoingList = "";
            			let doneList = "";
            			console.log("list:", list);
            			if(list.length > 0){
            				for(let i=0; i<list.length; i++){
            					if(list[i].isCompleted == "N"){
            						let todoItem = createTodoItem(list[i].tdlNo ,list[i].tdlContent, list[i].isCompleted);
            						$("#ongoing-tasks").append(todoItem);
            					}else{
            						let todoItem = createTodoItem(list[i].tdlNo ,list[i].tdlContent , list[i].isCompleted);
            						
            						todoItem.classList.add("completed");
            						$("#done-tasks").append(todoItem);
            					}
            				}
            				
            				
            			}else{
            				ongoingList += "<div class='no-todo-item' style='text-align:center'>"
                                 +		"<p><i class='ti ti-pencil-plus fs-7'></i><br>오늘의 할 일이 없습니다. <br>할 일을 추가하여 목록을 채워보세요!</p>" 
                                 + "</div>";
                    doneList += "<div class='no-todo-item' style='text-align:center'>"
                        		  +		"<p><i class='ti ti-list-check fs-7'></i><br>완료된 할 일이 없습니다.<br>하나씩 목표를 달성해보세요!</p>" 
                              + "</div>"; 
	            			
                    $("#ongoing-tasks").html(ongoingList);
  	          			$("#done-tasks").html(doneList);
                             
            			}
            			
            			countTodoList();
            			
            		},error:function(){
            			console.log("투두리스트 조회용 ajax 통신 실패");
            		}
            	})
            }
            
            // 투두리스트 삭제용 ajax
            function ajaxDeleteTodo(event, delType, tdlNo){
            	let confirmMsg = "";
            	
            	if(delType == 1){
           		 	const todoItem = event.target.closest('.todo-item');
           		 	
            		confirmMsg = todoItem && todoItem.classList.contains('completed') ? "완료된 항목을"
            																																			: "진행중인 할 일을";
            	}else{
            		confirmMsg = "해당 날짜(" + $(".todo-header input[type='date']").val() + ")의 완료된 항목을 일괄";
            	}
            	
            	if(confirm(confirmMsg + " 삭제하시겠습니까? \n(삭제 후 복구가 불가합니다.)")){
            		//alert(confirmMsg + delType + ", " + tdlNo + ", " + $(".todo-header input[type='date']").val() + " 삭제요청");
            		
	            	$.ajax({
	            		url:"${contextPath}/calendar/deleteTodo.do",
	            		type:"post",
	            		data:{
	            			delType:delType,
	            			tdlNo:tdlNo,
	            			tdlDate:$(".todo-header input[type='date']").val()
	            		},
	            		success:function(result){
	            			
	            			if(result == "SUCCESS"){
											alert("성공적으로 삭제되었습니다.");            				
	            			}else{
	            				alert("삭제에 실패했습니다.");
	            			}
	            			ajaxSelectTodoList();
	            		},
	            		error:function(){
	            			console.log("오늘 할일 삭제용 ajax통신 실패");
	            		}
	            	})
	            	
            	}
            	
            }

            function countTodoList(){
           		let $ongoingCount = $("#ongoing-tasks .todo-item").length;
           		let $doneCount = $("#done-tasks .todo-item").length;
           		
           		let ongoingStr = "";
           		let doneStr = "";
           		if($ongoingCount == 0 && $doneCount > 0){
           			// 모든 할일을 완료함
           			// 완료된 항목 전체 삭제 버튼 보이게
           			ongoingStr = "<div class='no-todo-item' style='text-align:center'>"
                            +		"<p><i class='ti ti-confetti fs-7'></i><br>대단해요!<br> 오늘의 모든 할 일을 끝냈습니다!</p>" 
                            + "</div>";
                            
                	$("#ongoing-tasks").html(ongoingStr);
                	
           		}else if($ongoingCount > 0 && $doneCount == 0){
           			doneStr = "<div class='no-todo-item' style='text-align:center'>"
                         +		"<p><i class='ti ti-list-check fs-7'></i><br>완료된 할 일이 없습니다.<br>하나씩 목표를 달성해보세요!</p>" 
                         + "</div>";
           			$("#done-tasks").html(doneStr);
           		}
           		
         			$("#delAllDoneBtn").css("display", $doneCount <= 0 ? "none" : "inline");
           		
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
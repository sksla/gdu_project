<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
	<script>
	
		$(document).ready(function(){
		  ajaxSelectAlertList();
		  
		// 웹소켓 서버와 연결됨 (=> AlertEchoHandler에 재정의해둔 afterConnectionEstablished 메소드 실행됨)
			const alertSock = new SockJS("${contextPath}/alert");
			alertSock.onmessage = onAlertMessage;
			alertSock.onclose = function(){
				location.href = '${contextPath}';
			}
		})
		
		
		
		// 알람을 출력시키는 영역의 요소객체
		const $alertBody = $(".alert-body");
		
		// 나에게 알림이 왔을 때 실행되는 function
		function onAlertMessage(evt){// 웹소켓에서 클라이언트에게 보내준 데이터
			//console.log("실헹");
		
		  let alertArr = evt.data.split("|"); // ["알림번호", "알림타입", "알림내용", "알림링크", "알림시간"]
		  let alertNo = alertArr[0];
		  let alertType = alertArr[1];
		  let alertContent = alertArr[2];
		  let alertLink = alertArr[3];
		  let alertSendDate = alertArr[4];
		  let $alertItem = createAlertItem(alertNo, alertType, alertContent, alertLink, alertSendDate)
		  $(".alert-body .no-alert-item").css("display", "none");
		  $alertBody.prepend($alertItem);
			//console.log("메세지 들어는 왔냐", alertArr);
			newAlertCount();
		  
		}
		
		// 기존에 있던 alert목록 조회
		function ajaxSelectAlertList(){

		  $.ajax({
		    url:"${contextPath}/alert/alertList.do",
		    type:"post",
		    data:{},
		    async:false,
		    success:function(list){

		      let alertEl = null;
					$(".alert-body .alert-item").remove();
		      if(list.length > 0){
		    	  console.log("list", list);
		        for(let i=0; i<list.length; i++){
		          $alertItem = createAlertItem(list[i].alertNo, list[i].alertType, list[i].alertContent, list[i].alertLink, list[i].sendDate);

		          // 읽음 알람일 경우 읽음 스타일 적용
		          $alertItem.addClass( (list[i].readStatus == "Y") ? "read-alert" : "");
		          

		          $alertBody.append($alertItem);

		        }
		      }
		      newAlertCount();
		    },
		    error:function(){
		      console.log("알림목록 조회용 ajax통신 실패");
		    }

		  })
		  
		}
		
		// 새로운 알림 개수 출력 및 파란색 동그라미 보이거나 안보이게
		function newAlertCount(){
		  let alertItemCount = $(".alert-body .alert-item").length;
		  let readItemCount = $(".alert-body .read-alert").length;
		  let newItemCount = alertItemCount - readItemCount;

		  $(".notification").css("display", (newItemCount > 0) ? "block" : "none");

		  $(".alert-title .new-alert-count").text(newItemCount + " new" );
		  console.log("alertitem 개수 : ", alertItemCount);
		  
		  $(".alert-body .no-alert-item").css("display", (alertItemCount > 0 ? "none" : "block"));
		  $(".alert-area #delAllAlertBtn").prop("disabled", (alertItemCount > 0 ? false : true));

		}
		
		// 알림 요소 만드는 function
		function createAlertItem(alertNo, alertType, alertContent, alertLink, alertSendDate){
		  // 아이콘 클래스명
		  let alertIconClassName = alertType == "S" ? "ti ti-calendar-plus" : "ti ti-message-circle-plus";

		  // 알림 아이템 div 만들기
		  let $alertItemEl = $("<div>").addClass("alert-item py-6 px-7 d-flex justify-content-between align-items-center dropdown-item");
		  
		  let $aEl = $("<a>").addClass("d-flex justify-content-start align-items-center");
		  // a태그에 클릭시 읽음처리 후 해당 링크로 이동하는 이벤트 걸기
		  $aEl.on("click", function(event) {
		    ajaxUpdateAlertReadStatus(alertNo, alertLink, $(this));
		  });
		  

		  let $iconSpanEl = $("<span>").addClass("me-3")  
		                                .append("<i class='" + alertIconClassName + "'></i>");
		  let $alertContentEl = $("<div>").addClass("w-75 d-inline-block v-middle")
		                                  .append("<h6 class='mb-1 fw-semibold lh-base'>" + alertContent + "</h6>")
		                                  .append("<p>" + alertSendDate + "</p>");

		  $aEl.append($iconSpanEl, $alertContentEl);

		  let $btnDivEl = $("<div>").append("<button type='button' onclick='ajaxDeleteAlert(1, " + alertNo + ", this);' class='btn'><i class='ti ti-trash'></i></button>");
		  
		  $alertItemEl.append($aEl, $btnDivEl);

		  

		  return $alertItemEl;

		}
		
		// 클릭시 읽음 처리하는 function
		function ajaxUpdateAlertReadStatus(alertNo, alertLink){
		  $alertItem = $aEl.closest(".alert-item");
			
		  if($alertItem.hasClass("read-alert")){
		    // 이미 읽은 알림일 경우 그냥 링크 이동
		    location.href = "${contextPath}" + alertLink;
		  }else{
		    // 안 읽은 알림일 경우 읽음 상태로 변경 후 페이지 이동
		    $.ajax({
		      url:"${contextPath}/alert/readAlert.do",
		      type:"post",
		      data:{alertNo:alertNo},
		      success:function(result){
		        if(result == "SUCCESS"){
		          $alertItem.addClass("read-alert");
		          location.href = "${contextPath}" + alertLink;
		        }else{
		          alert("페이지 이동에 실패했습니다. 잠시후 다시 시도해주세요");
		        }
		      },
		      error:function(){
		        console.log("읽음 상태 수정용 ajax통신 실패");
		      }
		    })

		  }
		}
		
		// 알림 개별 삭제(delType==1) | 읽음알림 전체 삭제(delType ==2) function
		function ajaxDeleteAlert(delType, alertNo, btnEl){
		  $.ajax({
		    url:"${contextPath}/alert/deleteAlert.do",
		    type:"post",
		    data:{
		      delType:delType,
		      alertNo:alertNo
		    },
		    success:function(result){
		      if(result == "SUCCESS"){
		        //alert( (delType == 2 ? "읽은 모든 " : "")+ "알림을 성공적으로 삭제했습니다.");
		        console.log("result : " + result );
		        if(delType == 1){
		        	$(btnEl).closest(".alert-item").remove();
		        }else{
		        	$(".alert-body .alert-item").remove();
		        }
		        
			      newAlertCount();
		        
		      }else{
		        alert("알림 삭제에 실패했습니다. 잠시 후 다시 시도해주세요");
		      }
		      
		    },
		    error:function(){
		      console.log("알림 삭제용 ajax통신 실패");
		    }
		  })
		  
		}
	
	</script>
</body>
</html>
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

	<div class="dark-transparent sidebartoggler"></div>
  <script src="${ contextPath }/assets/js/vendor.min.js"></script>
  <!-- Import Js Files -->
  <!-- 제이쿼리 라이브러리 -->
  <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
  
  <script src="${ contextPath }/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${ contextPath }/assets/libs/simplebar/dist/simplebar.min.js"></script>
  <script src="${ contextPath }/assets/js/theme/app.init.js"></script>
  <script src="${ contextPath }/assets/js/theme/theme.js"></script>
  <script src="${ contextPath }/assets/js/theme/app.min.js"></script>
  <script src="${ contextPath }/assets/js/theme/sidebarmenu.js"></script>

  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  <script src="${ contextPath }/assets/libs/owl.carousel/dist/owl.carousel.min.js"></script>
  <script src="${ contextPath }/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
  <script src="${ contextPath }/assets/js/dashboards/dashboard.js"></script>
  
</body>
</html>
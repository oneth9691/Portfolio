<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>alert("중복된 과목 이름 입니다.");</script>
<%
/* RequestDispatcher rd = request.getRequestDispatcher("/admin/admin.jsp");
rd.forward(request, response); */

response.sendRedirect("/admin/admin.jsp");
%>
</body>
</html>
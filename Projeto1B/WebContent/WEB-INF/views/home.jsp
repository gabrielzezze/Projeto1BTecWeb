<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/home.css" />
<meta charset="UTF-8">
<%@ page import = "java.util.*,mvc.model.*"  %>
<title>JRELLO</title>
</head>
<body style='background-color: #985FE0; padding: 0; margin: 0'>
<% DAO dao = new DAO();
   HttpSession sessao = request.getSession(false);
   Integer id = (Integer) sessao.getAttribute("id"); 
   User user = dao.getUserById(id); %>
<jsp:include page="head.jsp" />
<div style='display: flex; flex-direction: row;'>
<% List<String> allStatus = dao.getAllStatus(id); 
   String filter = (String) request.getAttribute("filter");
   Integer index = 0;
   for (String status : allStatus) {%>
	<jsp:include page="cards.jsp">
		<jsp:param name="status" value="<%=status%>" />
		<jsp:param name="status" value="<%=filter%>" />
		<jsp:param name="index" value="<%=index%>" />
	</jsp:include>
	<% index ++; %>
<% } %>
</div>
</body>
</html>
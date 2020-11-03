<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.filter {
  width: 7rem;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 0.3rem;
  font-size: 1rem;
  font-family: Avenir;
  background-color: white;
/*   background-image: url('searchicon.png');
  background-position: 10px 10px;  */
  background-repeat: no-repeat;
/*   padding: 12px 20px 12px 40px; */
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
}

.filter:focus {
  width: 100%;
}
</style>
<meta charset="UTF-8">
<%@ page import = "java.util.*,mvc.model.*"  %>
<title>Head</title>
</head>
<body style='margin: 0; padding: 0'>
<%HttpSession sessao = request.getSession(false);
Integer id = (Integer) sessao.getAttribute("id"); 
  DAO dao = new DAO();%>
<div style='background-color: #743CBE;
			display: flex;
			flex-direction: row;
	  		align-items: center;
  			justify-content: space-between'>	
	<%if(id != null){ %>
		<form action='/Projeto1B/home' method='get'>
		<div style='display: flex; flex-direction: row'>
		<input type='text' name='filter' class='filter' placeholder='Procurar...' />
		<button style='	border: none;
		background: none;
		cursor: pointer;
		border-radius: 0.3rem;
		background-color: white;
		margin: 0 0 0 0.3rem' type='submit'>
			<h4 style='margin: 0;
				   font-weight: 800;
				   font-family: Avenir'>Ok</h4>
		</button>
	</div>
	</form>
	<%}%>
	<h2 style='color: #1AF6FD; font-family: Avenir; align-self: center'>JRELLO</h2>
	<%if(id != null){ %>
	<div style='display: flex; flex-direction: row'>
	<h3 style= 'color: white;
						   align-self: center;
						   padding-right: 1rem;
						   text-decoration: none;
						   font-weight: normal;
						   font-family: Avenir'><%=dao.getUserById(id).getName()%></h3>
	<jsp:include page="modalAddCard.jsp" >
		<jsp:param name="head" value="head" />
	</jsp:include>
	<a href='/Projeto1B/logout' style= 'color: white;
						   align-self: center;
						   padding-right: 1rem;
						   text-decoration: none;
						   font-family: Avenir'>
						  Logout
	</a>
	</div>
	<%}%>
</div>
</body>
</html>
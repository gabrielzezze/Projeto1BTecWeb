<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="">
<title>Projeto 1 - Login</title>
<style>
.modalInput{
  width: 100%; 
  border: none;
  border-bottom: 0.07rem solid #1AF6FD;
  background-color: #985FE0;
  font-size: 1rem;
  font-weight: normal;
  font-family: Avenir;
  font-color: white;
  margin-bottom: 1rem
}

input:focus, button:focus, select:focus {
	outline: 0 solid #000;
}
.botao{
	border: none;
	background: none;
	cursor: pointer;
	margin-top: 1rem;
	border-radius: 0.3rem
}
.textButton{
	margin: 0;
	font-weight: normal;
	font-family: Avenir;
	color: white;
	font-size: 1.3rem;
	padding: 0.5rem;
	text-align: center
}
</style>
</head>
<body style='margin:0; padding:0; background-color: #985FE0'>
<div>
<jsp:include page="head.jsp" />
</div>
<div style='display: flex; align-items: center; justify-content: center'>
	<div style='width: 30%; padding: 2rem 0 0 0'>
		<form action="login" method="post">
  			<h3 style='margin: 0;
  				   color: white;
				   font-weight: normal;
				   font-family: Avenir'>Email:</h3>
			 <input class='modalInput'
			 		type="email" 
			 		max-length="100" 
			 		name="email"> <br>
			 <h3 style='margin: 0;
			 	   color: white;
				   font-weight: normal;
				   font-family: Avenir'>Senha:</h3>
			 <input 
			 	class='modalInput'
			 	type="password"
			 	max-length="200" 
			 	name="password"> <br>
			<div style='display: flex; flex-direction: column; align-itens: flex-start'>
				<button class='botao' style='background-color: #02B6BC' type="submit">
					<h3 class='textButton'>Login</h3>
				</button>
				<a class='botao' style='background-color: #FF4F19; text-decoration: none' href="/Projeto1/register">
					<h3 class='textButton'>Cadastre-se</h3>
				</a>
			</div>	
		</form>
	</div>
</div>
</body>
</html>
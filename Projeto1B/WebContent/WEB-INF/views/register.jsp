<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="">
<title>Projeto 1 - Cadastro</title>
<style>
.modalInput{
  width: 100%; 
  border: none;
  border-bottom: 0.07rem solid #1AF6FD;
  /* background-color: #985FE0; */
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
<jsp:include page="head.jsp" />
<div style='display: flex; align-items: center; justify-content: center'>
	<div style='width: 30%; padding: 2rem 0 0 0'>
		<form action="/Projeto1/register" method="post">
		  	<h3 style='margin: 0;
  				   color: white;
				   font-weight: normal;
				   font-family: Avenir'>Nome:</h3>
			 <input class='modalInput'
			 		type="text" 
			 		max-length="100" 
			 		name="name"> <br>
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
					<h3 class='textButton'>Cadastrar</h3>
				</button>
				<a class='botao' style='background-color: #FF4F19; text-decoration: none' href="/Projeto1/login">
					<h3 class='textButton'>Já tenho cadastro</h3>
				</a>
			</div>	
		</form>
	</div>
</div>
</body>
</html>

<!-- 	<form action="/Projeto1/register" method="post">
	<h3>Nome:</h3>
	<input type="text" name="name"></input>
	<br>
	<h3>Email:</h3>
	<input type="email" name="email"></input>
	<br>
	<h3>Senha:</h3>
	<input type="password" name="password"></input>
	<br>
	<button type="submit">Cadastrar !</button>
	<br>
	</form> -->
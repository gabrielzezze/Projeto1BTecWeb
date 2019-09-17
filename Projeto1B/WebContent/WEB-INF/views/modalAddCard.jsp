<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crie um novo cartao</title>
<style>
.modalInput{
  width: 100%; 
  border: none;
  border-bottom: 0.07rem solid #1AF6FD;
  font-size: 1rem;
  font-weight: normal;
  font-family: Avenir;
  margin-bottom: 1rem
}

input:focus, button:focus, select:focus {
	outline: 0 solid #000;
}
#appearance-select{
   -webkit-appearance: none;
   -moz-appearance: none; 
   appearance: none; 
   background: url(http://www.webcis.com.br/images/imagens-noticias/select/ico-seta-appearance.gif) no-repeat #eeeeee; 
   background-position: 218px center; 
   width: 250px;
   height: 2rem; 
   border:1px solid #ddd;
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
	padding: 0.5rem
}
#appearance-select *{
	margin: 0;
	font-weight: normal;
	font-family: Avenir;
	color: white;
	font-size: 1.3rem;
	padding: 0.5rem
}
.new-card-container:hover{
background-color: white

}
#new-card-text:hover{
text-decoration: underline
}
.hidden{
display: none
}
</style>
</head>
<body>
<%String index = request.getParameter("index");
  String head = request.getParameter("head");
  String status = request.getParameter("status");
  String dialogId = "favDialog" + index;
  String confirmId = "confirm" + index;
  String cancelId = "cancel" + index;
  String addId = "add" + index;
  String textId = "new-card-text-"+status;
  
%>
<div class='hidden' style='border-radius: 0.3rem; 
						   background-color: #F9F9F9;
						   border: none; 
						   position: none; 
						   width: 30%;
						   position: fixed;
						   top: 25%;
						   padding: 1rem;
						   left: 75%;
						   margin-left: -37.5%' id=<%=dialogId%>>
  		<form action="/Projeto1B/POST_CARD" method="post">
  			<h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Título:</h3>
			 <input class='modalInput'
			 		type="text" 
			 		max-length="100" 
			 		name="title"> <br>
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Descriçao:</h3>
			 <input 
			 	class='modalInput'
			 	type="text"
			 	max-length="200" 
			 	name="description"> <br>
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Status:</h3>
			<input 
			 	class='modalInput'
			 	type="text"
			 	max-length="30" 
			 	name="status"> <br>
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Prazo:</h3>
			<input 
			 	class='modalInput'
			 	type="date"
			 	max-length=8
			 	name="duedate"> <br>
			<div style='display: flex; flex-direction: column; align-itens: flex-start'>
				<button class='botao' style='background-color: #09A5AA' id=<%=confirmId%> type="submit">
					<h3 class='textButton'>Criar card</h3>
				</button>
				<button class='botao' style='background-color: #FF4F19' id=<%=cancelId%> type="reset">
					<h3 class='textButton'>Cancelar</h3>
				</button>
			</div>	
		</form>
</div>

  <a style="cursor: pointer" id=<%=addId%>>
  	<%if(head == null) {%>
	<div id=<%=textId%> class="new-card-container" style='display: flex; flex-direction: row; align-items: center; border-radius: 0 0 0.3rem 0.3rem'>
		<img src='https://i.ibb.co/gSWzhcZ/add.png' style='height: 0.9rem; width: 0.9rem; margin: 0.4rem 0.4rem 0.4rem 0.6rem; padding: 0'/> 
		<h4 id='new-card-text' style='	color: #979696; 
					font-weight: normal;
					font-family: Avenir;
					margin: 0;
					padding: 0'>Adicionar novo card</h4>
	</div>
	<% } else { %>
		<h4 style=' color: white;
			align-self: center;
			flex-direction: center; 
			font-weight: normal;
			font-family: Avenir;
			margin: 17% 1rem 0 0;
			padding: 0'>Adicionar Card</h4>
	<% }%>
<!-- 	<img src='/P1/images/plus-button.png' style='height: 2rem; width: 2rem; margin: 1rem 0 0 1rem'/>  -->
  </a>
</body>
<script type="text/javascript">
(function() {
	  var a = <%=index%>;
	  var updateButton = document.getElementById("add" + a);
	  var cancelButton = document.getElementById("cancel" + a);
	  var confirmButton = document.getElementById("confirm" + a);
	  var favDialog = document.getElementById("favDialog" + a);
	  
	  updateButton.addEventListener('click', function() {
	    favDialog.classList.remove("hidden");
	  });

	  cancelButton.addEventListener('click', function() {
		  favDialog.classList.add("hidden");
	  });
	  
/* 	  confirmButton.addEventListener('click', function() {
		    favDialog.close();
		  }); */
	})();
</script>
</html>
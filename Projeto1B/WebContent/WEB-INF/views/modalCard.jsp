<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Veja as informaçoes do seu cartao</title>
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
#new-card-container:hover{
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
  String title = request.getParameter("title");
  String cardId = request.getParameter("cardId");
  String description = request.getParameter("description");
  String status = request.getParameter("status");
  String dialogId = "cardEditDialog" + cardId;
  String confirmId = "cardEditConfirm" + cardId;
  String cancelId = "cardEditCancel" + cardId;
  String addId = "cardEditAdd" + cardId;
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
  		<form action="/Projeto1B/PATCH_CARD" method="post">
			<input class='hiddenInput'
				type="hidden" 
				max-length="100" 
				name="title"
				value= "<%=title%>"
			>
			<input class='hiddenInput'
				type="hidden" 
				max-length="100" 
				name="description"
				value="<%=description%>"
			>
			<input class='hiddenInput'
				type="hidden" 
				max-length="100" 
				name="status"
				value="<%=status%>"
			>
			<input class='hiddenInput'
				type="hidden" 
				max-length="100" 
				name="cardId"
				value="<%=cardId%>"
			>
  			<h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Novo título:</h3>
			 <input class='modalInput'
			 		type="text" 
			 		max-length="100" 
			 		name="newTitle"
			 		value="<%=title%>"
			 > <br>
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Nova descriçao:</h3>
			 <input 
			 	class='modalInput'
			 	type="text"
			 	max-length="200" 
			 	name="newDescription"
			 	value="<%=description%>"> <br>
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Status:</h3>
			<input 
			 	class='modalInput'
			 	type="text"
			 	max-length="50" 
			 	name="newStatus"
			 	value="<%=status%>"> <br>
			
			<h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Prazo:</h3>
			<input 
			 	class='modalInput'
			 	type="date"
			 	max-length=8
			 	name="newDuedate"> <br>
			<div style='display: flex; flex-direction: column; align-itens: flex-start'>
				<button class='botao' style='background-color: #09A5AA' id=<%=confirmId%> type="submit">
					<h3 class='textButton'>Confirmar</h3>
				</button>
				<button class='botao' style='background-color: #FF4F19' id=<%=cancelId%> type="reset">
					<h3 class='textButton'>Cancelar</h3>
				</button>
			</div>	
		</form>
</div>

  <a style="cursor: pointer" id=<%=addId%>>
 	<img src='https://i.ibb.co/xF4SCNT/pencil.png' style='height: 1rem; width: 1rem; margin: 0; padding: 0'/>
  </a>
</body>
<script type="text/javascript">
(function() {
	  var cardId = <%=cardId%>;
	  var updateButton = document.getElementById("cardEditAdd" + cardId);
	  var cancelButton = document.getElementById("cardEditCancel" + cardId);
	  var confirmButton = document.getElementById("cardEditConfirm" + cardId);
	  var favDialog = document.getElementById("cardEditDialog" + cardId);
	  
	  // O botão Update abre uma Dialog
	  updateButton.addEventListener('click', function() {
		favDialog.classList.remove("hidden");
	  });

	  // O botão cancelButtom fecha uma Dialog
	  cancelButton.addEventListener('click', function() {
	  	favDialog.classList.add("hidden");
	  });
	  
/* 	  confirmButton.addEventListener('click', function() {
		    favDialog.close();
		  }); */
	})();
</script>
</html>
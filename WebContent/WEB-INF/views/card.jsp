<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartao</title>
<style>
.hidden{
display: none
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body style='font-family: Avenir'>
<%String index = request.getParameter("index");
  String title = request.getParameter("title");
  String cardId = request.getParameter("cardId");
  String description = request.getParameter("description");
  String status = request.getParameter("status");
  String dueDate = request.getParameter("dueDate");
  if(dueDate.equals("null")){
	  dueDate = "";
  }

  String dialogId = "cardDialog" + cardId;
  String confirmId = "cardConfirm" + cardId;
  String cancelId = "cardCancel" + cardId;
  String addId = "cardAdd" + cardId;
 
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
  		<div>
  		  <div>
			<div style='display: flex; flex-direction: row; align-items: center; justify-content: space-between'>
				<div style='display: flex; flex-direction: row; align-items: center'>
				<img src='https://i.ibb.co/qmWvVF2/newspaper.png' style='height: 1rem; 
							   width: 1rem; 
							   margin: 0 0.5rem 0 0; 
							   padding: 0;
							   cursor: pointer'/> 
	  			<h3 style='margin: 0;
					   font-weight: normal;
					   font-family: Avenir'>Título:</h3>
				</div>
				<div style='display: flex; flex-direction: row'>
				<form action="${pageContext.request.contextPath}/DELETE_CARD" method="post">
				<input class='hiddenInput'
				type="hidden" 
				max-length="100" 
				name="type"
				value='DELETE'
				>
				<button style='border: none; background: none; cursor: pointer'
						type="submit" 				  
						name='cardId' 
					    value='<%=cardId%>'>
					<img src='https://i.ibb.co/sq5CjVZ/trash.png' style='height: 1rem; width: 1rem; margin: 0 0.5rem 0 0; padding: 0'/> 
				</button>
			</form>
				<jsp:include page="modalCard.jsp" >
					<jsp:param name="index" value="<%=index%>" />
				    <jsp:param name="title" value="<%=title%>" />
				    <jsp:param name="description" value="<%=description%>" />
				    <jsp:param name="status" value="<%=status%>" />
				    <jsp:param name="cardId" value="<%=cardId%>" />
				</jsp:include>
				<img id=<%=cancelId%> src='https://i.ibb.co/8x9B29n/close.png' style='height: 1rem; 
													   width: 1rem; 
													   margin: 0 0 0 1rem; 
													   padding: 0;
													   cursor: pointer'/>
				</div>									    
			</div>
  			<h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir;
				   margin: 0 0 0 1.5rem'><%=title%></h3> <br>
			<div style='display: flex; flex-direction: row; align-items: center'>
			<img src='https://i.ibb.co/vYgM6Fj/align-to-right.png' style='height: 1rem; 
			   width: 1rem; 
			   margin: 0 0.5rem 0 0; 
			   padding: 0;
			   cursor: pointer'/> 
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Descriçao:</h3>
			</div>
  			<h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir;
				   margin: 0 0 0 1.5rem'><%=description%></h3> <br>
			<div style='display: flex; flex-direction: row; align-items: center'>
			<img src='https://i.ibb.co/wrdcngk/tags.png' style='height: 1rem; 
			   width: 1rem; 
			   margin: 0 0.5rem 0 0; 
			   padding: 0;
			   cursor: pointer'/> 
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Status:</h3>
			</div>
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir;
				   margin: 0 0 0 1.5rem'><%=status%></h3>
			<div style='display: flex; flex-direction: row; align-items: center; margin: 1rem 0 0 0'>
			<img src='https://i.ibb.co/Wk7ymNm/calendar.png' style='height: 1rem; 
			   width: 1rem; 
			   margin: 0 0.5rem 0 0; 
			   padding: 0;
			   cursor: pointer'/> 
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'>Prazo:</h3>
			</div>
			 <h3 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir;
				   margin: 0 0 0 1.5rem'><%=dueDate%></h3>
		  </div>
		</div>
</div>
		<div style='background-color: white;
					border-radius: 0.3rem;
					margin: 0.6rem 0.6rem;
					padding: 0.2rem 0.4rem 0.2rem 0.4rem; 
					display: flex;
					flex-direction: row;
					align-items: center;
	  			    justify-content: space-between;
	  			    cursor: pointer'
	  			    draggable='true'
	  			    
	  			    onDragEnd='onDragEnd(event)'
	  			    onDragOver='onDragOver(event)'
	  			    onDragStart='onDragStart(event)'
	  			    class="<%=status%> <%=cardId %>"
	  			    id="<%=addId%>"
	  			    >		
		<h4 style='margin: 0;
				   font-weight: normal;
				   font-family: Avenir'><%=title%></h4>
		<h5 style='margin: 0;
				   font-weight: 200;
				   font-family: Avenir;
				   opacity: 0.8;
				   '
				   >
		<%=dueDate %></h5>
		<div style='display: flex'>
		</div>
		</div>
</body>
<script type="text/javascript">
(function() {
	  var cardId = <%=cardId%>;
	  var updateButton = document.getElementById("cardAdd" + cardId);
	  var cancelButton = document.getElementById("cardCancel" + cardId);
	  var confirmButton = document.getElementById("cardConfirm" + cardId);
	  var favDialog = document.getElementById("cardDialog" + cardId);
	  
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
var id = null
var statusToBe = null
function onDragOver(e){
	if(e.target.parentNode.id !== null){
		statusToBe = e.target.parentNode.id
	}
}

function onDragStart(e){
	id = e.target.classList.item(1)
}

function onDragEnd(e){

	document.getElementById(statusToBe).appendChild(e.target)
	document.getElementById(statusToBe).appendChild(document.getElementById("new-card-text-"+statusToBe))
 	$.post("/Projeto1B/ALTER_STATUS",{cardId: id, statusToBe: statusToBe, type: "ALTER-STATUS"})
 	window.location.href="/Projeto1B/home";
}


</script>
</html>
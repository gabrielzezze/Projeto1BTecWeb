<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ page import = "java.util.*,mvc.model.*"  %>
<body style='margin: 0; padding: 0'>
<% DAO dao = new DAO();
		HttpSession sessao = request.getSession(false);
		Integer id = (Integer) sessao.getAttribute("id"); 
		String status = request.getParameter("status");
		String filter = request.getParameter("filter");
		Integer index = Integer.parseInt(request.getParameter("index"));
		List<Card> cards = dao.getCards(id, status, filter);%>
	<div style='margin-left: 1rem; 
		 border-radius: 0.3rem;
		 background-color: #e6e6e6;
		 margin-top: 1rem;
		 width: 15rem'
		 id="<%=status%>">
		<div style='display: flex; flex-direction: row'>
			<h3 style='margin: 0.3rem 0 0 0.6rem; 
					   padding: 0; 
					   font-weight: 500;
					   font-family: Avenir'> 
					   <%=status%> (<%= cards.size() %>)</h3>
		</div>
		<%for(Card card: cards){ %>
			<jsp:include page="card.jsp" >
				<jsp:param name="index" value="<%=index%>" />
			    <jsp:param name="title" value="<%=card.getTitle()%>" />
			    <jsp:param name="description" value="<%=card.getDescription()%>" />
			    <jsp:param name="dueDate" value="<%=card.getDuedate()%>" />
			    <jsp:param name="status" value="<%=card.getStatus()%>" />
			    <jsp:param name="cardId" value="<%=card.getId()%>" />
			</jsp:include>
	<%}%>
	<jsp:include page="modalAddCard.jsp" >
		<jsp:param name="index" value="<%=index%>" />
		<jsp:param name="status" value="<%=status%>" />
	</jsp:include>
	</div>

</body>
</html>
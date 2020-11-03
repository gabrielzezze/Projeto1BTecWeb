package mvc.controller;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import mvc.model.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CardController {

	@RequestMapping("/DELETE_CARD")
	public String deleteCard(String cardId) throws ClassNotFoundException, SQLException {
		DAO DAO = new DAO();
		Integer id1 = Integer.parseInt(cardId);
		try {
			DAO.deleteCard(id1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:home";
	}	
	
	@RequestMapping("/ALTER_STATUS")
	public String alterStatusCard(String cardId, String statusToBe) throws ClassNotFoundException, SQLException {
		try {
			DAO DAO = new DAO();
			DAO.setCardStatus(Integer.parseInt(cardId),statusToBe);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:home";
	}
	
	@RequestMapping("/POST_CARD")
	public String postCard(HttpSession session, String title, String description, String status, String duedate) throws ClassNotFoundException, SQLException {
		Integer userId = (Integer) session.getAttribute("id");
		try {
			DAO DAO = new DAO();
			Card card = DAO.createCard(title, description, status, userId, duedate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:home";
	}
	
	@RequestMapping("/PATCH_CARD")
	public String patchCard(String newTitle, String newDuedate, String cardId, String newDescription, String newStatus, String title, String description, String status, String duedate, HttpSession session) throws ClassNotFoundException, SQLException {
		Integer id = Integer.parseInt(cardId);
		try {
			DAO DAO = new DAO();
			DAO.patchCard(id, title, description, status, newTitle, newDescription, newStatus, newDuedate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:home";
	}
}
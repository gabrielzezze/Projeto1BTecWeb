package mvc.controller;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import mvc.model.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController {

	@RequestMapping("/register")
	public String postUser() throws ClassNotFoundException {
		return "register";
	}
	
	@RequestMapping("/POST_USER")
	public String postUser(String name, String email, String password, HttpSession session) throws ClassNotFoundException {
		User user = new User(name, email, password);
		try { 
			DAO DAO = new DAO();
			user = DAO.createUser(user);
			session.setAttribute("id", user.getId());
			return "redirect:home";
		} 
		catch (SQLException e) {
			e.printStackTrace();
			return "redirect:login";
		}
	}	
}
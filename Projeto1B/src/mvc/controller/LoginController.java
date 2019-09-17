package mvc.controller;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import mvc.model.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	
	@RequestMapping("/")
	public String getLoginView() {
		return"login";
	}
	
	@RequestMapping("login")
	public String login(String email, String password, HttpSession session) throws ClassNotFoundException, SQLException {
		DAO DAO = new DAO();
		User user = DAO.login(email, password);
		if(user != null) {
			session.setAttribute("id", user.getId());
			return "redirect:home";
		}
		
		return "login";
			
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.setAttribute("id", null);
		return"redirect:login";
	}

}

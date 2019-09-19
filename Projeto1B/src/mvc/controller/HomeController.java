package mvc.controller;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import mvc.model.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping("/home")
	public String home(HttpSession session, String filter) {
		Integer id = (Integer) session.getAttribute("id");
		System.out.println("Home");
		if (id != null) {
			if(filter != null) {
				// request.setAttribute("filter", filter);
				System.out.print("ARRUMAR FILTRO");
			}
			return "home";
			
		} else {
			return "redirect:login";
			}
	}	
}
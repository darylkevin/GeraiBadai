package gr.GeraiBadai.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	@GetMapping("/")
	public String myHomePage() {
		return "index";
	}
	
	@GetMapping("/action")
	public String beginGeraiBadai(HttpServletRequest request, Model model){
	    HttpSession session = request.getSession();
	    String myName = (String) session.getAttribute("myName");
	    String myGerai = (String) session.getAttribute("myGerai");
	    
	    if(myName != null && myGerai != null) {
	        model.addAttribute("myName", myName);
	        model.addAttribute("myGerai", myGerai);
	    }
	    return "choose-action";
	}

	@PostMapping("/action")
	public String beginGeraiBadai(
	        @RequestParam String myName,
	        @RequestParam String myGerai,
	        HttpServletRequest request,
	        Model model) {
	    HttpSession session = request.getSession();
	    
	    session.setAttribute("myName", myName);
	    session.setAttribute("myGerai", myGerai);
	    
	    model.addAttribute("myName", myName);
	    model.addAttribute("myGerai", myGerai);
	    return "choose-action";
	}
	
}

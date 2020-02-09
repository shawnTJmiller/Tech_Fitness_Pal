package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Info;
import com.techelevator.model.DAO.InfoDAO;
import com.techelevator.model.DAO.UserDAO;

@Controller
public class AuthenticationController {

	private InfoDAO infoDAO;
	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO, InfoDAO infoDAO) {
		this.userDAO = userDAO;
		this.infoDAO = infoDAO;
	}
	@RequestMapping(value={"", "/", "/login"}, method=RequestMethod.GET) // <-- change [/user/home] back to [login]
	public String displayLoginForm() {
		System.out.println("in login GET");
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(@RequestParam String userName, 
						@RequestParam String password, 
						@RequestParam(required=false) String destination,
						HttpSession session) {
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			session.setAttribute("currentUser", userDAO.getUserByUserName(userName));
			Info info = infoDAO.bringUpUsersInfo(userName);
			System.out.println("login username"+ info.getFirstName());
			session.setAttribute("info", info);
			
			if(destination != null && ! destination.isEmpty()) {
				return "redirect:" + destination;
			} else {
				return "redirect:/users/home";
			}
		} else {
			return "redirect:/login";
		}
	}

	@RequestMapping(path="/logout", method=RequestMethod.POST)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.invalidate();
		return "redirect:/login";
	}
}

package com.techelevator.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.EditProfile;
import com.techelevator.model.Info;
import com.techelevator.model.User;
import com.techelevator.model.DAO.InfoDAO;
import com.techelevator.model.DAO.JDBCUserDAO;
import com.techelevator.model.DAO.MealDataDAO;
import com.techelevator.model.DAO.UserDAO;

@Controller
public class UserController {

	private UserDAO userDAO;
	private InfoDAO infoDAO;

	@Autowired
	public JDBCUserDAO jdbcUserDao;

	@Autowired
	private MealDataDAO mealDAO;
	 
	@Autowired
	public UserController(UserDAO userDAO, InfoDAO infoDAO) {
		this.userDAO = userDAO;
		this.infoDAO = infoDAO;
	}

	@RequestMapping(path = "/users/new", method = RequestMethod.GET)
	public String displayNewUserForm(ModelMap modelHolder) {
		System.out.println("in users/new GET");
		if (!modelHolder.containsAttribute("user")) {
			modelHolder.addAttribute("user", new User());
		}
		return "newUser";
	}

	@RequestMapping(path = "/users/new", method = RequestMethod.POST)
	public String createUser(@RequestParam Map<String, String> reqPar, @ModelAttribute Info info, BindingResult result,
			RedirectAttributes flash) throws ParseException {
		if (result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
			flash.addFlashAttribute("info", info);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "info", result);
			return "redirect:/users/new";
		}

		// Printout for console
		String birthDate = reqPar.get("bday");
		System.out.println("birthdate: " + birthDate);
		System.out.println("user name : " + reqPar.get("userName"));

		// converts String Date entered into Date format
		String password = reqPar.get("password");
		String bd = reqPar.get("bday");
//		new LocalDate("yyyy-MM-dd");
		LocalDate d1 = LocalDate.parse(bd);
		info.setBirthDate(d1);

		User user = new User();
		user.setUserName(reqPar.get("userName"));
		user.setPassword(password);
		info.setUserName(reqPar.get("userName"));

		infoDAO.addNewUserInfo(info);
		userDAO.saveUser(user.getUserName(), user.getPassword());
		return "redirect:/users/home";
	}

	@RequestMapping(path = "/users/home", method = RequestMethod.GET)
	public String displayUserHome(ModelMap modelHolder, HttpSession session) {
		System.out.println("in displayUserHome");
		Info info = (Info) session.getAttribute("info");
//		User thisUser = (User) jdbcUserDao.getUserByUserName(userName);
//
//		System.out.println("... and this is the ID we get back : " + thisUser.getUserId());
//		apiData.setUserId(thisUser.getUserId());
//		jdbcMealDataDao.addNewData(apiData);

		User user = (User) jdbcUserDao.getUserByUserName(info.getUserName());
		LocalDate newMealDate = LocalDate.of(2019, 12, 18);
		Double calorieCount = mealDAO.returnDailyCalorieTotal(newMealDate, user.getUserId());

		for (Map.Entry<String, Object> entry : modelHolder.entrySet()) {
			System.out.println("HERE");
			System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
		}

		if (!modelHolder.containsAttribute("userName")) {
			modelHolder.addAttribute("userName");
			modelHolder.addAttribute("calories", calorieCount);
		}
		return "userHome";
	}

	@RequestMapping(path = "/users/editProfile", method = RequestMethod.GET)
	public String editProfile(ModelMap modelHolder) {
		System.out.println("in users/editProfile GET");
		if (!modelHolder.containsAttribute("editProfile")) {
			modelHolder.addAttribute("editProfile", new EditProfile());
		}
		return "editProfile";
	}

	@RequestMapping(path = "/users/editProfile", method = RequestMethod.POST)
	public String editProfile(@RequestParam Map<String, String> reqPar, @ModelAttribute Info info, BindingResult result,
			RedirectAttributes flash) throws ParseException {
		if (result.hasErrors()) {
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "editProfile", result);
			flash.addFlashAttribute("info", info);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "info", result);
			return "/users/editProfile";

		}
		else {
		return "redirect:/users/home"; 
		}
	}
}

//	@RequestMapping(path = "/users/new", method = RequestMethod.POST )
//	public String createNewUsersInfo(@Valid @ModelAttribute Info info,
//			BindingResult result,
//			RedirectAttributes flash) {
//		System.out.println("in the post");
//		if(result.hasErrors()) {
//			System.out.println("error in users/new  POST");
//			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "info", result);
//			flash.addFlashAttribute("info", info);
//			return "redirect:/newUser";
//		}
//		infoDAO.addNewUserInfo(info);
//		return "redirect:/users/info";
//	}
//	
//	@RequestMapping(path="/users/info", method=RequestMethod.GET)
//	public String getUsersInfo(@RequestParam String userName, ModelMap map) {
//		List<Info> usersInfo = infoDAO.bringUpUsersInfo(userName);
//		map.put("usersinfo", usersInfo);
//		return "userInfo";
//	}

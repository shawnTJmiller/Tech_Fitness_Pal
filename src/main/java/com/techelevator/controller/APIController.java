package com.techelevator.controller;

import java.io.IOException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.techelevator.model.MealData;
import com.techelevator.model.User;
import com.techelevator.model.DAO.JDBCMealDataDAO;
import com.techelevator.model.DAO.JDBCUserDAO;

@Controller
public class APIController {

	@Autowired
	public JDBCMealDataDAO jdbcMealDataDao;

	@Autowired
	public JDBCUserDAO jdbcUserDao;

	@RequestMapping(path = "/users/processResults", method = RequestMethod.POST)
	public String getUsersFood(@RequestParam String ingr, @RequestParam String mealtype, @RequestParam String mealDate,
			@RequestParam String userName) throws JsonProcessingException, IOException {
		String request = "https://api.edamam.com/api/food-database/parser?app_key="
				+ "c7efa543b821f668979d27dc872512c8&ingr=" + ingr + "&app_id=4902e829";
		try {
		HttpEntity<String> httpEntity = new HttpEntity<>(new HttpHeaders());
		RestTemplate restTemplate = new RestTemplate();
		ResponseEntity<String> response = restTemplate.exchange(request, HttpMethod.GET, httpEntity, String.class);
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(response.getBody());
		String calories = jsonNode.get("parsed").get(0).get("food").get("nutrients").get("ENERC_KCAL").toString();
		MealData apiData = new MealData();
		Double caloriesDouble = Double.parseDouble(calories);

		LocalDate date = LocalDate.of(Integer.parseInt(mealDate.substring(0, 4)),
				Integer.parseInt(mealDate.substring(5, 7)), Integer.parseInt(mealDate.substring(8)));

		apiData.setCalories(caloriesDouble);
		apiData.setIngr(ingr);
		apiData.setMealDate(date);
		apiData.setMealType(mealtype);

		System.out.println("username we are getting from the form: " + userName);

		User thisUser = (User) jdbcUserDao.getUserByUserName(userName);

		System.out.println("... and this is the ID we get back : " + thisUser.getUserId());
		apiData.setUserId(thisUser.getUserId());
		jdbcMealDataDao.addNewData(apiData);
		
		return "userHome";
		} catch(Exception e) {
		return "foodEntry";
		}
	}

	@RequestMapping(path = "/users/foodEntry", method = RequestMethod.GET)
	public String addNewFoodEntry() {
		return "foodEntry";
	}

}
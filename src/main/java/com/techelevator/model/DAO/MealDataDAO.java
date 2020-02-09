package com.techelevator.model.DAO;

import java.time.LocalDate;
import java.util.List;

import com.techelevator.model.MealData;

public interface MealDataDAO {

	public MealData addNewData(MealData mealData);
	
	public Double returnDailyCalorieTotal(LocalDate newMealDate, Long userID);
	
	public List<MealData> returnMealsByDate(MealData mealData);
	
	public List<MealData> returnMealByDateAndType(MealData mealData);
	
	public void updateMealDataIngredient(MealData mealData);
	
	public void updateMealDataDate(MealData mealData);
	
	public void deleteMealData(MealData mealData);
}

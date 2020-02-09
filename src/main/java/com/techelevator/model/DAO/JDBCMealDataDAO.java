package com.techelevator.model.DAO;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.MealData;

@Component
public class JDBCMealDataDAO implements MealDataDAO {

	private JdbcTemplate jdbcTemplate;
	@Autowired
	public JDBCMealDataDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public MealData addNewData(MealData mealData) {
		String newSqlRow = "INSERT INTO meal_data (ingr, calories, meal_type, meal_date, id)"
				+ "VALUES (?,?,?,?,?)";
		jdbcTemplate.update(newSqlRow, mealData.getIngr(), mealData.getCalories(), mealData.getMealType(), mealData.getMealDate(), mealData.getUserId());
		
		return mealData;
	}
	
	@Override
	public Double returnDailyCalorieTotal(LocalDate mealDate, Long userID) {
		String sqlDailyMealCal = "SELECT SUM(calories) AS calories FROM meal_data WHERE meal_date = ? AND id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlDailyMealCal, mealDate, userID);
		Double dailyCalories = 0.0;
		while (results.next()) {
			dailyCalories = results.getDouble("calories");	
		}
		return dailyCalories;
	} 

	@Override
	public List<MealData> returnMealsByDate(MealData mealData) {
		List<MealData> mealList = new ArrayList<>();
		String sqlAllMealData = "SELECT * FROM meal_data WHERE meal_date = ? AND id = ? GROUP BY meal_type";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlAllMealData, mealData.getMealDate(), mealData.getUserId());
		while (results.next()) {
			mealData.setMealId(results.getInt("meal_id"));
			mealData.setIngr(results.getString("ingr"));
			mealData.setCalories(results.getDouble("calories"));
			mealData.setMealType(results.getString("meal_type"));
			mealData.setMealDate(results.getDate("meal_date").toLocalDate());
			mealList.add(mealData);
		}
		return mealList;
	}

	@Override
	public List<MealData> returnMealByDateAndType(MealData mealData) {
		List<MealData> mealList = new ArrayList<>();
		String sqlAllMealData = "SELECT * FROM meal_data WHERE meal_date = ? AND meal_type = ? AND user_name = ? GROUP BY meal_type";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlAllMealData, mealData.getMealDate(), mealData.getMealType());
		while (results.next()) {
			mealData.setMealId(results.getInt("meal_id"));
			mealData.setIngr(results.getString("ingr"));
			mealData.setCalories(results.getDouble("calories"));
			mealData.setMealType(results.getString("category_label"));
			mealData.setMealDate(results.getDate("mealDate").toLocalDate());
			mealList.add(mealData);
		}
		return mealList;
	}

	@Override
	public void updateMealDataIngredient(MealData mealData) {
		jdbcTemplate.update("UPDATE meal_data SET ingr = ? WHERE id = ?", mealData.getIngr(), mealData.getUserId());
	}
	
	@Override
	public void updateMealDataDate(MealData mealData) {
		jdbcTemplate.update("UPDATE meal_data SET meal_Date = ? WHERE id = ?", mealData.getMealDate(), mealData.getUserId());
	}

	@Override
	public void deleteMealData(MealData mealData) {
		jdbcTemplate.update("DELETE * FROM meal_data WHERE ingr = ?, AND meal_Date = ? AND id = ?", mealData.getIngr(), mealData.getMealDate(), mealData.getUserId());

	}

}

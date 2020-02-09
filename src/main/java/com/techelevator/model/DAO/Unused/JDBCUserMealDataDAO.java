package com.techelevator.model.DAO.Unused;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.MealData;
import com.techelevator.model.User;

public class JDBCUserMealDataDAO implements UserMealDataDAO {

	private JdbcTemplate jdbcTemplate;
	MealData mealData = new MealData();
	User user = new User();
	
	@Autowired
	public JDBCUserMealDataDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void saveInfoKeys(User user, MealData mealData) {
		String newSqlRow = "INSERT INTO user_data(id, meal_id) VALUES (?,?)";
		jdbcTemplate.update(newSqlRow, user.getUserId(), mealData.getMealId());
	}
	
}

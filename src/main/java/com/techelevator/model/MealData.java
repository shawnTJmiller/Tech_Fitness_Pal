package com.techelevator.model;

import java.time.LocalDate;
import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

public class MealData {

	@NotBlank
	private int mealId;
	
	private String ingr;
	
	private Double calories;
	
	private String mealType;
	
	private LocalDate mealDate;
	
	private Long userId;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public MealData() {
		
	}

	public MealData(int mealId, String ingr, Double calories, String mealType, LocalDate mealDate) {
		super();
		this.mealId = mealId;
		this.ingr = ingr;
		this.calories = calories;
		this.mealType = mealType;
		this.mealDate = mealDate;
	}

	public int getMealId() {
		return mealId;
	}

	public void setMealId(int appId) {
		this.mealId = appId;
	}

	public String getIngr() {
		return ingr;
	}

	public void setIngr(String ingr) {
		this.ingr = ingr;
	}

	public Double getCalories() {
		return calories;
	}

	public void setCalories(Double calories) {
		this.calories = calories;
	}

	public String getMealType() {
		return mealType;
	}

	public void setMealType(String categoryLabel) {
		this.mealType = categoryLabel;
	}

	public LocalDate getMealDate() {
		return mealDate;
	}

	public void setMealDate(LocalDate mealDate) {
		this.mealDate = mealDate;
	}

}
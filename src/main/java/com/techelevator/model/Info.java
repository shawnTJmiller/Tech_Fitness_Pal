package com.techelevator.model;

import java.time.LocalDate;
import java.time.Period;
import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public class Info {

	@NotBlank
	private String userName;
	
	@NotBlank
	@Email(message="you must enter a valid email")
	private String email;
	
	@NotBlank
	private String firstName;
	
	@NotBlank
	private String lastName;
	
	@NotBlank
	private String gender;
	
	@NotBlank
	@DateTimeFormat
	private LocalDate birthDate;
	
	@NotBlank
	private Integer height;
	
	@NotBlank
	private Integer weight;
	
	private boolean loseWeight = false;
	private boolean maintainWeight = false;
	private boolean gainWeight = false;
	private int targetWeight;
	private int age;
	
	private String image;
	
	
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public LocalDate getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(LocalDate birthDate) {
		this.birthDate = birthDate;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public boolean isLoseWeight() {
		return loseWeight;
	}
	public void setLoseWeight(boolean loseWeight) {
		this.loseWeight = loseWeight;
	}
	public boolean isMaintainWeight() {
		return maintainWeight;
	}
	public void setMaintainWeight(boolean maintainWeight) {
		this.maintainWeight = maintainWeight;
	}
	public boolean isGainWeight() {
		return gainWeight;
	}
	public void setGainWeight(boolean gainWeight) {
		this.gainWeight = gainWeight;
	}
	public int getTargetWeight() {
		return targetWeight;
	}
	public void setTargetWeight(int targetWeight) {
		this.targetWeight = targetWeight;
	}
	
	public int getAge(LocalDate birthDate, LocalDate currentDate) {
			    // validate inputs ...
			    age = Period.between(birthDate, currentDate).getYears();
			    return age;
			}
	
}

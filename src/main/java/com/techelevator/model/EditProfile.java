package com.techelevator.model;

public class EditProfile {

	//goals, display name, birthday, current weight, password, profile picture
	
	
	private String goals; 
	private String displayName;
	private String birthDay;
	private String currentWeight;
	private String password;
	private String profilePhoto;
	
	public String getGoals() {
		return goals;
	}
	public void setGoals(String goals) {
		this.goals = goals;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}
	public String getCurrentWeight() {
		return currentWeight;
	}
	public void setCurrentWeight(String currentWeight) {
		this.currentWeight = currentWeight;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	
}

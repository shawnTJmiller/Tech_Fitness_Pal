package com.techelevator.model.DAO;

import java.util.List;

import com.techelevator.model.Info;

public interface InfoDAO {
	
	public Info addNewUserInfo(Info info);
	
	public Info bringUpUsersInfo(String userName);
	
	Info updateUsersInfo(Info info);
	
	public void deleteUserInfo(String userName);
	
}

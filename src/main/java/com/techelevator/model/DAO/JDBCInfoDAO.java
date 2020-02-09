package com.techelevator.model.DAO;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Info;

@Component
public class JDBCInfoDAO implements InfoDAO {
 
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public JDBCInfoDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Info addNewUserInfo(Info info) {
		String insertSql = "Insert Into info (user_name, email, first_name, last_name, gender, birthdate, height,"
				+ " weight, lose_wt, maintain_wt, gain_wt, target_wt, user_img) Values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(insertSql, info.getUserName(), info.getEmail(), info.getFirstName(), info.getLastName(),
				 info.getGender(), info.getBirthDate(), info.getHeight(), info.getWeight(), info.isLoseWeight(),
				  info.isMaintainWeight(), info.isGainWeight(), info.getTargetWeight(), info.getImage());
		return info;
	} 

	@Override
	public Info bringUpUsersInfo(String userName) {

		Info info = new Info();
		String sqlGetAllInfo = "Select * From info Where user_name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllInfo, userName);
		while (results.next()) {
			info.setUserName(results.getString("user_name"));
			info.setEmail(results.getString("email"));
			info.setFirstName(results.getString("first_name"));
			info.setLastName(results.getString("last_name"));
			info.setGender(results.getString("gender"));
			info.setBirthDate(results.getDate("birthdate").toLocalDate());
			info.setHeight(results.getInt("height"));
			info.setWeight(results.getInt("weight"));
			info.setLoseWeight(results.getBoolean("lose_wt"));
			info.setMaintainWeight(results.getBoolean("maintain_wt"));
			info.setGainWeight(results.getBoolean("gain_wt"));
			info.setTargetWeight(results.getInt("target_wt"));
			info.setImage(results.getString("user_img"));

		}
		return info;
	}

	@Override
	public Info updateUsersInfo(Info info) {
		String updateSql = "Update info Set email = ?, first_name = ?, last_name = ?, "
				+ "gender = ?, birthdate = ?, height = ?, weight = ?, lose_wt = ?, maintain_wt = ?, gain_wt = ?,"
				+ "target_wt = ? , user_img = ?"
				+ "Where user_name = ?";
		jdbcTemplate.update(updateSql, info.getEmail(), info.getFirstName(), info.getLastName(), info.getGender(), 
				info.getBirthDate(), info.getHeight(), info.getWeight(), info.isLoseWeight(), info.isGainWeight(),
				info.getTargetWeight(), info.getUserName(), info.getImage());
		return info;
	}

	@Override
	public void deleteUserInfo(String userName) {
		String insertSql = "Delete From info Where user_name = ?";
		jdbcTemplate.update(insertSql, userName);
		
	}
}

package control;

import java.sql.ResultSet;
import java.sql.SQLException;

import entity.User;
import mysql.DBBean;

public class UserControl {
	
	private String username;
	private User user = new User();
	private DBBean dbBean = new DBBean();
	
	public UserControl() {
		dbBean.setCon("bigproject");
	}
	
	public String login(String username, String password) {
		String loginState = "";
		try {
			ResultSet rSet = dbBean.select("users", "*", "WHERE username=" + "'" + username + "'");
			if(rSet.next()) {
				// Find username
				if(rSet.getString(3).equals(password)) {
					// Find password
					// login Successfully
					loginState = "0" + rSet.getString(4);
				} else {
					// Can't find password
					loginState = "2";
				}
			} else {
				// Can't find username
				loginState = "1";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			loginState = "3";
		}
		return loginState;
	}
	
	public boolean register(String username, String password, String usertype) {
		try {
			ResultSet rSet = dbBean.select("users", "username", 
					"WHERE username=" + "'" + username + "'");
			if(rSet.next()) {
				return false;
			} else {
				return dbBean.insert("users", "username, password, usertype", 
						"'" + username + "'" + ", " + "'" + password + "'" + ", " + "'" + usertype + "'");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	// Requirement: Only Government(whose usertype is 3) can use this function
	public boolean deleteUser(String company, String usertype) {
		return dbBean.delete("users", "WHERE company=" + "'" + company + "'" + "and usertype=" + "'" + usertype + "'");
	}

	public void setUser(String username) {
		this.username = username;
		ResultSet rSet = dbBean.select("users", "*", "WHERE username=" + "'" + username + "'");
		try {
			while(rSet.next()) {
				user.setUsername(rSet.getString(2));
				user.setPassword(rSet.getString(3));
				user.setUsertype(rSet.getString(4));
				user.setCompany(rSet.getString(5));
				user.setBarCode(rSet.getString(6));
				user.setAddress(rSet.getString(7));
				user.setRealname(rSet.getString(8));
				user.setTel(rSet.getString(9));
				user.setAsset(rSet.getString(10));
				user.setState(rSet.getString(11));
				user.setRegisterdate(rSet.getDate(12));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public User getUser() {
		return user;
	}
	
	// Change user's password
	// Return true if change successfully
	// or otherwise return false
	public boolean changePW(String username, String newpw) {
		return dbBean.update("users", "password", newpw, "WHERE username=" + "'" + username + "'");
	}
	
	// Change user's information
	// Return true if change successfully
	// or otherwise return false
	public boolean changeInfo(User user) {
		try {
			ResultSet rSet = dbBean.select("users", "*", "WHERE company=" + "'" + user.getCompany() + "'");
			rSet.last(); // Move to the last row
			if(rSet.getRow() > 1) {
				// Can not exist two company with the same name in the tables 
				// at the same time
				return false;
			}
			return dbBean.update("users", "company", "'" + user.getCompany() + "'"
					+ "," + "barCode=" + "'" + user.getBarCode() + "'"
					+ "," + "address=" + "'" + user.getAddress() + "'"
					+ "," + "realname=" + "'" + user.getRealname() + "'"
					+ "," + "tel=" + "'" + user.getTel() + "'"
					+ "," + "asset=" + "'" + user.getAsset() + "'"
					+ "," + "state=" + "'" + user.getState() + "'"
					, "WHERE username=" + "'" + user.getUsername() + "'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	/* Select user by usertype:
	/* @param pageNo The sequence number of page
	/* @param usertype The type of user
	 * @return An array of 5 data
	 */
	public String[][] getAllUser(int pageNo, String usertype) {
		String village[][] = new String[5][7]; // Select 5 data
		ResultSet rSet = dbBean.select("users", "*", "WHERE usertype=" + "'" + usertype + "'" + " LIMIT " + Integer.toString((pageNo - 1)*5) + ", 5");
		try {
			int i = 0;
			while(rSet.next()) {
				village[i][0] = rSet.getString(5); // Company
				village[i][1] = rSet.getString(7); // Address
				village[i][2] = rSet.getString(8); // Realname
				village[i][3] = rSet.getString(9); // Tel
				village[i][4] = rSet.getString(11); // State
				// Enterprise
				village[i][5] = rSet.getString(6); // BarCode
				village[i][6] = rSet.getString(10); // Asset
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return village;
	}
	
	/* @param usertype The type of user: village(1), enterprise(2)
	 * @return The numbers of users
	 */
	public int getUserCount(String usertype) {
		int count = 0;
		ResultSet rSet = dbBean.select("users", "*", "WHERE usertype=" + "'" + usertype + "'");
		try {
			rSet.last();
			count = rSet.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public void logout() {
		// Disconnect to the database
		dbBean.close();
	}
}

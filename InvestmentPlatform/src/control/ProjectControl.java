package control;

import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.DBBean;
import entity.Project;;

public class ProjectControl {
	
	private DBBean dbBean = new DBBean();
	
	public ProjectControl() {
		dbBean.setCon("bigproject");
	}
	
	/* Publish Project
	 * @param username The user whose usertype should be village
	 * @param project A project
	 * @return A boolean which is true when publish successfully
	 * 		or false otherwise
	 */
	public boolean publishProject(String username, Project project) {
		try {
			// Find if there is an existing project
			ResultSet rSet = dbBean.select("projects", "*", 
					"WHERE username=" + "'" + username + "'" + " and  projectname=" + "'" + project.getProjectname() + "'");
			if(rSet.next()) {
				return false;
			}
			return dbBean.insert("projects", 
					"projectname, username, village, address, realname, tel, state", 
					"'" + project.getProjectname() + "'" + ", " + 
					"'" + username + "'" + ", " + 
					"'" + project.getVillage() + "'" + ", " + 
					"'" + project.getAddress() + "'" + ", " + 
					"'" + project.getRealname() + "'" + "," + 
					"'" + project.getTel() + "'" + ", " + 
					"'" + project.getState() + "'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	// Delete Project
	public boolean deleteProject(String username, String projectName) {
		return dbBean.delete("projects", "WHERE username=" + "'" + username + "'" + "and projectName=" + "'" + projectName + "'");
	}
	
	/* Get the projects that the user published
	 * @param username A user whose usertype is village
	 * @param pageNo The sequence number of page which contains five data
	 * @return A two-dimensional array
	 */
	public String[][] getSelfProject(String username, int pageNo, int lastrow) {
		String[][] selfProject = new String[5][6];
		try {
			ResultSet rSet;
			if(lastrow < 5*pageNo) {
				rSet = dbBean.select("projects", "*", 
						"WHERE username=" + "'" + username + "'" + " LIMIT " + "0, " + Integer.toString(lastrow-5*pageNo+5));
			} else {
				rSet = dbBean.select("projects", "*", 
					"WHERE username=" + "'" + username + "'" + " LIMIT " + Integer.toString(lastrow-5*pageNo) + ", 5");
			}
			int i = 0;
			if(rSet.last()) {
				selfProject[i][0] = rSet.getString(2); // Projectname
				selfProject[i][1] = rSet.getString(4); // village
				selfProject[i][2] = username;
				selfProject[i][3] = rSet.getString(7); // Tel
				selfProject[i][4] = rSet.getString(5); // Address
				selfProject[i][5] = rSet.getString(8); // State
				i++;
			}
			while(rSet.previous()) {
				selfProject[i][0] = rSet.getString(2); // Projectname
				selfProject[i][1] = rSet.getString(4); // village
				selfProject[i][2] = username;
				selfProject[i][3] = rSet.getString(7); // Tel
				selfProject[i][4] = rSet.getString(5); // Address
				selfProject[i][5] = rSet.getString(8); // State
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selfProject;
	}
	
	/* Get the numbers of user's projects
	 * @param username The name of user
	 * @return The numbers of user's projects
	 */
	public int getSelfProjectCounts(String username) {
		int counts = 0;
		try {
			ResultSet rSet = dbBean.select("projects", "*", "WHERE username=" + "'" + username + "'");
			rSet.last();
			counts = rSet.getRow();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();		
		}
		return counts;
	}
	
	/* Get all the projects
	 * @param pageNo The sequence number of page which contains five data
	 * @return A two-dimensional array
	 */
	public String[][] getAllProject(int pageNo, int lastrow) {
		String[][] selfProject = new String[5][6];
		try {
			ResultSet rSet;
			if(lastrow < 5*pageNo) {
				rSet = dbBean.select("projects", "*", 
						"LIMIT " + "1, " + Integer.toString(lastrow-5*pageNo+5));
			} else {
				rSet = dbBean.select("projects", "*", 
					"LIMIT " + Integer.toString(lastrow-5*pageNo) + ", 5");
			}
			int i = 0;
			if(rSet.last()) {
				selfProject[i][0] = rSet.getString(2); // Projectname
				selfProject[i][1] = rSet.getString(4); // village
				selfProject[i][2] = rSet.getString(3); // Username
				selfProject[i][3] = rSet.getString(7); // Tel
				selfProject[i][4] = rSet.getString(5); // Address
				selfProject[i][5] = rSet.getString(8); // State
				i++;
			}
			while(rSet.previous()) {
				selfProject[i][0] = rSet.getString(2); // Projectname
				selfProject[i][1] = rSet.getString(4); // village
				selfProject[i][2] = rSet.getString(3); // Username
				selfProject[i][3] = rSet.getString(7); // Tel
				selfProject[i][4] = rSet.getString(5); // Address
				selfProject[i][5] = rSet.getString(8); // State
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selfProject;
	}
	
	/* Get the numbers of all the projects
	 * @return The numbers of projects
	 */
	public int getProjectCounts() {
		int counts = 0;
		try {
			ResultSet rSet = dbBean.select("projects", "*");
			rSet.last();
			counts = rSet.getRow();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();		
		}
		return counts;
	}
	
}

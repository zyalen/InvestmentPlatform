package mysql;
import java.sql.*;

public class DBBean {
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	boolean result = false;
	
	public DBBean() {
		// TODO Auto-generated constructor stub
	}
	
	public void setCon(String database) {
		// Connect to the database
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String url = "jdbc:mysql://localhost:3306/" + database 
					+ "?user=root&password=iloveyou.219&useUnicode=true&characterEncoding=utf-8";
			Connection connection = DriverManager.getConnection(url);
			this.conn = connection;
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public void close() {
		// Disconnect to the database
		try {
			if(rs != null) rs.close();
			if(st != null) st.close();
			if(conn != null) conn.close();
			result = false;
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// Following 4 function insert, select, update, delete
	// is to CRUD for the database
	
	/* Function insert
	 * @param table The table in the database
	 * @param column The columns in the table and 
	 * 		must be offered as the format "col1, col2, col3"
	 * @param values The values that want to be inserted and
	 * 		must be offered as the format "'A', 'B', 'C'"
	 * @return A boolean which is true when insert successfully
	 * 		or false otherwise
	*/
	public boolean insert(String table, String column, String values) {
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			st.executeUpdate("INSERT INTO " + table + "(" + column + ")" + " VALUES(" + values + ")");
			result = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	/* Function Retrieve 
	 * @param table Table in the database
	 * @param column Column must be in the table
	 * @param condition condition is optional with the format "WHERE ..."
	 * @return A set of result that contains the result after select from the table
	 */
	public ResultSet select(String table, String column, String condition) {
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = st.executeQuery("SELECT " + column + " FROM " + table + " " + condition);
		} catch (Exception e) {
			System.out.println(e);
		}
		return rs;
	}
	
	public ResultSet select(String table, String column) {
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = st.executeQuery("SELECT " + column + " FROM " + table);
		} catch (Exception e) {
			System.out.println(e);
		}
		return rs;
	}

	/* Function Update
	 * @param table Table in the database
	 * @param column Column must be in the table
	 * @param value Value is to update the old one
	 * @param condition Condition is optional with the format "WHERE ..."
	 * @return A boolean which is true when update successfully or
	 * 		false otherwise
	 */
	public boolean update(String table, String column, String value, String condition) {
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			System.out.print("test");
			st.executeUpdate("UPDATE " + table + " SET " + column + "=" + value + " " + condition);
			result = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public boolean update(String table, String column, String value) {
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			st.executeUpdate("UPDATE " + table + " SET " + column + "=" + "'" + value + "'");
			result = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	/* Function Delete
	 * @param table Table in the database
	 * @param condition Condition is optional with the format "WHERE ..."
	 * @return A boolean which is true when delete successfully or
	 * 		false otherwise
	 */
	public boolean delete(String table, String condition) {
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			st.executeUpdate("DELETE FROM " + table + " " + condition);
			result = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public boolean delete(String table) {
		try {
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			st.executeUpdate("DELETE FROM " + table);
			result = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
}

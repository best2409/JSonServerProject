package exam.member;

import java.sql.*;

public class DBControl {
	private String dbUrl = "jdbc:mysql://localhost:3306/spring";
	private Connection con;
	private PreparedStatement pstmt;
	
	public DBControl() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbUrl, "root", "spring1234");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Connection");
		} catch(SQLException e) {
			System.out.println("SQL");
		}
	}
	
	public void insertMember(String userName, String userPwd, String userEmail) {
		String sql = "insert into members values(?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userEmail);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

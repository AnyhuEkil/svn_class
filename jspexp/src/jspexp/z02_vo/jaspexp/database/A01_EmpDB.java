package jaspexp.database;

import java.sql.*;

public class A01_EmpDB {
	// field 선언
	// 1. Connection con : 연결 객체
	// 2. Statement stmt : 대화
	//    PreStatement pstmt
	// 3. ResultSet rs; : 결과
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 연결처리한 메서드
	public void setConn() throws ClassNotFoundException, SQLException{
		// 1. driver 메모리에 올리기
		// 2. DriverManager.getConnection(url, id, pass)
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// db 드라이버 종류(thin)@ip:port:sid
		String conInfo = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(conInfo, "scott", "tiger");
		System.out.println("정상 접속 성공");

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A01_EmpDB db = new A01_EmpDB();
		
		try{
			db.setConn();
		}catch(ClassNotFoundException e){
			
		}catch(SQLException e){
			
		}
		
	}

}

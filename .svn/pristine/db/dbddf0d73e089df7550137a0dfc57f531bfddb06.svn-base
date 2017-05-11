package jspexp.z01_database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jspexp.z02_vo.Emp;
import jspexp.z02_vo.Student;

public class A02_StudentDB {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public ArrayList<Student> stuList(){
		ArrayList<Student> list = new ArrayList<Student>();
		try {
			con=A00_DB.conn();
			stmt=con.createStatement();
			String sql="SELECT * FROM STUDENT ";
			rs = stmt.executeQuery(sql);
			Student stu=null; 
			while(rs.next()){
				stu = new Student();
				stu.setName(rs.getString("name"));			
				stu.setGrade(rs.getInt("grade"));
				stu.setSect(rs.getInt("sect"));
				stu.setKor(rs.getInt("kor"));
				stu.setEng(rs.getInt("eng"));
				stu.setMath(rs.getInt("math"));
				list.add(stu);		
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
			// 자원 해제
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();	
				if(con!=null)con.close();				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}	
	public static void main(String args[]){
		System.out.println(new A02_StudentDB().stuList().size());
	}
}

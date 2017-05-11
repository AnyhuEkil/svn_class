<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspexp.z02_vo.Student, java.util.ArrayList, java.sql.*"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{ width:500px; margin: 20px auto; background-color: white; }
table th { background-color: #706207; padding: 10px; text-align: center;}
table td { background-color: #D9CC77; padding: 10px; text-align: center; }
table caption{padding: 5px 5px 10px;  color: #706207;}
table input[type=button] {padding:10px;}
</style>
</head>
<body>
<%
	String searchName = request.getParameter("searchName");
	String sql = String.format("select * from student where name='%s'",searchName);
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	ArrayList<Student> studentList = new ArrayList<Student>();
	Student student = null;
	try {
		Class.forName(driver); // 1. 드라이버로드
		conn = DriverManager.getConnection(url,"scott","tiger");//2. DB연결
		stmt = conn.createStatement(); // 3. sql 처리 기본 객체생성
		rs = stmt.executeQuery(sql);// 4. sql문 전송 5. 결과값 받기
		
		while(rs.next()){
			String name = rs.getString("name");
			int hakno = rs.getInt("hakno");
			int classno = rs.getInt("classno");
			int kor = rs.getInt("kor");
			int eng = rs.getInt("eng");
			int mat = rs.getInt("mat");
			student = new Student(name, hakno, classno, kor, eng, mat);
			studentList.add(student);
		}
	} catch (ClassNotFoundException e) {
		System.out.println("드라이버예외"+e.getMessage());
	} catch (SQLException e) {
		System.out.println("DB 연결"+e.getMessage());
	} finally {			// 6. 연결 해제
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			System.out.println("닫기예외:"+e.getMessage());
		}
	}
%>
	<table>
		<caption>학생 명단</caption>	
		<tr><th>이름</th><th>학년</th><th>반</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th></tr>
		<%if(!studentList.isEmpty()){
			for(Student s : studentList){%>
			<tr><td><%=s.getName()%></td><td><%=s.getHakno()%></td><td><%=s.getClassno()%></td>
			<td><%=s.getKor()%></td><td><%=s.getEng()%></td><td><%=s.getMat()%></td><td><%=s.getTot()%></td></tr>		
		<% 	}
		}else{%>
			<tr><td colspan="7">데이터가 한개도 없습니다</td></tr>
		<%}%>
		<tr><td colspan="7"><button onclick="location='a02_student.jsp'">돌아가기</button></td></tr>
	</table>
</body>
</html>
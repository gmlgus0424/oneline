<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page import = "java.sql.*" %>
   <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%


String url = "jdbc:mysql://localhost/oneline?characterEncoding=UTF-8&serverTimezone=UTC";
String user = "root";
String passwd = "1234";
Connection con = null;
String sql="select * from oneline";
PreparedStatement pstmt = null;


Class.forName("com.mysql.cj.jdbc.Driver");

con = DriverManager.getConnection(url, user, passwd);

pstmt = con.prepareStatement(sql);
ResultSet rs= pstmt.executeQuery(); //select
while(rs.next()) {
	int no = rs.getInt(1);
	String memo = rs.getString("memo");
	String wdate = rs.getString(3);
	
	out.print("일련번호"+no + ":"+memo+":("+ wdate+")<br>");
	
}
rs.close();
pstmt.close();
con.close();
System.out.println("DB조회 성공");

response.sendRedirect("http://localhost:8080/oneline/memo01.html"); 

%>
</body>
</html>
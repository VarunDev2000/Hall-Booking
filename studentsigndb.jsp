<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Refresh" content="1;url='student.html'" />
        <title>STUDENT SIGN-IN</title>

    </head>
    <body>
        <%
	  String name = request.getParameter("name");
          String uname = request.getParameter("uname");
          String pass = request.getParameter("password");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
        
		ResultSet rs = st.executeQuery("select * from student where u_name='"+uname+"' ");
		
				
		if (rs.next() == false) {
			
			st.executeUpdate("insert into student(name,u_name,password)values('"+name+"','"+uname+"','"+pass+"')");
		
			out.println("Sign-in successful");	
		}
		else
		{
			out.println("Username Already Exists!!");	
		}

		
	}
	catch(Exception e)
	{
		out.println("Some problem occured");
	}
%>
    </body>
</html>



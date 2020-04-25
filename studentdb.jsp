<%-- 
    Document   : studentdb
    Created on : 24/04/2020, 8:46:57 PM
    Author     : ADMIN
--%>

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
    </head>
    <body>
        <%
          String uname = request.getParameter("uname");
          String pass = request.getParameter("pass");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
                
 
	    ResultSet rs = st.executeQuery("select * from student where u_name='"+uname+"' and password ='"+pass+"' ");
		
		if (rs.next() == false) {
			out.print("Invalid Login or Password");
		}
		else
		{
			Integer student_id = rs.getInt("student_id");
			ResultSet rs1 = st.executeQuery("select * from course_enrolled where student_id='"+student_id+"' ");
			
			if(rs1.next() == false)
			{
				session.setAttribute("enrolled","false"); 
			}
			else{
				session.setAttribute("enrolled","true"); 
			}
			
			session.setAttribute("user_id",student_id);  
			response.sendRedirect("studentindex.jsp");
		}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
    </body>
</html>



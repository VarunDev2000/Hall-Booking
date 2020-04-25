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
        <title>STAFF LOGIN</title>
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
                
 
	    ResultSet rs = st.executeQuery("select * from staff where u_name='"+uname+"' and password ='"+pass+"' ");
		
				
		if (rs.next() == false) {
			out.print("Invalid Login or Password");
		}
		else
		{
			Integer staff_id = rs.getInt("staff_id");
			
			session.setAttribute("s_user_id",staff_id);  
			response.sendRedirect("staffindex.jsp");
		}
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
    </body>
</html>


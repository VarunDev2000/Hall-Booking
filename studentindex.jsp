<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% if((Integer)session.getAttribute("user_id") != null) 
{
%>
<jsp:include page="header.html" /> 
<%  

if((String)session.getAttribute("enrolled") == "false")
{
try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		
                
	    ResultSet rs = st.executeQuery("select * from course");
%>
<center>
<h1>ENROLLMENT</h1><br/>
<form method="POST" action="enrollment.jsp">
<%
		while(rs.next()){

			String course_id = Integer.toString(rs.getInt("course_id"));
			
			ResultSet staff1 = st1.executeQuery("select * from staff where staff_id='"+ rs.getInt("staff_id1") +"' ");
			staff1.absolute(1);  
			String staff1_name = staff1.getString("name");
			Integer staff1_id = staff1.getInt("staff_id");
			
			ResultSet staff2 = st2.executeQuery("select * from staff where staff_id='"+ rs.getInt("staff_id2") +"' ");
			staff2.absolute(1);
			String staff2_name = staff2.getString("name");
			Integer staff2_id = staff2.getInt("staff_id");
%>

			<h4><%= rs.getString("course_name") %></h4>
			
			<input type="radio" name=<%= course_id %> value=<%= staff1_id %> checked><%= staff1_name %><br/>
			<input type="radio" name=<%= course_id %> value=<%= staff2_id %> ><%= staff2_name %><br/>

<%
		}
%>
<br/><br/>
<input type="submit" value="Enroll"/>
</form>
</center>
<%
	}
	catch(Exception e)
	{
		out.println(e);
	}
} 
else
{
%>
<html>
<head>        
<title>Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>

<center>
<br/>
<h1>STUDENT DASHBOARD<h1>
<form action="viewtimetable.jsp">
<input type="submit" value="My Timetable">
</form>
<br/>
<form action="report.jsp">
<input type="submit" value="Generate HallTicket">
</form>
</center>

</body>
</html>
<%
}
}

else
{
	out.print("Cannot Access Page!!");
}
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<% if((Integer)session.getAttribute("s_user_id") != null) 
{
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Refresh" content="2;url='staffindex.jsp'" />
        <title>HALL BOOKING</title>
    </head>
<body>
	
<%
		String day = request.getParameter("day");
        String hour = request.getParameter("hour");
		String hall_no = request.getParameter("hall_no");
		String course_id = request.getParameter("course");
		String typeofclass = request.getParameter("type");
		
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
              
		Integer staff_id = (Integer)session.getAttribute("s_user_id");
 
	    st.executeUpdate("insert into timetable(day,hour,hall_no,course_id,staff_id,type) values('"+day+"','"+hour+"','"+hall_no+"','"+course_id+"','"+staff_id+"','"+typeofclass+"')");
		
		out.println("Hall booked successfully");
		
	}
	catch(Exception e)
	{
		out.println("Some problem occured");
	}
%>	
	
</body>
</html>

<%
}
else{
out.print("Cannot Access this page!!");
}
%>


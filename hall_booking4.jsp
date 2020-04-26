<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/message/css/msg.css">


<% if((Integer)session.getAttribute("s_user_id") != null) 
{
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Refresh" content="1;url='viewtimetable_staff.jsp'" />
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
		
		out.print("<div class='msuccess logout_msg'>Hall Booked Successfully</div>");
		
	}
	catch(Exception e)
	{
		out.print("<div class='merror'>Some problem occured.Try Again Later</div>");
	}
%>	
	
</body>
</html>

<%
}
else{
out.print("<div class='merror'>Cannot Access this page</div>");
out.print("<br/><br/><center><a style='color:blue;' href='index.html'>Home</a></center>");
}
%>



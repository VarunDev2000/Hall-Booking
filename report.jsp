<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="styles/message/css/msg.css">


<% if((Integer)session.getAttribute("user_id") != null) 
{
	
if((String)session.getAttribute("enrolled") != "false")
{
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hall Ticket Generation</title>
</head>
<body>

<table border=3>
<tr>
<th>S.No</th>
<th>COURSE</th>
<th>STAFF</th>
<th>HALL NO</th>
<th>TIME</th>
</tr>

<%
	response.setContentType("application/vnd.ms-excel");
	response.setHeader("Content-Disposition","inline; filename="+"HallTicket.xls");

	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		
		Statement st3 = con.createStatement();
              
		Integer student_id = (Integer)session.getAttribute("user_id");
		Integer i = 0;
		
		List<String> d = new ArrayList<String>();
		d.add("Monday");
		d.add("Tuesday");
		d.add("Wednesday");
		d.add("Thursday");
		d.add("Friday");
 
	    ResultSet rs3 = st3.executeQuery("select * from course_enrolled where student_id='"+student_id+"'");
		
		out.print("Exam Hall Ticket <br/>");
		
		while(rs3.next())
		{
			Integer sc_id = rs3.getInt("course_id");
			Integer ss_id = rs3.getInt("staff_id");
			
			ResultSet rs= st.executeQuery("select * from timetable where course_id='"+sc_id+"' and staff_id ='"+ss_id+"' and type='Exam' ");
		
			while(rs.next()){
				
				ResultSet course1 = st1.executeQuery("select * from course where course_id='"+ rs.getInt("course_id") +"' ");
				ResultSet staff1 = st2.executeQuery("select * from staff where staff_id='"+ rs.getInt("staff_id") +"' ");
				
				course1.absolute(1); 
				staff1.absolute(1); 			
				String course_name = course1.getString("course_name");
				String staff_name = staff1.getString("name");
				
				i++;
				
				out.print("<tr>");
				out.println("<td>"+i+"</td>");
				out.println("<td>"+course_name+"</td>");
				out.println("<td>"+staff_name+"</td>");
				out.println("<td>"+String.valueOf(rs.getInt("hall_no"))+"</td>");
				out.println("<td>"+d.get(rs.getInt("day")-1)+", "+"hour "+String.valueOf(rs.getInt("hour"))+"</td>");
				out.println("</tr>");
				
			}
		}
				
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
%>

</table>
</body>
</html>

<%
}
else{
out.print("<div class='mwarning'>You are not enrolled in any course.Complete Enrollment to download your HallTicket</div>");
out.print("<br/><br/><center><a style='color:blue;' href='studentindex.jsp'>Enroll Now</a></center>");
}

}
else{
out.print("<div class='merror'>Cannot Access this page</div>");
out.print("<br/><br/><center><a style='color:blue;' href='index.html'>Home</a></center>");
}
%>

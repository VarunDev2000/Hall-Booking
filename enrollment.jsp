<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="styles/message/css/msg.css">


<% if((Integer)session.getAttribute("user_id") != null) 
{
if((String)session.getAttribute("enrolled") == "false")
{
%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Refresh" content="2;url='studentindex.jsp'" />
    </head>
    <body>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
		Statement insert_st = con.createStatement();
                
 
	    ResultSet rs = st.executeQuery("select * from course");
		
		Integer student_id = (Integer)session.getAttribute("user_id");
		
		while(rs.next()){
			String course_id = Integer.toString(rs.getInt("course_id"));
			
			String enrolled_staff_id = request.getParameter(course_id);
			
			insert_st.executeUpdate("insert into course_enrolled(student_id,course_id,staff_id) values('"+student_id+"','"+course_id+"','"+enrolled_staff_id+"')");
		}
		session.setAttribute("enrolled","true");
		
		out.print("<center><div class='msuccess ens_msg'>Enrollment Successful</div><br/><br/><h4 style='color:red;'>This page will redirect in 2 seconds..</h4></center>");
	}
	catch(Exception e)
	{
		out.print("<div class='merror'>Cannot Access this page	</div>");
	}
%>
    </body>
</html>
<%
}
}
else
{
out.print("<div class='merror'>Cannot Access this page</div>");
out.print("<br/><br/><center><a style='color:blue;' href='index.html'>Home</a></center>");
}
%>


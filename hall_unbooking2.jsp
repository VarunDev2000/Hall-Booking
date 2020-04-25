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
		<meta http-equiv="Refresh" content="1;url='hall_unbooking1.jsp'" />
        <title>HALL UNBOOKING</title>

    </head>
<body>

<%
	String f_value = request.getParameter("f_value");
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
                
		StringTokenizer tok = new StringTokenizer(f_value,",");
		
		Integer day = Integer.parseInt(tok.nextToken());
		Integer hour = Integer.parseInt(tok.nextToken());
		Integer hall_no = Integer.parseInt(tok.nextToken());
		Integer course_id = Integer.parseInt(tok.nextToken());
		Integer staff_id = (Integer)session.getAttribute("s_user_id");
		String typeofclass =tok.nextToken();
		
		st.executeUpdate("delete from timetable where day='"+day+"' and hour='"+hour+"' and hall_no='"+hall_no+"' and course_id='"+course_id+"' and staff_id='"+staff_id+"' and type='"+typeofclass+"' ");
		
		out.println("Hall Unbooked!!");	
		
		
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



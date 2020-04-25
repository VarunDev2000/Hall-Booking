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
<jsp:include page="staff_header.html" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HALL BOOKING</title>
    </head>
<body>
	
<%
		String day = String.valueOf(request.getParameter("day"));
		
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
              
		Integer staff_id = (Integer)session.getAttribute("s_user_id");
 
	    ResultSet rs = st.executeQuery("select * from timetable where day='"+day+"' and staff_id='"+staff_id+"' ");
		
		List<Integer> hours = new ArrayList<Integer>();  
		hours.add(1);  
		hours.add(2);  
		hours.add(3);  
		hours.add(4); 
		
		while(rs.next())
		{	
			hours.removeAll(Arrays.asList(rs.getInt("hour")));
		}
	Integer size = hours.size();	
%>	
	
<center>

<form action="hall_booking3.jsp" method="POST">
<input name="day" type="hidden" value=<%=day %> >

<%
if(size == 0)
{
	out.print("<p>No Hours Available in this day</p>");
}
else
{
%>

<b>Available Hours </b>
&nbsp&nbsp
<select name="hour" style="width:20%;padding:3px">
<% 		
for(Integer h : hours) {
%>

<option value=<%= h%> ><%= h%></option>

<%
}
%>
</select>

<br/><br/><br/>
<INPUT type="submit" value="Next">
<%
}
%>
</form>

</center>
<%
		
	}
	catch(Exception e)
	{
		out.println(e);
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



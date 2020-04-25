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
        String hour = String.valueOf(request.getParameter("hour"));
		
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
              
		Integer staff_id = (Integer)session.getAttribute("s_user_id");
 
	    ResultSet rs = st.executeQuery("select * from timetable where day='"+day+"' and hour='"+hour+"' ");
		ResultSet rs1 = st1.executeQuery("select * from course where staff_id1='"+staff_id+"' or staff_id2='"+staff_id+"' ");
		
		List<Integer> halls = new ArrayList<Integer>();  
		halls.add(1);  
		halls.add(2);  
		halls.add(3);  
		halls.add(4); 
		
		while(rs.next())
		{	
			halls.removeAll(Arrays.asList(rs.getInt("hall_no")));
		}
		
		Integer size = halls.size();
		
%>	
	
<center>

<form action="hall_booking4.jsp" method="POST">

<%
if(size == 0)
{
	out.print("<p>No Halls Available</p>");
}
else
{
%>

<b>Available Halls </b>
&nbsp;&nbsp;
<select name="hall_no" style="width:12%;padding:3px">

<% 		
for(Integer h : halls) {
%>

<option value=<%= h%> ><%= h%></option>

<%
}
%>

</select>
<input name="day" type="hidden" value=<%=day %> >
<input name="hour" type="hidden" value=<%=hour %>>
<br/><br/>

<b>Course</b>
&nbsp;&nbsp;
<select name="course" style="width:20%;padding:3px">
<%
while(rs1.next())
{
%>
<option value=<%=rs1.getInt("course_id")%> ><%=rs1.getString("course_name") %></option>
<%
}
%>
</select>
<br/><br/>

<b>Type</b>
&nbsp;&nbsp;
<select name="type" style="width:12%;padding:3px">
<option value="Lecture">Lecture</option>
<option value="Exam">Exam</option>
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



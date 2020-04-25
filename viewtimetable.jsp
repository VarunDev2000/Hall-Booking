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
if((String)session.getAttribute("enrolled") != "false")
{
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<style>
		.dot1 {
		  height: 15px;
		  width: 15px;
		  background-color: green;
		  border-radius: 50%;
		  display: inline-block;
		}
		
		.dot2 {
		  height: 15px;
		  width: 15px;
		  background-color: orange;
		  border-radius: 50%;
		  display: inline-block;
		}
		
		td{
			padding:10px;
		}
		</style>

    </head>
    <body>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hall_booking?serverTimezone=UTC","root","");
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		
		Statement st3 = con.createStatement();
              
		Integer student_id = (Integer)session.getAttribute("user_id");
 
	    ResultSet rs3 = st3.executeQuery("select * from course_enrolled where student_id='"+student_id+"'");
		
		String c_course[][] = new String[6][5];
		String c_hallno[][] = new String[6][5];
		String c_type[][] = new String[6][5];
		String c_staff[][] = new String[6][5];
		
		String c[][] = new String[6][5];
		
		for(Integer i = 0;i<6;i++)
		{
			for(Integer j=0;j<5;j++)
			{
				c_course[i][j] = "";
				c_staff[i][j] = "";
				c_hallno[i][j] = "";
				c_type[i][j] = "";
				
				c[i][j] = "";
			}
		}
		
		
		while(rs3.next())
		{
			Integer sc_id = rs3.getInt("course_id");
			Integer ss_id = rs3.getInt("staff_id");
			
			ResultSet rs= st.executeQuery("select * from timetable where course_id='"+sc_id+"' and staff_id ='"+ss_id+"' ");
		
		
			while(rs.next()){
				
				ResultSet course1 = st1.executeQuery("select * from course where course_id='"+ rs.getInt("course_id") +"' ");
				ResultSet staff1 = st2.executeQuery("select * from staff where staff_id='"+ rs.getInt("staff_id") +"' ");
				
				course1.absolute(1); 
				staff1.absolute(1); 			
				String course_name = course1.getString("course_name");
				String staff_name = staff1.getString("name");
				
				c_course[rs.getInt("day")][rs.getInt("hour")] = course_name;
				c_staff[rs.getInt("day")][rs.getInt("hour")] = staff_name;
				c_hallno[rs.getInt("day")][rs.getInt("hour")] = Integer.toString(rs.getInt("hall_no"));
				
				if(rs.getString("type").equals("Lecture"))
					c_type[rs.getInt("day")][rs.getInt("hour")] = "background-color:green";
				else if(rs.getString("type").equals("Exam"))
					c_type[rs.getInt("day")][rs.getInt("hour")] = "background-color:orange";
				else
					c_type[rs.getInt("day")][rs.getInt("hour")] = "color:black";
				
				c[rs.getInt("day")][rs.getInt("hour")] = c_course[rs.getInt("day")][rs.getInt("hour")]+" - "+c_staff[rs.getInt("day")][rs.getInt("hour")]+" ("+c_hallno[rs.getInt("day")][rs.getInt("hour")]+")";
			}
		}
%>
<center>

<table style="width:90%;;table-layout: fixed;" border="2">
  <tr>
    <th style="color:red">Day/Hour</th>
    <th>1</th>
    <th>2</th>
	<th>3</th>
	<th>4</th>
  </tr>
  <tr>
    <td><b>MONDAY</b></td>
    <td style=<%= c_type[1][1]%>><%= c[1][1] %></td>
    <td style=<%= c_type[1][2]%>><%= c[1][2] %></td>
	<td style=<%= c_type[1][3]%>><%= c[1][3] %></td>
	<td style=<%= c_type[1][4]%>><%= c[1][4] %></td>
  </tr>
  <tr>
    <td><b>TUESDAY</b></td>
    <td style=<%= c_type[2][1]%> ><%= c[2][1] %></td>
    <td style=<%= c_type[2][2]%> ><%= c[2][2] %></td>
	<td style=<%= c_type[2][3]%> ><%= c[2][3] %></td>
	<td style=<%= c_type[2][4]%> ><%= c[2][4] %></td>
  </tr>
    <tr>
    <td><b>WEDNESDAY</b></td>
    <td style=<%= c_type[3][1]%>><%= c[3][1] %></td>
    <td style=<%= c_type[3][2]%>><%= c[3][2] %></td>
	<td style=<%= c_type[3][3]%>><%= c[3][3] %></td>
	<td style=<%= c_type[3][4]%>><%= c[3][4] %></td>
  </tr>
    <tr>
    <td><b>THURSDAY</b></td>
    <td style=<%= c_type[4][1]%>><%= c[4][1] %></td>
    <td style=<%= c_type[4][2]%>><%= c[4][2] %></td>
	<td style=<%= c_type[4][3]%>><%= c[4][3] %></td>
	<td style=<%= c_type[4][4]%>><%= c[4][4] %></td>
  </tr>
    <tr>
    <td><b>FRIDAY</b></td>
    <td style=<%= c_type[5][1]%>><%= c[5][1] %></td>
    <td style=<%= c_type[5][2]%>><%= c[5][2] %></td>
	<td style=<%= c_type[5][3]%>><%= c[5][3] %></td>
	<td style=<%= c_type[5][4]%>><%= c[5][4] %></td>
  </tr>
</table>

<br/><br/>

<span class="dot1"></span> Lecture
&nbsp;&nbsp;&nbsp;&nbsp;
<span class="dot2"></span> Exam <br/>
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
	out.print("Please do Enrollment First");
}
}
else{
	out.print("Cannot access page");
}
%>

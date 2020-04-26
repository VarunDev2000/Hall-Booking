<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if((Integer)session.getAttribute("user_id") != null) 
{
%>
<!doctype html>

<html class="no-js" lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dashboard</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="styles/dashboard/vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/dashboard/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="styles/dashboard/vendors/themify-icons/css/themify-icons.css">
    <link rel="stylesheet" href="styles/dashboard/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="styles/dashboard/vendors/selectFX/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="styles/dashboard/vendors/jqvmap/dist/jqvmap.min.css">


    <link rel="stylesheet" href="styles/dashboard/assets/css/style.css">
	<link rel="stylesheet" href="styles/dashboard/assets/css/style1.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>


	<style>

	</style>
</head>

<body>

<div id="right-panel" class="right-panel">

<jsp:include page="header.html" /> 

<%  
if((String)session.getAttribute("enrolled") != "false")
{
%>

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

<div class="breadcrumbs">
	<div class="col-sm-12">
		<div class="page-header float-center">
			<div class="page-title" align="center">
				<h1>TIMETABLE</h1>
				<br/>
			</div>
		</div>
	</div>
</div>

<center>

<table class="table" id="student_tt">
  <thead class="thead-dark">
    <th style="color:red">Day/Hour</th>
    <th scope="col">1</th>
    <th scope="col">2</th>
	<th scope="col">3</th>
	<th scope="col">4</th>
  </thead>
  <tbody>
  <tr>
    <th scope="row"><b>MONDAY</b></td>
    <td style=<%= c_type[1][1]%>><%= c[1][1] %></td>
    <td style=<%= c_type[1][2]%>><%= c[1][2] %></td>
	<td style=<%= c_type[1][3]%>><%= c[1][3] %></td>
	<td style=<%= c_type[1][4]%>><%= c[1][4] %></td>
  </tr>
  <tr>
    <th scope="row"><b>TUESDAY</b></td>
    <td style=<%= c_type[2][1]%> ><%= c[2][1] %></td>
    <td style=<%= c_type[2][2]%> ><%= c[2][2] %></td>
	<td style=<%= c_type[2][3]%> ><%= c[2][3] %></td>
	<td style=<%= c_type[2][4]%> ><%= c[2][4] %></td>
  </tr>
    <tr>
    <th scope="row"><b>WEDNESDAY</b></td>
    <td style=<%= c_type[3][1]%>><%= c[3][1] %></td>
    <td style=<%= c_type[3][2]%>><%= c[3][2] %></td>
	<td style=<%= c_type[3][3]%>><%= c[3][3] %></td>
	<td style=<%= c_type[3][4]%>><%= c[3][4] %></td>
  </tr>
    <tr>
    <th scope="row"><b>THURSDAY</b></td>
    <td style=<%= c_type[4][1]%>><%= c[4][1] %></td>
    <td style=<%= c_type[4][2]%>><%= c[4][2] %></td>
	<td style=<%= c_type[4][3]%>><%= c[4][3] %></td>
	<td style=<%= c_type[4][4]%>><%= c[4][4] %></td>
  </tr>
    <tr>
    <th scope="row"><b>FRIDAY</b></td>
    <td style=<%= c_type[5][1]%>><%= c[5][1] %></td>
    <td style=<%= c_type[5][2]%>><%= c[5][2] %></td>
	<td style=<%= c_type[5][3]%>><%= c[5][3] %></td>
	<td style=<%= c_type[5][4]%>><%= c[5][4] %></td>
  </tr>
  </tbody>
</table>
<br/>


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
	
}
else{
	out.print("Please do Enrollment First");
}
%>

</div>

<script src="vendors/jquery/dist/jquery.min.js"></script>
<script src="vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>


<script src="vendors/chart.js/dist/Chart.bundle.min.js"></script>
<script src="assets/js/dashboard.js"></script>
<script src="assets/js/widgets.js"></script>
<script src="vendors/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<script src="vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script>
(function($) {
	"use strict";

	jQuery('#vmap').vectorMap({
		map: 'world_en',
		backgroundColor: null,
		color: '#ffffff',
		hoverOpacity: 0.7,
		selectedColor: '#1de9b6',
		enableZoom: true,
		showTooltip: true,
		values: sample_data,
		scaleColors: ['#1de9b6', '#03a9f5'],
		normalizeFunction: 'polynomial'
	});
})(jQuery);
</script>

</body>
</html>

<%
}
else{
	out.print("Cannot access page");
}
%>

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
<div class="enrollment_form"align="left">
<form method="POST" action="enrollment.jsp" >
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

			<h4 class="course_name"><%= rs.getString("course_name") %></h4>
			<hr/>
			<table id="staffs">
			
			<tr>
			<td>
			<input type="radio" name=<%= course_id %> value=<%= staff1_id %> checked>&nbsp&nbsp<%= staff1_name %>
			</td>
			</tr>
			
			<tr>
			<td>
			<input type="radio" name=<%= course_id %> value=<%= staff2_id %> >&nbsp&nbsp<%= staff2_name %>
			</td>
			</tr>
			
			</table>
			<br/><br/>

<%
		}
%>
<br/><br/>
<input type="submit" value="Enroll" class="btn btn-success"/>
</form>
</div>
<br/>
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

<div class="breadcrumbs">
	<div class="col-sm-12">
		<div class="page-header float-center">
			<div class="page-title" align="center">
				<h1>DASHBOARD</h1>
				<br/>
			</div>
		</div>
	</div>
</div>

<div class="content mt-3">

	<div class="col-sm-12 col-lg-12">
	<center>
	
		<div class="card text-white bg-flat-color-1" >
		<a href="viewtimetable.jsp">
			<div class="card-body pb-0">
				<i class="fa fa-list"></i>
				<h3 class="dash_btns">MY TIMETABLE</h3>
			</div>
		</a>
		</div>
		
	</center>
	<br/><br/>
	</div>

	<div class="col-sm-12 col-lg-12">
	<center>
	
		<div class="card text-white bg-flat-color-3">
		<a href="report.jsp">
			<div class="card-body pb-0">
				<i class="fa fa-address-card"></i>
				<h3 class="dash_btns">GENERATE HALLTICKET</h3>
			</div>
		</a>
		</div>
		
	</center>
	</a>
	</div>
   

</div>
<%
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

else
{
	out.print("Cannot Access Page!!");
}
%>
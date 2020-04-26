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

<html class="no-js" lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hall Booking</title>
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
	<link rel="stylesheet" href="styles/dashboard/assets/css/dropdown.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>


	<style>
	.right-panel header.header{
	background:#4CAF50 !important;
	}
	</style>
	
</head>

<body>

<div id="right-panel" class="right-panel">

<jsp:include page="staff_header.html" />

	
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


<br/>
<div style="width:25%;">
<form action="hall_booking3.jsp" method="POST">


<%
if(size == 0)
{
	out.print("	<div class='merror'>No Hours Available in this day</div>");
	out.print("<br/><br/><a style='color:blue;' href='hall_booking1.jsp'>Back</a>");
}
else
{
%>

<b>AVAILABLE HOURS</b>
<br/><hr/>
<div class="select-box">
    <div class="select-box__current" tabindex="1">


<input name="day" type="hidden" value=<%=day %> >


<div class="select-box__value"><input class="select-box__input" type="radio" id=<%= hours.get(0)%> value=<%= hours.get(0)%> name="hour" checked="checked"  />
	<p class="select-box__input-text dropdown_p"><%= hours.get(0)%></p>
</div>

<% 		
for(Integer h : hours) {
%>

<div class="select-box__value"><input class="select-box__input" type="radio" id=<%= h%> value=<%= h%> name="hour"  />
	<p class="select-box__input-text dropdown_p"><%= h%></p>
</div>

<%
}
%>

		<img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true" />
	</div>
	
	<ul class="select-box__list">
		<% 		
		for(Integer h : hours) {
		%>

		<li><label class="select-box__option dropdown_p" for=<%= h%> aria-hidden="aria-hidden"><%= h%></label></li>

		<%
		}
		%>
    </ul>
	
</div>

<br/><br/><br/>
<INPUT type="submit" value="Next >>" class="btn btn-info booking_btn">
<%
}
%>

</form>
</div>


</center>
<%
		
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>

</div>

<script src="styles/dashboard/vendors/jquery/dist/jquery.min.js"></script>
<script src="styles/dashboard/vendors/popper.js/dist/umd/popper.min.js"></script>
<script src="styles/dashboard/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="styles/dashboard/assets/js/main.js"></script>


<script src="styles/dashboard/vendors/chart.js/dist/Chart.bundle.min.js"></script>
<script src="styles/dashboard/assets/js/dashboard.js"></script>
<script src="styles/dashboard/assets/js/widgets.js"></script>
<script src="styles/dashboard/vendors/jqvmap/dist/jquery.vmap.min.js"></script>
<script src="styles/dashboard/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<script src="styles/dashboard/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
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
out.print("<div class='merror'>Cannot Access this page</div>");
out.print("<br/><br/><center><a style='color:blue;' href='index.html'>Home</a></center>");
}
%>



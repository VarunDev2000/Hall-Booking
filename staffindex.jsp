
<% if((Integer)session.getAttribute("s_user_id") != null) 
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
	.right-panel header.header{
	background:#ff4d4d  !important;
	}
	
	.bg-flat-color-4{
		background-color:#ffa64d !important;
	}
	</style>
</head>

<body>

<div id="right-panel" class="right-panel">

<jsp:include page="staff_header.html" /> 



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
		<a href="viewtimetable_staff.jsp">
			<div class="card-body pb-0">
				<i class="fa fa-list"></i>
				<h3 class="dash_btns">MY TIMETABLE</h3>
			</div>
		</a>
		</div>
		
	</center>
	</div>

	<div class="col-sm-12 col-lg-12">
	<center>
	
		<div class="card text-white bg-flat-color-3">
		<a href="hall_booking1.jsp">
			<div class="card-body pb-0">
				<i class="fa fa-check"></i>
				<h3 class="dash_btns">BOOK HALL</h3>
			</div>
		</a>
		</div>
		
	</center>
	</a>
	</div>
	
	
	<div class="col-sm-12 col-lg-12">
	<center>
	
		<div class="card text-white bg-flat-color-4">
		<a href="hall_unbooking1.jsp">
			<div class="card-body pb-0">
				<i class="fa fa-remove"></i>
				<h3 class="dash_btns">UNBOOK HALL</h3>
			</div>
		</a>
		</div>
		
	</center>
	</div>
   

</div>
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
</html


<%
}
else{
out.print("Cannot Access this page!!");
}
%>
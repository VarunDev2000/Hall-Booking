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

	
<center>

<br/>
<div style="width:25%;">
<form action="hall_booking2.jsp" method="POST">
<b>SELECT  DAY</b>
<br/><hr/>

<div class="select-box">
    <div class="select-box__current" tabindex="1">
        <div class="select-box__value"><input class="select-box__input" type="radio" id="0" value="1" name="day" checked="checked" />
            <p class="select-box__input-text dropdown_p">Monday</p>
        </div>
        <div class="select-box__value"><input class="select-box__input" type="radio" id="1" value="2" name="day" />
            <p class="select-box__input-text dropdown_p">Tuesday</p>
        </div>
        <div class="select-box__value"><input class="select-box__input" type="radio" id="2" value="3" name="day" />
            <p class="select-box__input-text dropdown_p">Wednesday</p>
        </div>
        <div class="select-box__value"><input class="select-box__input" type="radio" id="3" value="4" name="day" />
            <p class="select-box__input-text dropdown_p">Thursday</p>
        </div>
        <div class="select-box__value"><input class="select-box__input" type="radio" id="4" value="5" name="day"  />
            <p class="select-box__input-text dropdown_p">Friday</p>
        </div><img class="select-box__icon" src="http://cdn.onlinewebfonts.com/svg/img_295694.svg" alt="Arrow Icon" aria-hidden="true" /></div>
    <ul class="select-box__list">
        <li><label class="select-box__option dropdown_p" for="0" aria-hidden="aria-hidden">Monday</label></li>
        <li><label class="select-box__option dropdown_p" for="1" aria-hidden="aria-hidden">Tuesday</label></li>
        <li><label class="select-box__option dropdown_p" for="2" aria-hidden="aria-hidden">Wednesday</label></li>
        <li><label class="select-box__option dropdown_p" for="3" aria-hidden="aria-hidden">Thursday</label></li>
        <li><label class="select-box__option dropdown_p" for="4" aria-hidden="aria-hidden">Friday</label></li>
    </ul>
</div>


<br/><br/><br/>

<input type="submit" value="Next >>" class="btn btn-info booking_btn">

</form>
</div>

</center>


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



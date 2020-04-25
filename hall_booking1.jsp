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
	
	
<center>

<form action="hall_booking2.jsp" method="POST">
<b>Day </b>
&nbsp&nbsp
<select name="day" style="width:20%;padding:3px">
<option value="1">Monday</option>
<option value="2">Tuesday</option>
<option value="3">Wednesday</option>
<option value="4">Thursday</option>
<option value="5">Friday</option>
</select>

<br/><br/><br/>

<input type="submit" value="Next">

</form>

</center>
</body>
</html>

<%
}
else{
out.print("Cannot Access this page!!");
}
%>



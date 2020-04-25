
<% if((Integer)session.getAttribute("s_user_id") != null) 
{
%>
<jsp:include page="staff_header.html" /> 

<!DOCTYPE html>

<html>
<head></head>
<body>
<center>
<br/>
<h1>STAFF DASHBOARD<h1>
<br/>
<form action="viewtimetable_staff.jsp">
<input type="submit" value="My Timetable">
</form>
<br/>
<form action="hall_booking1.jsp">
<input type="submit" value="Book Hall">
</form>
<form action="hall_unbooking1.jsp">
<input type="submit" value="UnBook Hall">
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
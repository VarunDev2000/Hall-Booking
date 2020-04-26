<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Refresh" content="1;url='student.html'" />
		<link rel="stylesheet" href="styles/message/css/msg.css">
    </head>
    <body>

<%
session.setAttribute("user_id",null);  
out.print("<div class='msuccess logout_msg'>Successfully Logged Out</div>");
%>

    </body>
</html>
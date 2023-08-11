<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Online Medical Appointment System</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body >
<div id="wrapper">
	<div id="header" style="width:100%;background:#8a00c2">
		<div id="logo">
			<h3><font size="6" color="white">Online Medical Appointment System</font></h3>
		</div>
		<div id="slogan">
			<h4><font size="3" color="white">Appointments made easy..</font></h4>
		</div>
	</div>
	<div id="menu" style="width:100%;background:#ca5cdd">
		<ul id = "ulist" style="width:900px;padding: 0 4.5% 0 0;">
			<li class="active"><a href="CreateDoctor.jsp" >Add Doctor</a></li>
<li><a href="DeleteDoctor.jsp" >Delete Doctor</a></li>
<li><a href="AddFAQ.jsp" >Add FAQ</a></li>
<li><a href="DeleteFAQ.jsp" >Delete FAQ</a></li>
<li><a href="CheckLeaveRequestPage.jsp" >View Leave Request</a></li>
<li><a href="index.jsp" >SignOut</a></li>
			
		</ul>
		
	</div>
	<br/>
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></font></b>");
	}%>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>

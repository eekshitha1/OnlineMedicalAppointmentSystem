<%@page import="health.Database"%>
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
				<h3>
					<font size="6" color="white">Online Medical Appointment System</font>
				</h3>
			</div>
			<div id="slogan">
			<h4><font size="3" color="white">Appointments made easy..</font></h4>
			</div>
			
		</div>
		<div id="menu" style="width:100%;background:#ca5cdd">
			<ul id = "ulist" style="width:900px;padding: 0 4.5% 0 0;">
				<li class="active"><a href="DiseaseTypesPage.jsp" >View Disease
						Categories</a></li>
				<li class="active"><a href="AppointmentStatusPage.jsp" >Check Appointment
						Status</a></li>
				<li class="active"><a href="ViewLabs.jsp" >View
						Labs</a></li>
				<li class="active"><a href="CheckPharmacyPage.jsp" >View Pharmacy</a></li>
				<li><a href="index.jsp" >SignOut</a></li>

			</ul>
			<br/><br/><br/><br/><br/><br/><br/><br/><br/>
		</div>
		<%
		String result = request.getParameter("t1");
		if (result != null) {
			out.println("<center><b><font face=sans-serif color=black>" + result + "</center></b></font>");
		}
		%>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>

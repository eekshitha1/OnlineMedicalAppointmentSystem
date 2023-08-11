<%@page import="health.Database"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Online Medical Appointment System</title>

<link rel="stylesheet" type="text/css" href="style.css" />

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
</head>
<body >
<div id="wrapper">
	<div id="header" style="width:100%;background:#8a00c2">
		<div id="logo">
			<h3><font size="5" color="white">Online Medical Appointment System</font></h3>
		</div>
		<div id="slogan">
			<h4><font size="3" color="white">Appointments made easy..</font></h4>
		</div>
	</div>
	<div id="menu" style="width:100%;background:#ca5cdd">
		<ul id = "ulist" style="width:900px;padding: 0 4.5% 0 0;">
			<li class="active"><a href="DiseaseTypesPage.jsp" >View Disease Categories</a></li>
			<li class="active"><a href="AppointmentStatusPage.jsp" >Check Appointment Status</a></li>
			<li class="active"><a href="ViewLabs.jsp" >View Labs</a></li>
			<li class="active"><a href="CheckPharmacyPage.jsp" >View Pharmacy</a></li>
			<li><a href="index.jsp" >SignOut</a></li>
			
		</ul>
			
					
				</div>
			
			<center>
<form name="f1" method="post" action="ViewLabsListPage.jsp" onsubmit="return checkFields(this);"><br/>
   <h2><b>View Available Laboratories</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=sans-serif color=red>"+res+"</center></font>");
	}%>
						
						<table align="center" width="40" >
	
	<tr><td><font  color="black">Select&nbsp;Lab&nbsp;Service</b></td>
		<td>
									<select id="labService" name="labService">
									<%
									//String doctor = session.getAttribute("uname").toString();
									Connection dbcon = Database.connectionDriver();
									Statement s = dbcon.createStatement();
									ResultSet rs = s.executeQuery("select lab_serv_name, lab_serv_id from lab_service");
									while (rs.next()) {
									%>
									
										<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
										<%} s.close(); rs.close(); %>
										
		</select></td></tr>
	     
			<tr><td></td><td><input type="submit" value="Get Laboratory List">
			</td>
			</table>
			<div id="responseDiv">
				</div>	
					
				</div>
				
	</body>
</html>
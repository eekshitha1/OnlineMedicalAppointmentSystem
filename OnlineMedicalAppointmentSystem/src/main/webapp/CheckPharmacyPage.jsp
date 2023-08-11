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
			<h3><font size="6" color="white">Online Medical Appointment System</font></h3>
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
<form name="f1" method="post" action="CheckPharmacyListPage.jsp" onsubmit="return checkFields(this);"><br/>
   <h2><b>View Available Pharmacies</b></h2>
   
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
						
						<table align="center" width="40" >
	
	<tr><td><font color="black">Select&nbsp;medicine</b></td>
		<td>
									<select id="medicine" name="medicine">
									<%
									//String doctor = session.getAttribute("uname").toString();
									Connection dbcon = Database.connectionDriver();
									Statement s = dbcon.createStatement();
									ResultSet rs = s.executeQuery("select med_name, med_id from medicine");
									while (rs.next()) {
									%>
									
										<option value="<%=rs.getString(2)%>"><%=rs.getString(1)%></option>
										<%} s.close(); rs.close(); %>
										
		</select></td></tr>
	     
			<tr><td></td><td><input type="submit" value="Get Pharmacy List">
			</td>
			</table>
			<div id="responseDiv">
				</div>	
					
				</div>
				
	</body>
</html>
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
			<br/>
			<br/>
			<center>
<form name="f1" method="post" action="ViewDiseaseTypesPage.jsp" onsubmit="return checkFields(this);"><br/>
<%
String medicine_Id = request.getParameter("medicine");
String medicine_Name = "";
Connection dbcon = Database.connectionDriver();
Statement s=dbcon.createStatement();
ResultSet rs = s.executeQuery("select med_name from medicine where med_id="+medicine_Id);
if(rs.next()) {
	medicine_Name = rs.getString(1);
}

%>
   <h2><b>Available Pharmacies for "<%=medicine_Name %>"</b></h2>
   
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
						
						<table border="1" align="center" width="100%" >
			 
         <tr>
		 <th><font  color="black">Pharmacy ID</th>
		 <th><font  color="black">Pharmacy Name</th>
		 <th><font  color="black">Pharmacy Address</th>
		</tr>
		 
		 <%
		ResultSet rs2 = s.executeQuery("select distinct(p.phar_id), p.phar_name,p.phar_loc from pharmacy p, medicine_pharmacy pm where pm.phar_id = p.phar_id and pm.med_id="+medicine_Id+" order by p.phar_id");
		while(rs2.next()){
			%>
		<tr>
		<td><font  color="black"><%=rs2.getString(1)%></td>
		<td><font  color="black"><%=rs2.getString(2)%></td>
		<td><font  color="black"><%=rs2.getString(3)%></td>
		</tr>
	<%}dbcon.close(); //dbconnect2.close();%>
</table>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/>			
				</div>
				
	</body>
</html>
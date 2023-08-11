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
			<br/>
   <h2><b>Prescription Page</b></h2>
   
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
	
						
						<table align="center" width="60" >
	<tr><td><font  color="black">Appointment&nbsp;ID</b></td><td><%=request.getParameter("id")%><input type="hidden" name="t1" size="20" value="<%=request.getParameter("id")%>" readonly/></td></tr>
    
	<tr><td><font  color="black">Prescription&nbsp;Details</b></td><td></tr>
	Lab Prescription

<table id="labServiceTable" border="1" align="center" width="50%">
			<tr>
				<th>Lab Tests Prescribed</th>
			</tr>
			<%
		//String doctor  = session.getAttribute("uname").toString();
		String aId1 = request.getParameter("id");
		Connection dbcon = Database.connectionDriver();
		Statement s=dbcon.createStatement();
		ResultSet rs1=s.executeQuery("select ls.lab_serv_name "+
				"from lab_prescription_service lp, lab_service ls "+
				"where lp.lab_serv_id=ls.lab_serv_id and lp.lab_pres_id = (select lab_pres_id "+
							"from lab_prescription where a_id="+aId1+" order by lab_pres_id desc limit 1) ");
		while(rs1.next()){
			%>
			<tr>
				<td><%=rs1.getString(1)%></td>
			</tr>
			<%} s.close(); dbcon.close();%>
		</table>
		Medicines

		<table id="medicineTable" border="1" align="center" width="50%">
			<tr>
				<th>Medicine Names Prescribed</th>
			</tr>
			<%
		//String doctor  = session.getAttribute("uname").toString();
		String aId = request.getParameter("id");
		Connection dbcon1 = Database.connectionDriver();
		Statement s1=dbcon1.createStatement();
		ResultSet rs=s1.executeQuery("select m.med_name "+
				"from prescription_medicine pm, medicine m "+
				"where pm.med_id=m.med_id and pm.pres_id = (select pres_id "+
							"from prescription where a_id="+aId+" order by pres_id desc limit 1) ");
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
			</tr>
			<%} s1.close(); dbcon1.close();%>
		</table>
		
		Joining Prescription
		<table id="medicineTable" border="1" align="center" width="50%">
			<tr>
				<th>Description of Joining</th>
				<th>Approx. No. of Days</th>
			</tr>
			<%
		//String doctor  = session.getAttribute("uname").toString();
		String aId2 = request.getParameter("id");
		Connection dbcon2 = Database.connectionDriver();
		Statement s2=dbcon2.createStatement();
		ResultSet rs2=s2.executeQuery("select join_desc, approx_days from joining where a_id="+aId2+" order by join_presc_id");
		while(rs2.next()){
			%>
			<tr>
				<td><%= rs2.getString(1) %></td>
				<td><%= rs2.getInt(2) %></td>
			</tr>
			<%} s2.close(); rs2.close();%>
		</table>

	</div>
         
			</table>
				</div>


</body>
</html>
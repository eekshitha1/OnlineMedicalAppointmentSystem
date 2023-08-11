<%@page import="health.Database"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Online Medical Appointment System</title>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
	
</script>

</head>
<body >

	<div id="wrapper">
		<div id="header" style="width: 100%; background: #8a00c2">
			<div id="logo">
				<h3>
					<font size="6" color="white">Online Medical Appointment System</font>
				</h3>
			</div>
			<div id="slogan"></div>
			<h4><font size="3" color="white">Appointments made easy..</font></h4>
		</div>
		<div id="menu" style="width: 100%; background: #ca5cdd">
			<ul id="ulist" style="width: 900px; padding: 0 4.5% 0 0;">
				<li class="active"><a href="DiseaseTypesPage.jsp">View Disease Categories</a></li>
				<li class="active"><a href="AppointmentStatusPage.jsp">Check Appointment Status</a></li>
				<li class="active"><a href="ViewLabs.jsp">View Labs</a></li>
				<li class="active"><a href="CheckPharmacyPage.jsp">View Pharmacy</a></li>
				
				<li><a href="index.jsp">SignOut</a></li>

			</ul>
			
		</div>

		<center>
		<br />
		<h2>
			<b>Billing Page</b>
		</h2>

		<%
		String result = request.getParameter("t1");
		if (result != null) {
			out.println("<center><b><font face=sans-serif color=red>" + result + "</center></b></font>");
		}
		%>


		<table align="center" width="60">
			<tr>
				<td><font color="black">Appointment&nbsp;ID</b></td>
				<td><%=request.getParameter("id")%><input type="hidden"
					name="t1" size="20" value="<%=request.getParameter("id")%>"
					readonly /></td>
			</tr>

			<tr>
				<td><font  color="black">Bill&nbsp;Details</b></td>
				<td>
			</tr>
			<tr>
				<td>
					<div id="xyz">
						Lab Bill

						<table id="labServiceTable" border="1" align="center" width="100%">
							<tr>
								<th>Lab Test</th>
								<th>Cost</th>
							</tr>
							<%
							//String doctor  = session.getAttribute("uname").toString();
							String aId1 = request.getParameter("id");
							Connection dbcon1 = Database.connectionDriver();
							Statement st1 = dbcon1.createStatement();
							ResultSet rs1 = st1.executeQuery("select ls.lab_serv_name, ls.lab_serv_cost "
									+ "from lab_prescription_service lp, lab_service ls "
									+ "where lp.lab_serv_id=ls.lab_serv_id and lp.lab_pres_id = (select lab_pres_id "
									+ "from lab_prescription where a_id=" + aId1 + " order by lab_pres_id desc limit 1) ");
							while (rs1.next()) {
							%>
							<tr>
								<td><%=rs1.getString(1)%></td>
								<td><%=rs1.getString(2)%></td>
							</tr>
							<%}%>
							<tr>
								<td>Total Cost</td>
								<%
								ResultSet rs3 = st1.executeQuery("select sum(ls.lab_serv_cost) as total_cost "
										+ "from lab_prescription_service lp, lab_service ls "
										+ "where lp.lab_serv_id=ls.lab_serv_id and lp.lab_pres_id = (select lab_pres_id "
										+ "from lab_prescription where a_id=" + aId1 + " order by lab_pres_id desc limit 1);");
								while (rs3.next()) {
								%>

								<td><%=rs3.getString(1)%></td>
								<%
								}
								%>
							</tr>
						</table>


						Medicines Bill

						<table id="medicineTable" border="1" align="center" width="100%">
							<tr>
								<th>Medicine Name</th>
								<th>Cost</th>
							</tr>
							<%
							//String doctor  = session.getAttribute("uname").toString();
							String aptId = request.getParameter("id");
							Connection dbconnect = Database.connectionDriver();
							Statement s = dbconnect.createStatement();
							ResultSet rs = s.executeQuery("select m.med_name, m.med_cost " + "from prescription_medicine pm, medicine m "
									+ "where pm.med_id=m.med_id and pm.pres_id = (select pres_id "
									+ "from prescription where a_id=" + aptId + " order by pres_id desc limit 1) ");
							while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString(1)%></td>
								<td><%=rs.getString(2)%></td>
							</tr>
							<%}%>
							<tr>
								<td>Total Cost</td>
								<%
								ResultSet rs2 = s
										.executeQuery("select sum(m.med_cost) as total_cost " + "from prescription_medicine pm, medicine m "
										+ "where pm.med_id=m.med_id and pm.pres_id = (select pres_id "
										+ "from prescription where a_id=" + aptId + " order by pres_id desc limit 1);");
								while (rs2.next()) {
								%>
								<td><%=rs2.getString(1)%></td>
								<%}
				%>
							</tr>
						</table>

					</div>
				</td>
			</tr>

		</table>
	
	</div>
</body>
</html>
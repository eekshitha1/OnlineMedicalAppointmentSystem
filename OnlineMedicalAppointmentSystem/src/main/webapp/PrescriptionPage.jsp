<%@page import="health.Database"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Online Medical Appointment System</title>

<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script language="javascript">

	function validateFields(f)
	{
		debugger;
	if(f.t3.value.length==0)
	{
	alert("Provide disease description");
	f.t3.focus();
	return false;
	}
	if(f.t4.value.length==0)
	{
	alert("Select appointment slot");
	f.t4.focus();
	return false;
	}
	return true;
	}
	</script>
	<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>

<script type="text/javascript">
$(document).ready(function() {
});

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
				<li class="active"><a href="ViewAppointmentsPage.jsp" >View
						Appointments</a></li>
				<li><a href="LeaveApplyPage.jsp" >Apply for Leave</a></li>
				<li><a href="CheckLeaveStatusPage.jsp" >View Leave Status</a></li>
				<li><a href="index.jsp" >SignOut</a></li>

			</ul>
			
		</div>
		<center>
		
			<br />
			<h2>
				<b>Prescription Page</b>
			</h2>
		</center>
			<%
			String result = request.getParameter("t1");
			if (result != null) {
				out.println("<center><b><font face=sans-serif color=black>" + result + "</center></b></font>");
			}
			%>


			<table align="center" width="60">
				<tr>
					<td><font  color="black">Appointment&nbsp;ID</b></td>
					<td><%= request.getParameter("id") %> </td>
				</tr>

				<tr>
					<td><font  color="black">Prescription&nbsp;Details</b></td>
					<td></td>
				</tr>
				<tr>
					<td>
						<div id="xyz">
								<b>Lab Prescription</b>
								
								<form name="f1" method="post" action="LabPrescription" onsubmit="return validateFields(this);">
								<input type="hidden" name="appointment_id" size="20" value="<%=request.getParameter("id")%>" readonly />
							<table id="labServiceTable" border="1" align="center"
								width="100%">
								<tr>
									<th>Medicine Name</th>
									<th>Select</th>
								</tr>
								<%
								String doctor1 = session.getAttribute("uname").toString();
								Connection dbcon1 = Database.connectionDriver();
								Statement st1 = dbcon1.createStatement();
								ResultSet rs1 = st1.executeQuery("select lab_serv_name, lab_serv_id from lab_service");
								while (rs1.next()) {
								%>
								<tr>
									<td><%=rs1.getString(1)%></td>
									<td><input type="checkbox" name="<%=rs1.getString(1)%>"
										value="<%=rs1.getString(2)%>" /></td>
								</tr>
								<%
								} rs1.close(); st1.close(); dbcon1.close();
								%>
								<tr>
									<td></td>
									 <td><input type="submit" value="Submit" /></td> 
								</tr>
							</table>

						</form>

								<b>Medicines Prescription</b>
								<form name="f2" method="post" action="Prescription" onsubmit="return validateFields(this);">
								<input type="hidden" name="appointment_id" size="20" value="<%=request.getParameter("id")%>" readonly />
								<table id="medicineTable" border="1" align="center" width="100%">
									<tr>
										<th>Medicine Name</th>
										<th>Select</th>
									</tr>
									<%
									String doctor = session.getAttribute("uname").toString();
									Connection dbcon = Database.connectionDriver();
									Statement s = dbcon.createStatement();
									ResultSet rs = s.executeQuery("select med_name, med_id from medicine");
									while (rs.next()) {
									%>
									<tr>
										<td><%=rs.getString(1)%></td>
										<td><input type="checkbox" name="<%=rs.getString(1)%>"
											value="<%=rs.getString(2)%>" /></td>
									</tr>
									
									<%
									} rs.close(); s.close(); dbcon.close();
									%>
									<tr>
										<td></td>
									 	<td><input type="submit" value="Submit" /></td> 
									</tr>
								</table>
								</form>
								<b>Joining Prescription(Home/Hospital)</b>
						<form name="f3" method="post" action="JoiningPrescription" onsubmit="return validateFields(this);">
							<input type="hidden" name="appointment_id" size="20" value="<%=request.getParameter("id")%>" readonly />
							<table align="center" width="40">
								<tr>
									<td><font  color="black">Joining Description</b></td>
									<td><input type="text" name="joining_description" size="50"/></td>
								</tr>

								<tr>
									<td><font  color="black">Approx. No. of Days</b></td>
									<td><input type="text" name="approx_days" size="15"/></td>
								</tr>


								<tr>
									<td></td>
									<td><input type="submit" value="Submit"></td>
							</table>
						</form>

					</div>
					</td>
				</tr>

				<tr>
					<td></td>
					
				</tr>
			</table>
	</div>

</body>
</html>
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

<script>

</script>
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
			<li class="active"><a href="ViewAppointmentsPage.jsp" >View Appointments</a></li>
<li><a href="LeaveApplyPage.jsp" >Apply Leave</a></li>
<li><a href="CheckLeaveStatusPage.jsp" >View Leave Status</a></li>
<li><a href="index.jsp" >SignOut</a></li>
			
		</ul>
		
	</div>
	<br/>
	<br/>
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=red>"+result+"</center></b></font>");
	}%>
	<table border="1" align="center" width="100%" >
			 
         <tr>
		 <th><font  color="black">Appointment ID</th>
		 <th><font  color="black">Doctor Name</th>
		 <th><font  color="black">Patient Name</th>
		 <th><font  color="black">Disease Description</th>
		 <th><font  color="black">Appointment Slot Time</th>
		 <th><font  color="black">Booking Date</th>
		 <th><font  color="black">Status</th>
		<th><font  color="black">Accept Appointment</th>
		 <th><font  color="black">Reject Appointment</th>
		<th><font  color="black">Write Prescription</th>
		
		</tr>
		 
		 <%
		String doctor_name  = session.getAttribute("uname").toString();
		Connection dbcon = Database.connectionDriver();
		Statement s=dbcon.createStatement();
		ResultSet rs=s.executeQuery("select * from appointment where doc_uname='"+doctor_name+"'");
		while(rs.next()){
			
			%>
		
		<tr><td><font  color="black"><%=rs.getString(1)%></td>
		<td><font  color="black"><%=rs.getString(7)%></td>
		<td><font  color="black"><%=rs.getString(6)%></td>
		<td><font  color="black"><%=rs.getString(5)%></td>
		<td><font  color="black"><%=rs.getString(2)%></td>
		<td><font  color="black"><%=rs.getString(3)%></td>
		<td><font  color="black"><%=rs.getString(4)%></td>
		<%if(rs.getString(4).equals("pending")) {%>			
		<td><a href="AcceptRejectAppointment?id=<%=rs.getString(1)%>&status=Accepted"><font color="black">Click Here</font></a></td>
		<td><a href="AcceptRejectAppointment?id=<%=rs.getString(1)%>&status=Rejected"><font color="black">Click Here</font></a></td>
	<%} else if(rs.getString(4).equals("Accepted")){%>
				<td><font  color="black"><%="--"%></td>
				<td><font  color="black"><%="--"%></td>
				<td><a href="PrescriptionPage.jsp?id=<%=rs.getString(1)%>"><font  color="black">Click Here</font></a></td>
		<%}else if(!rs.getString(4).equals("Accepted") && !rs.getString(4).equals("Rejected")  && !rs.getString(4).equals("pending")){%>
		<td><font color="black"><%="Visited"%></td>
		<td><font color="black"><%="Visited"%></td>
		<td><font color="black"><%="Visited"%></td>
		<%}}%>
</p>
</table>
</body>
</html>
	
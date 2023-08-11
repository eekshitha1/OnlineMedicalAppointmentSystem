<%@page import="health.Database"%>
<%@page import="java.sql.*"%>

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
			<li class="active"><a href="DiseaseTypesPage.jsp" >View Disease Categories</a></li>
			<li class="active"><a href="AppointmentStatusPage.jsp" >Check Appointment Status</a></li>
			<li class="active"><a href="ViewLabs.jsp" >View Labs</a></li>
			<li class="active"><a href="CheckPharmacyPage.jsp" >View Pharmacy</a></li>
			<li><a href="index.jsp" >SignOut</a></li>
			
		</ul>
		
	</div>
	<br/>
	<br/>
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
	<table border="1" align="center" width="100%" >
			 
         <tr>
		 <th><font  color="black">First Name</th>
		 <th><font color="black">Last Name</th>
		 <th><font color="black">Mobile No</th>
		 <th><font color="black">Email ID</th>
		 <th><font color="black">Qualification & Experience</th>
		 <th><font color="black">Speciality</th>
		 <th><font color="black">Appointment Fee</th>
		 <th><font color="black">Book Appointment</th>
		</tr>
		 
		 <%
		 String disease  = request.getParameter("speciality");
		Connection dbcon = Database.connectionDriver();
		Statement st=dbcon.createStatement();
		//ResultSet rs=st.executeQuery("select first_name,last_name,contact_no,email,details,speciality,username from doctor where speciality='"+disease+"'");
		ResultSet rs = st.executeQuery("select d.doc_fname,d.doc_lname,d.doc_phnno,d.doc_email,d.doc_info,i.illness_type_name,d.doc_uname from doctor d, illness_type i where d.illness_type_id=i.illness_type_id and i.illness_type_name='"+disease+"'");
		while(rs.next()){
			
			%>
		
		<tr><td><font color="black"><%=rs.getString(1)%></td>
		<td><font  color="black"><%=rs.getString(2)%></td>
		<td><font color="black"><%=rs.getString(3)%></td>
		<td><font color="black"><%=rs.getString(4)%></td>
		<td><font color="black"><%=rs.getString(5)%></td>
		<td><font color="black"><%=rs.getString(6)%></td>
		<td><font color="black"><%="1000"%></td>
		
		<td><a href="AppointmentBookPage.jsp?id=<%=rs.getString(7)%>"><font color="black">Click Here</font></a></td>
	<%}%>
</p>
</table>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>
	
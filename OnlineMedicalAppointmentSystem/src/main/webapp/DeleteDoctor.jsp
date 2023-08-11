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
			<li class="active"><a href="CreateDoctor.jsp" >Add Doctor</a></li>
<li><a href="DeleteDoctor.jsp" >Delete Doctor</a></li>
<li><a href="AddFAQ.jsp" >Add FAQ</a></li>
<li><a href="DeleteFAQ.jsp" >Delete FAQ</a></li>
<li><a href="CheckLeaveRequestPage.jsp" >View Leave Request</a></li>
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
		 <th><font  color="black">Last Name</th>
		 <th><font  color="black">Mobile No</th>
		 <th><font  color="black">Email ID</th>
		 <th><font  color="black">Address</th>
		 <th><font  color="black">Qualification & Experience</th>
		 <th><font  color="black">Speciality</th>
		 <th><font  color="black">Username</th>
		 <th><font  color="black">Password</th>
		 <th><font  color="black">User Type</th>
		 <th><font  color="black">Delete Doctor</th>
		</tr>
		 
		 <%
		Connection dbcon = Database.connectionDriver();
		Statement s=dbcon.createStatement();
		ResultSet rs=s.executeQuery("select d.doc_fname,d.doc_lname,d.doc_phnno,d.doc_email,d.doc_address,d.doc_info,i.illness_type_name,d.doc_uname,d.doc_pwd,d.doc_utype "+    
				"from doctor d, illness_type i "+
				"where d.illness_type_id=i.illness_type_id");
		while(rs.next()){
			
			%>
		
		<tr><td><font  color="black"><%=rs.getString(1)%></td>
		<td><font  color="black"><%=rs.getString(2)%></td>
		<td><font  color="black"><%=rs.getString(3)%></td>
		<td><font  color="black"><%=rs.getString(4)%></td>
		<td><font  color="black"><%=rs.getString(5)%></td>
		<td><font  color="black"><%=rs.getString(6)%></td>
		<td><font  color="black"><%=rs.getString(7)%></td>
		<td><font  color="black"><%=rs.getString(8)%></td>
		<td><font  color="black"><%=rs.getString(9)%></td>
		<td><font  color="black"><%=rs.getString(10)%></td>
		<td><a href="DeleteDoctor?id=<%=rs.getString(8)%>"><font color="black">Click Here</font></a></td>
	<%}%>
</p>
</table>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>
	
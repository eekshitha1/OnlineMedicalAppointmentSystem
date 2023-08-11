<%@page import= "health.Database"%>
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
			<li class="active"><a href="index.jsp" >Home</a></li>
<li><a href="AdminLoginPage.jsp" >Admin</a></li>
<li><a href="DoctorLoginPage.jsp" >Doctor</a></li>
<li><a href="PatientLoginPage.jsp" >Patient</a></li>

<li><a href="ViewFAQPage.jsp" >FAQS</a></li>
			
		</ul>	
		
	</div>
	<br/>
	<br/>
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=sans-serif color=black>"+res+"</center></font>");
	}%>
	<table border="1" align="center" width="100%" >
			 
         <tr>
		 <th><font  color="black">Question</th>
		 <th><font  color="black">Answer</th>
		 
		</tr>
		 
		 <%
		 Database database = new Database();
		 
		Connection dbcon = Database.connectionDriver();
		Statement s=dbcon.createStatement();
		ResultSet rs=s.executeQuery("select faq_question,faq_answer from frequentquestion");
		while(rs.next()){
			
			%>
		
		<tr><td><font  color="black"><%=rs.getString(1)%></td>
		<td><font  color="black"><%=rs.getString(2)%></td>
		
	<%}%>
</p>
</table>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>
	
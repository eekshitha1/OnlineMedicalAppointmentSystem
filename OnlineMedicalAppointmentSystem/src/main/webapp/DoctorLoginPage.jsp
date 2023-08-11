<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Online Medical Appointment System</title>

<link rel="stylesheet" type="text/css" href="style.css" />
<script language="javascript">
	function checkFields(f1)
	{
	if(f1.t1.value.length==0)
	{
	alert("Provide Username");
	f1.t1.focus();
	return false;
	}
	if(f1.t2.value.length==0)
	{
	alert("Provide Password");
	f1.t2.focus();
	return false;
	}
	return true;
	}
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
			<li class="active"><a href="index.jsp" >Home</a></li>
<li><a href="AdminLoginPage.jsp" >Admin</a></li>
<li><a href="DoctorLoginPage.jsp" >Doctor</a></li>
<li><a href="PatientLoginPage.jsp" >Patient</a></li>
<!--  <li><a href="RegisterAccount.jsp" >New Patients Signup Here</a></li> -->
<li><a href="ViewFAQPage.jsp" >FAQS</a></li>
			
		</ul>				
				</div>
			
			<center>
<form name="f1" method="post" action="LoginDoctor" onsubmit="return checkFields(this);"><br/>
   <h2><b>Doctor Login Page</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=verdana color=black>"+res+"</center></font>");
	}%>
						
						<table align="center" width="40" >
			 <tr><td><font  color="black">Username</b></td><td><input type="text" name="t1" style="font-family: Comic Sans MS" size=30/></td></tr>
         
		  <tr><td><font  color="black">Password</b></td><td><input type="password" name="t2" style="font-family: Comic Sans MS" size=30/></td></tr>
         
			<tr><td></td><td><input type="submit" value="Login">
			</td>

	
			</table>
				</div>	
					
				</div>
				
	</body>
</html>
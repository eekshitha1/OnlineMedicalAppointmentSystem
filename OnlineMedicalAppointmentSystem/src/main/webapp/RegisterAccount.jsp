<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>Online Medical Appointment System</title>

<link rel="stylesheet" type="text/css" href="style.css" />
<script language="javascript">
function checkEmail(t3) {
	if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(t3)){
		return (true)
	}
	alert("Incorrect E-mail Address entered! Please re-enter.")
	return (false);
}
	function validateFields(f)
	{
	if(f.uname.value.length==0)
	{
	alert("Provide user name");
	f.uname.focus();
	return false;
	}
	if(f.pass.value.length==0)
	{
	alert("Provide password");
	f.pass.focus();
	return false;
	}
	if(f.phone.value.length==0)
	{
	alert("Provide phone no");
	f.phone.focus();
	return false;
	}
	if(isNaN(f.phone.value)){
		alert("Phone no should be be numeric");
		f.phone.focus();
		return false;
	}
	if(f.phone.value.length != 10){
		alert("Phone number should be 10 digits long");
		f.phone.focus();
		return false;
	}
	if(f.email.value.length==0)
	{
	alert("Provide email id");
	f.email.focus();
	return false;
	}
	if(!checkEmail(f.email.value)){
		f.email.focus();
		return false;
	}
	if(f.address.value.length==0)
	{
	alert("Provide address");
	f.address.focus();
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
<!--<li><a href="RegisterAccount.jsp" >New Patients Signup Here</a></li> -->
<li><a href="ViewFAQPage.jsp" >FAQS</a></li>
			
		</ul>			
				</div>
			
			<center>
<form name="f1" method="post" action="RegisterAccount" onsubmit="return validateFields(this);"><br/>
   <h2><b>Patient Signup Page</b></h2>
   
	<%
	String res = request.getParameter("t1");
	if(res != null){
		out.println("<center><font face=sans-serif color=black>"+res+"</center></font>");
	}%>
						
						<table align="center" width="40" >
	<tr><td><font  color="black">Username</b></td><td><input type="text" name="uname" size="20"/></td></tr>
    <tr><td><font  color="black">Password</b></td><td><input type="password" name="pass" size="20"/></td></tr>
	<tr><td><font  color="black">Gender</b></td><td><select name="gender">
	<option value="Male">Male</option>
	<option value="Female">Female</option>
	</select>
	</td></tr>
	<tr><td><font  color="black">Mobile No</b></td><td><input type="text" name="phone" size="15"/></td></tr>
	<tr><td><font  color="black">Email ID</b></td><td><input type="text" name="email" size="30"/></td></tr>
	<tr><td><font  color="black">Address</b></td><td><input type="text" name="address" size="50"/></td></tr>
	
	<tr><td></td><td><input type="submit" value="Register">
			</td>
			</table>
				</div>	
					
				</div>
				
	</body>
</html>
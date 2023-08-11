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
	alert("Invalid E-mail Address! Please re-enter.")
	return (false);
}
	function validateFields(f)
	{
	if(f.fname.value.length==0)
	{
	alert("Please Enter first name");
	f.fname.focus();
	return false;
	}
	if(f.lname.value.length==0)
	{
	alert("Please Enter last name");
	f.lname.focus();
	return false;
	}
	if(f.phone.value.length==0)
	{
	alert("Provide Phn no please");
	f.phone.focus();
	return false;
	}
	if(isNaN(f.phone.value)){
		alert("Contact no  must be numeric");
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
	alert("Provide email id, please");
	f.email.focus();
	return false;
	}
	if(!checkEmail(f.email.value)){
		f.email.focus();
		return false;
	}
	if(f.address.value.length==0)
	{
	alert("Please provide address");
	f.address.focus();
	return false;
	}
	if(f.details.value.length==0)
	{
	alert("Please provide qualification & experience details");
	f.details.focus();
	return false;
	}
	if(f.uname.value.length==0)
	{
	alert("Please provide username");
	f.uname.focus();
	return false;
	}
	if(f.pass.value.length==0)
	{
	alert("Please provide password");
	f.pass.focus();
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
			<li class="active"><a href="CreateDoctor.jsp" >Add Doctor</a></li>
<li><a href="DeleteDoctor.jsp" >Delete Doctor</a></li>
<li><a href="AddFAQ.jsp" >Add FAQ</a></li>
<li><a href="DeleteFAQ.jsp" >Delete FAQ</a></li>
<li><a href="CheckLeaveRequestPage.jsp" >View Leave Request</a></li>
<li><a href="index.jsp" >SignOut</a></li>
			
		</ul>
			
		</ul>			
				</div>
				
			<center>
<form name="f1" method="post" action="AddDoctor" onsubmit="return validateFields(this);"><br/>
   <h2><b>Add Doctor Page</b></h2>
   
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
						
						<table align="center" width="40" >
	<tr><td><font  color="black">First Name</b></td><td><input type="text" name="fname" size="20"/></td></tr>
    <tr><td><font  color="black">Last Name</b></td><td><input type="text" name="lname" size="20"/></td></tr>
	<tr><td><font  color="black">Phone No</b></td><td><input type="text" name="phone" size="15"/></td></tr>
	<tr><td><font  color="black">Email ID</b></td><td><input type="text" name="email" size="30"/></td></tr>
	<tr><td><font  color="black">Address</b></td><td><input type="text" name="address" size="50"/></td></tr>
	<tr><td><font  color="black">Qualification & Experience Details</b></td><td><textarea name="details" cols="45" rows="10"></textarea></td></tr>
	<tr><td><font  color="black">Disease&nbsp;Speciality</b></td>
	<td><select name="speciality">
	<option value="General">General</option>
	<option value="Cardiology">Cardiology</option>
	<option value="ENT">ENT</option>
	<option value="Neurology">Neurology</option>
	<option value="Gynecology">Gynecology</option>
		</select></td></tr>
	<tr><td><font  color="black">Username</b></td><td><input type="text" name="uname" size="20"/></td></tr>
	<tr><td><font  color="black">Password</b></td><td><input type="password" name="pass" size="20"/></td></tr>

         
			<tr><td></td><td><input type="submit" value="Add Doctor">
			</td>
			</table>
				</div>	
					
				</div>
				
	</body>
</html>
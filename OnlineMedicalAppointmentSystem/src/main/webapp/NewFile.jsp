<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Online Medical Appointment System</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script language="javascript">

	function validateFields(f)
	{
	if(f.t1.value.length==0)
	{
	alert(" Provide FAQ question");
	f.t1.focus();
	return false;
	}
	if(f.t2.value.length==0)
	{
	alert("Provide FAQ answer");
	f.t2.focus();
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
			<li class="active"><a href="CreateDoctor.jsp">Add Doctor</a></li>
<li><a href="DeleteDoctor.jsp" >Delete Doctor</a></li>
<li><a href="AddFAQ.jsp" >Add FAQ</a></li>
<li><a href="DeleteFAQ.jsp" >Delete FAQ</a></li>
<li><a href="CheckLeaveRequestPage.jsp" >View Leave Request</a></li>
<li><a href="index.jsp" >SignOut</a></li>
			
		</ul>			
				</div>
				
			<center>
<form name="f1" method="post" action="AddFAQ" onsubmit="return validateFields(this);"><br/>
   <h2><b>Add FAQ Page</b></h2>
   
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
						
						<table align="center" width="40" >
	<tr><td><font color="black">Question </b></td>
	<td><textarea name="t1" rows="10" cols="60"></textarea></td></tr>

	<tr><td><font color="black">Answer</b></td>
	<td><textarea name="t2" rows="10" cols="60"></textarea></td></tr>

   
			<tr><td></td><td><input type="submit" value="Submit">
			</td>
			</table>
				</div>	
					
				</div>
				
	</body>
</html>
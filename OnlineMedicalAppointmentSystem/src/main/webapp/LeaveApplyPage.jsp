<%@page import="health.Database"%>
<%@page import="java.sql.*"%>
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
	alert("Provide reason for leave");
	f.t1.focus();
	return false;
	}
	if(f.t2.value.length==0)
	{
	alert("Select start date");
	f.t2.focus();
	return false;
	}
	if(f.t3.value.length==0)
	{
	alert("Select end date");
	f.t3.focus();
	return false;
	}
	return true;
	}
	</script>
	<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>
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
			<li class="active"><a href="ViewAppointmentsPage.jsp" >View Appointments</a></li>
<li><a href="LeaveApplyPage.jsp" >Apply for Leave</a></li>
<li><a href="CheckLeaveStatusPage.jsp" >View Leave Status</a></li>
<li><a href="index.jsp" >SignOut</a></li>		
				</div>
			
			<center>
<form name="f1" method="post" action="ApplyforLeave" onsubmit="return validateFields(this);"><br/>
   <h2><b>Schedule Appointment Page</b></h2>
   
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
						
						<table align="center" width="40" >
	<tr><td><font  color="black">Reason&nbsp;for&nbsp;Leave</b></td><td><input type="text" name="t1" size="50" /></td></tr>
   
	<tr><td><font  color="black">Start&nbsp;Date</b></td><td><input name="t2" type="text" id="demo" maxlength="25" size="20" class="c2" ><a href="javascript:NewCal('demo','ddmmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
	  		<span class="descriptions"></span></td>
		  </td></tr>

    <tr><td><font  color="black">End&nbsp;Date</b></td><td><input name="t3" type="text" id="demo1" maxlength="25" size="20" class="c2" ><a href="javascript:NewCal('demo1','ddmmmyyyy',false,24)"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a>
	  		<span class="descriptions"></span></td>
		  </td></tr>

         
			<tr><td></td><td><input type="submit" value="Submit">
			</td>
			</table>
				</div>	
					
				</div>
				
	</body>
</html>
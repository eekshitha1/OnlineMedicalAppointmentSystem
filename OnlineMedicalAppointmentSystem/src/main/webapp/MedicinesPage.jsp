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
			
		</ul>			
				</div>
			
			<center>
<form name="f1" method="post" action="Prescription" onsubmit="return validateFields(this);"><br/>
   <h2><b>Prescription Page</b></h2>
   
	<%
	String result = request.getParameter("t1");
	if(result != null){
		out.println("<center><b><font face=sans-serif color=black>"+result+"</center></b></font>");
	}%>
	
	<%
		String doctor_name  = session.getAttribute("uname").toString();
		Connection dbcon = Database.connectionDriver();
		Statement s=dbcon.createStatement();
		ResultSet rs=s.executeQuery("select * from appointment where doc_uname='"+doctor_name+"'");
		
			
			%>
						
						<table align="center" width="40" >
	<tr><td><font  color="black">Medicine&nbsp;ID</b></td><td><input type="text" name="t1" size="20" value="<%=request.getParameter("id")%>" readonly/></td></tr>
    
	<tr><td><font  color="black">Medicine&nbsp;Name</b></td><td><input type="text" name="t2" size="20" value=""></input></tr>
	<tr><td><font  color="black">Medicine&nbsp;Cost</b></td><td><input type="text" name="t3" size="20" value=""></input></tr>

	</td></tr>
	
         
			<tr><td></td><td><input type="submit" value="Submit">
			</td>
			</table>
				</div>	
					
				</div>
				
	</body>
</html>
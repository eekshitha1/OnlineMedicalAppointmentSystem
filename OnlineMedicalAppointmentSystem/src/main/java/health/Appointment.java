package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Appointment")
public class Appointment extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String doctor = request.getParameter("t1").trim();
	String patient = request.getParameter("t2").trim();
	String desc = request.getParameter("t3").trim();
	String date = request.getParameter("t4").trim();	
	
	try{
		String msg = Database.appointment(doctor,patient,desc,date);
		RequestDispatcher dispatch = request.getRequestDispatcher("DiseaseTypesPage.jsp?t1="+msg);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

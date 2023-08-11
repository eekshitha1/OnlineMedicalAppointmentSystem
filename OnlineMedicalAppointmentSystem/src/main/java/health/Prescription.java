package health;
import java.io.*;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Prescription")
public class Prescription extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String message = "";
	try{
		String appointmentId = request.getParameter("appointment_id");
		Integer prescriptionId = Database.prescriptionCreation(Integer.valueOf(appointmentId));
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String param = params.nextElement();
			if(!param.equals("appointment_id")) {
				String medicineId = request.getParameter(param);
			  message = Database.medicineAddition(prescriptionId, Integer.valueOf(medicineId));
			}
			
	      }
		
		
		RequestDispatcher dispatch = request.getRequestDispatcher("DoctorHomePage.jsp?t1="+message);
		dispatch.forward(request, response);
	}catch(Exception e)
	{
		e.printStackTrace();
	}
}
}

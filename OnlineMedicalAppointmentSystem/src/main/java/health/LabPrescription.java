package health;
import java.io.*;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LabPrescription")
public class LabPrescription extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String message = "";
		try {
			String appointment_Id = request.getParameter("appointment_id");
			Integer prescriptionId = Database.LabPrescriptionAddition(Integer.valueOf(appointment_Id));
			Enumeration<String> params = request.getParameterNames();
			while(params.hasMoreElements()) {
				String param = params.nextElement();
				if(!param.equals("appointment_id")) {
					String labServiceId = request.getParameter(param);
				  message = Database.LabServiceAddition(prescriptionId, Integer.valueOf(labServiceId));
				}
				
		      }
			
			
			RequestDispatcher dispatch = request.getRequestDispatcher("DoctorHomePage.jsp?t1="+message);
			dispatch.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}

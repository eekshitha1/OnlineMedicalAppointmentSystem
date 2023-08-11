package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/JoiningPrescription")
public class JoiningPrescription extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String appointmentId = request.getParameter("appointment_id");
		String joiningDesc = request.getParameter("joining_description").trim();
		String approxDays = request.getParameter("approx_days").trim();
		String message="";
		try {
			message = Database.JoiningPrescriptionAddition(joiningDesc, Integer.valueOf(approxDays), Integer.valueOf(appointmentId));
			
			RequestDispatcher dispatch = request.getRequestDispatcher("DoctorHomePage.jsp?t1="+message);
			dispatch.forward(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}

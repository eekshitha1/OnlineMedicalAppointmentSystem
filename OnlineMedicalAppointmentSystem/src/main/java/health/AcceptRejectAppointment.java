package health;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AcceptRejectAppointment")
public class AcceptRejectAppointment extends HttpServlet {

public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String id = request.getParameter("id").trim();
	String status = request.getParameter("status").trim();
	
	try{
		String message = Database.appointmentAcceptance(id,status);
		RequestDispatcher dispatch = request.getRequestDispatcher("DoctorHomePage.jsp?t1="+message);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

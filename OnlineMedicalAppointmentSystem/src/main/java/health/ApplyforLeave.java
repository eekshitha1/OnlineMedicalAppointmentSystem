package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ApplyforLeave")
public class ApplyforLeave extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String reason = request.getParameter("t1").trim();
	String from = request.getParameter("t2").trim();
	String to = request.getParameter("t3").trim();
	try{
		HttpSession http_session = request.getSession();
		String doctor = http_session.getAttribute("uname").toString();
		String msg = Database.applyForLeave(doctor,reason,from,to);
		RequestDispatcher dispatch = request.getRequestDispatcher("LeaveApplyPage.jsp?t1="+msg);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

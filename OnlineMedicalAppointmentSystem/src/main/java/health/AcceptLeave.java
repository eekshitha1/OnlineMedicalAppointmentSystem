package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AcceptLeave")
public class AcceptLeave extends HttpServlet {

public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String id = request.getParameter("id").trim();
	String status = request.getParameter("status").trim();
	
	try{
		String msg = Database.acceptLeave(id,status);
		RequestDispatcher dispatch = request.getRequestDispatcher("AdminHomePage.jsp?t1="+msg);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

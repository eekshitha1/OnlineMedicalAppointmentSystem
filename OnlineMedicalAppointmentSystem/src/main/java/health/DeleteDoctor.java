package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {

public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String uname = request.getParameter("id").trim();
	
	
	try{
		String message = Database.deleteDoctor(uname);
		RequestDispatcher dispatch = request.getRequestDispatcher("DeleteDoctor.jsp?t1="+message);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

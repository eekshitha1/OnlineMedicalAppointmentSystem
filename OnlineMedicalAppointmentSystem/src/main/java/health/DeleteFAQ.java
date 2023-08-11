package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteFAQ")
public class DeleteFAQ extends HttpServlet {

public void doGet(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String id = request.getParameter("id").trim();
	
	//
	try{
		String message = Database.deleteFAQ(id);
		RequestDispatcher dispatch = request.getRequestDispatcher("DeleteFAQ.jsp?t1="+message);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

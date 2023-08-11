package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddFAQ")
public class AddFAQ extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String question = request.getParameter("t1").trim();
	String answer = request.getParameter("t2").trim();
	
	
	try{
		String msg = Database.addFAQ(question,answer);
		RequestDispatcher dispatch = request.getRequestDispatcher("AddFAQ.jsp?t1="+msg);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

package health;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddDoctor")
public class AddDoctor extends HttpServlet {

public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {

	String fname = request.getParameter("fname").trim();
	String lname = request.getParameter("lname").trim();
	String contact = request.getParameter("phone").trim();
	String email = request.getParameter("email").trim();
	String address = request.getParameter("address").trim();
	String details = request.getParameter("details").trim();
	String speciality = request.getParameter("speciality").trim();
	String user = request.getParameter("uname").trim();
	String pass = request.getParameter("pass").trim();
	
	try{
		String msg = Database.addDoctor(fname,lname,contact,email,address,details,speciality,user,pass,"Doctor");
		RequestDispatcher dispatch = request.getRequestDispatcher("CreateDoctor.jsp?t1="+msg);
		dispatch.forward(request, response);
	}catch(Exception e){
		e.printStackTrace();
	}
}
}

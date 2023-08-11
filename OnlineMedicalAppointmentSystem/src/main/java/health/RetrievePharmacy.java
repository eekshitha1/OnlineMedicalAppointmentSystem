package health;
import java.io.*;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RetrievePharmacy")
public class RetrievePharmacy extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		String medicineId= request.getParameter("medicineId");
		System.out.println(medicineId);
		ArrayList<String> pharmacyList = null;
		try {
			pharmacyList = Database.retrieveListPharmacy(Integer.valueOf(medicineId));
			
			 System.out.println("<input type='hidden' id='pqId' value='"+pharmacyList+"'/>");
			 //res.getWriter().write("writing from servlet");
			 
			 
			 response.setContentType("text/html");
		        PrintWriter printWriter = response.getWriter();
		        printWriter.print("<html>");
		        printWriter.print("<body>");
		        printWriter.print("<h1>Pharmacy List</h1>");
		        printWriter.print("<p> firstName :: " + pharmacyList + "</p>");
		        printWriter.print("</body>");
		        printWriter.print("</html>");
		        printWriter.close();

		        System.out.println("pharmcy list :: " + pharmacyList);
			 
			 
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}

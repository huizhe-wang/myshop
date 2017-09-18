package assignment2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReceiveForm
 */
@WebServlet("/ReceiveForm")
public class ReceiveForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiveForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		String firstname = request.getParameter("firstname");
		String middleinitial = request.getParameter("middleinitial");
		String lastname = request.getParameter("lastname");
		String gender = request.getParameter("gender");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zipcode");
		if (firstname.equals("") || firstname.equals(null)) {
			RequestDispatcher dp = request.getRequestDispatcher("send.html");
     		dp.forward(request, response);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<html>");
			pw.println("<body>");
			pw.println("<center>");
			pw.println("Information<br>");
			pw.println("<br>");
			pw.println("First Name: " + firstname + "<br>");
			pw.println("Middle Initial: " + middleinitial + "<br>");
			pw.println("Last Name: " + lastname + "<br>");
			pw.println("Gender: " + gender + "<br>");
			pw.println("Data of Brith: " + month + "/" + day + "/" + year + "<br>");
			pw.println("Address: " + address + "<br>");
			pw.println("City: " + city + "<br>");
			pw.println("State: " + state + "<br>");
			pw.println("Zip Code: " + zipcode + "<br>");
			pw.println("</center>");
			pw.println("</body>");
			pw.println("</html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDAO;
import dao.UrlDAO;
import model.Customer;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.setMaxInactiveInterval(1800);
		String username = request.getParameter("email");
		String pass = request.getParameter("pass");
		CustomerDAO khd = (CustomerDAO) getServletContext().getAttribute("khachHangDAO");

		// Lay duong dan cuoi cung
		UrlDAO urlDAO = (UrlDAO)getServletContext().getAttribute("urlDAO");
		String urlLast = urlDAO.getUrlLast();
		if(urlLast==null) {
			urlLast="index.jsp";
		}else {
			urlLast=urlLast.substring(1);
		}
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			if (khd.checkLogin(username, pass)) {
				Customer kh = khd.findByEmail(username.trim());
				session.setAttribute("user", kh);
				request.setAttribute("email", username);
				request.getRequestDispatcher(urlLast).forward(request, response);
			} else {
				request.setAttribute("email", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
//		request.getRequestDispatcher("shop-detail.jsp").forward(request, response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

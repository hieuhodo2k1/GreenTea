package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import cart.ShoppingCart;
import dao.ProductDAO;
import dao.UrlDAO;
import model.Product;
import model.Review;

/**
 * Servlet implementation class ShopDetail
 */
@WebServlet("/shopdetail")
public class ShopDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShopDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
		ProductDAO productDAO = (ProductDAO) getServletContext().getAttribute("productDAO");
		String id = request.getParameter("idProduct");
		ServletContext context = getServletContext();
		Product product = productDAO.findById(id);
		String[] linkList = product.getLinkList().split(" ");
		String link1 = linkList[0];
		String link2 = linkList[1];
		context.setAttribute("link1", link1);
		context.setAttribute("link2", link2);
		context.setAttribute("product", product);
		String url = request.getServletPath();
		String info = request.getPathInfo();
		System.out.println(url +" "+info+ "--hello");
		
		//Lay duong dan cuoi cung
		UrlDAO urlDAO = (UrlDAO)getServletContext().getAttribute("urlDAO");
	    StringBuilder requestURL = new StringBuilder(request.getServletPath());
	    String queryString = request.getQueryString();
	    if (queryString == null) {
	        urlDAO.setUrlLast(requestURL.toString());
	    } else {
	    	 urlDAO.setUrlLast(requestURL.append('?').append(queryString).toString());
	    }
//	    System.out.println(urlDAO.getUrlLast());
	    
		//Lay danh sach danh gia
	    List<Review> listReviews= productDAO.getListReviews(id);
	    if(listReviews==null) {
	    	listReviews = new ArrayList<Review>();
	    }
	    context.setAttribute("listReviews", listReviews);
	    //Gửi bài đánh giá
	    request.getRequestDispatcher("shop-detail.jsp").forward(request, response);
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

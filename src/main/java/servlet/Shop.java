package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.ShoppingCart;
import dao.ProductDAO;
import dao.UrlDAO;
import model.Category;
import model.Product;
import model.SortPopular;
import model.SortPriceASC;
import model.SortPriceDESC;

/**
 * Servlet implementation class Shop
 */
@WebServlet("/shop")
public class Shop extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shop() {
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
		// Get list product
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ServletContext context = getServletContext();
		ProductDAO productDAO = (ProductDAO) getServletContext().getAttribute("productDAO");
		List<Category> listCategory = productDAO.getListCategories();// Danh sach ten danh muc
		List<Category> numCategories = productDAO.numProductofCategory();// Danh sach so luong danh muc

		List<Category> listCate = new ArrayList<>();// Danh sach danh muc kem ten va so luong
		for (Category c : listCategory) {
			String idCate = c.getIdCate();
			for (Category cc : numCategories) {
				if (idCate.equals(cc.getIdCate())) {
					c.setNumOfProduct(cc.getNumOfProduct());
				}
			}

		}
		// Tinh so trang
		int numberOfProduct = productDAO.getTotalProduct();
		int numberOfPage;
		if (numberOfProduct % 9 == 0) {
			numberOfPage = numberOfProduct / 9;
		} else {
			numberOfPage = numberOfProduct / 9 + 1;
		}
		// Phan trang
		String pageNumber = request.getParameter("page-number");

		if (pageNumber == null) {
			pageNumber = "1";
		}
		int indexPage = Integer.parseInt(pageNumber);
		List<Product> pagings = productDAO.pagdingProduct(indexPage);

		List<Product> pagingsClone = new ArrayList<Product>();
		for (Product p : pagings) {
			pagingsClone.add(p);
		}

		context.setAttribute("tag", indexPage);
		context.setAttribute("numberOfPage", numberOfPage);
		context.setAttribute("listCategory", listCategory);
		// Sap xep
		String sortBy = request.getParameter("sort");
		String sort = "";
		System.out.println(sortBy);
		if (sortBy == null) {
			sortBy = "random";
			sort = "Không sắp xếp";
		}
		if (sortBy.equals("random")) {
			pagings = pagingsClone;
			sort = "Sắp xếp ngẫu nhiên";
		}
		if (sortBy.equals("high-to-low")) {
			Collections.sort(pagings, new SortPriceDESC());
			sort = "Giá từ cao tới thấp";

		}
		if (sortBy.equals("low-to-high")) {
			Collections.sort(pagings, new SortPriceASC());
			sort = "Giá từ thấp đến cao";
		}
		if (sortBy.equals("popularty")) {
			Collections.sort(pagings, new SortPopular());
			sort = "Phổ biến nhất";
		}
		context.setAttribute("sortby", sortBy);
		context.setAttribute("sortTitle", sort);
		context.setAttribute("pagings", pagings);

		UrlDAO urlDAO = (UrlDAO) getServletContext().getAttribute("urlDAO");
		StringBuilder requestURL = new StringBuilder(request.getServletPath());
		String queryString = request.getQueryString();
		if (queryString == null) {
			urlDAO.setUrlLast(requestURL.toString());
		} else {
			urlDAO.setUrlLast(requestURL.append('?').append(queryString).toString());
		}
		System.out.println(urlDAO.getUrlLast());
		request.getRequestDispatcher("shop.jsp").forward(request, response);

		// Search

//		String url = request.getParameter("url");
//		if(url==null) {
//			url="shop";
//		}
//		if(url.equals("shop")) {
//			
////			response.sendRedirect("shop");
//		}
//		if(url.equals("shopdetail")) {
//			request.getRequestDispatcher("shop-detail.jsp").forward(request, response);
//		}
//		if(url.equals("SearchProduct")) {
//			request.getRequestDispatcher("search-product.jsp").forward(request, response);
//		}

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

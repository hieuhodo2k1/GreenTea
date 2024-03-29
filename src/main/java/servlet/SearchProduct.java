package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dao.UrlDAO;
import model.Category;
import model.Product;
import model.SortPopular;
import model.SortPriceASC;
import model.SortPriceDESC;



/**
 * Servlet implementation class SearchProduct
 */
@WebServlet("/SearchProduct")
public class SearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchProduct() {
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
		String argument = "";
		String params ="";
		String searchProduct = request.getParameter("seach-product");
		String searchCategory = request.getParameter("seach-category");
		// Lay khoang gia
		String priceFilter = request.getParameter("price-filter");
		double priceStart = -1;
		double priceEnd = -1;

		if (priceFilter != null) {
			String[] split = priceFilter.split("-");

			priceStart = Double.parseDouble(split[0].trim().substring(0,split[0].trim().length()-1));
			priceEnd = Double.parseDouble(split[1].trim().substring(0,split[1].trim().length()-1));
			
		}
		
		System.out.println(priceStart+" "+ priceEnd);

		//Tim kiem ket qua
		String search = "";
		if (searchProduct != null) {
			search = searchProduct;
			params="seach-product";
			argument= searchProduct;
		}
		if (searchCategory != null) {
			search = searchCategory;
			params="seach-category";
			argument = searchCategory;
		}
		
		if(priceFilter!=null) {
			argument = priceFilter;
			params="price-filter";
		}
		ProductDAO productDAO = (ProductDAO) getServletContext().getAttribute("productDAO");
		List<Product> listProduct = productDAO.getListSearch(search);
		List<Category> listCategory = productDAO.getListCategories();
		List<Category> numCategories = productDAO.numProductofCategory();//Danh sach so luong danh muc
		
		for(Category c : listCategory) {
			String idCate =c.getIdCate();
			for(Category cc : numCategories) {
				if(idCate.equals(cc.getIdCate())) {
					c.setNumOfProduct(cc.getNumOfProduct());
				}
			}

			
		}
		List<Product> pagingsClone = new ArrayList<Product>();
		for(Product p : listProduct) {
			pagingsClone.add(p);
		}
		
		String sortBy = request.getParameter("sort");
		String sort = "";
		System.out.println(sortBy);
		if(sortBy==null) {
			sortBy="random";
			sort="Không sắp xếp";
		}
		if(sortBy.equals("random")) {
			listProduct= pagingsClone;
			sort="Sắp xếp ngẫu nhiên";
		}if(sortBy.equals("high-to-low")) {
			Collections.sort(listProduct, new SortPriceDESC());
			sort="Giá từ cao tới thấp";
		
		}if(sortBy.equals("low-to-high")) {
			Collections.sort(listProduct, new SortPriceASC());
			sort="Gía từ thấp đến cao";
		}
		if(sortBy.equals("popularty")) {
			Collections.sort(listProduct, new SortPopular());
			sort="Phổ biến nhất";
		}
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
		
		
		ServletContext context = getServletContext();
		context.setAttribute("sortTitle", sort);
		context.setAttribute("argument", argument);
		context.setAttribute("params", params);
		context.setAttribute("listSearch", listProduct);
		context.setAttribute("listCategory", listCategory);
		request.getRequestDispatcher("search-product.jsp").forward(request, response);
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

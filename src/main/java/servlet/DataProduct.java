package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;
import model.ProductCategory;

/**
 * Servlet implementation class DataProduct
 */
@WebServlet("/admin/dataproduct")
public class DataProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO productDAO = (ProductDAO)getServletContext().getAttribute("productDAO");
		List<Product> listProducts = productDAO.getListProduct();
		List<ProductCategory> lisProductCategories = productDAO.getNameCateogorys();
		Map<String, String> mapProductCategory = new HashMap<>();
		for(ProductCategory pd : lisProductCategories) {
			mapProductCategory.put(pd.getIdProduct(), pd.getNamCategory());
		}

		ServletContext context = getServletContext();
		context.setAttribute("products", listProducts);
		context.setAttribute("productsCate", mapProductCategory);
		request.getRequestDispatcher("table-product.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

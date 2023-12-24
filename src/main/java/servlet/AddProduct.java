package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.eclipse.jdt.internal.compiler.ast.FalseLiteral;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import common.CloudinaryConfig;
import dao.ProductDAO;
import model.Category;
import model.IDRandom;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/admin/add-product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "uploadFiles";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/**
	 * Extracts file name from HTTP header content-disposition
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Upload file
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		ProductDAO productDAO = (ProductDAO) getServletContext().getAttribute("productDAO");
		// Lay danh sach loai san pham
		ServletContext context = getServletContext();
		List<Category> categories = productDAO.getListCategories();
		context.setAttribute("categories", categories);
		String fileNames = "";
		String isSubmitStr = request.getParameter("isSubmit");
		boolean isSubmit = isSubmitStr == null || isSubmitStr.isBlank() ? false : true;
		// gets absolute path of the web application
		// constructs path of the directory to save uploaded file
		if (isSubmit) {
			try {

				Cloudinary cloudinary = CloudinaryConfig.getCloudinary();

				for (Part filePart : request.getParts()) {
					if (filePart.getContentType() != null) {
						String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
						Path filePath = Files.createTempFile("uploaded-file", getFileExtension(fileName));
						try (InputStream input = filePart.getInputStream()) {
							Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
						}
						Map<?, ?> uploadResult = cloudinary.uploader().upload(filePath.toFile(),
								ObjectUtils.emptyMap());
						String imageUrl = (String) uploadResult.get("url");
						fileNames += "," + imageUrl;
					}

				}

				// Them san pham vao csdl
				IDRandom random = new IDRandom();
				String id = "SP" + random.getIDRandom();
				String name = request.getParameter("name-product");
				String des = request.getParameter("des-product");
				double price = Double.parseDouble(request.getParameter("price-product"));
				String category = request.getParameter("category-product");
//		
				String[] split = fileNames.trim().split(",");
				String linkI = split[1];
				String linkL = split[2] + " " + split[3];

				productDAO.insertProduct(id, name, des, price, linkI, category, linkL);
				request.setAttribute("isOK", true);
				request.getRequestDispatcher("addproduct.jsp").forward(request, response);
			} catch (Exception i) {
				i.printStackTrace();
				request.setAttribute("errorMessages", "Thêm sản phẩm thất bại");
				request.getRequestDispatcher("addproduct.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("addproduct.jsp").forward(request, response);
		}
			
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

	private String getFileExtension(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		if (dotIndex != -1 && dotIndex < fileName.length() - 1) {
			return fileName.substring(dotIndex + 1);
		}
		return "";
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}

package servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import common.CloudinaryConfig;

/**
 * Servlet implementation class ImageUploadServlet
 */
@WebServlet("/upload-file")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageUploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Lấy đối tượng Cloudinary từ cấu hình
			Cloudinary cloudinary = CloudinaryConfig.getCloudinary();
			String fileNames = "";
			for (Part filePart : request.getParts()) {
				
				String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				Path filePath = Files.createTempFile("uploaded-file", getFileExtension(fileName));
				try (InputStream input = filePart.getInputStream()) {
					Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
				}
				Map<?, ?> uploadResult = cloudinary.uploader().upload(filePath.toFile(), ObjectUtils.emptyMap());
				String imageUrl = (String) uploadResult.get("url");
				request.setAttribute("status", imageUrl);

			}

			request.getRequestDispatcher("cloudinary.jsp").forward(request, response);

		} catch (IOException e) {
			e.printStackTrace();
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

}

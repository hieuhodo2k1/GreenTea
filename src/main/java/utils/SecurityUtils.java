package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SecurityUtils {
	public static String hashPassword(String password) {
		try {
            // Tạo một đối tượng MessageDigest với thuật toán MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Mã hóa chuỗi và nhận bản băm
            byte[] messageDigest = md.digest(password.getBytes());

            // Chuyển đổi bản băm thành chuỗi hex
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                hexString.append(String.format("%02x", b));
            }

            // In ra chuỗi hex của bản băm MD5
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
	
	}
}

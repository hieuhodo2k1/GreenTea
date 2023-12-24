package common;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;


public class CloudinaryConfig  {
	 private static Cloudinary cloudinary;

	    static {
	        cloudinary = new Cloudinary(ObjectUtils.asMap(
	                "cloud_name", "dyip8lyz6",
	                "api_key", "692268953576564",
	                "api_secret", "3ynp82xA2ImdUXyx7rXaiuyu_SM"
	        ));
	    }

	    public static Cloudinary getCloudinary() {
	        return cloudinary;
	    }
}

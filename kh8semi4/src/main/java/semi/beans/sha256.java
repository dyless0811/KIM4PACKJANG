package semi.beans;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class sha256 {
	private final static String mSalt = "김포박장";
	public static String encodeSha256(String source) throws NoSuchAlgorithmException{
		String result = "";
		
		byte[] a = source.getBytes();
		byte[] salt = mSalt.getBytes();
		byte[] bytes = new byte[a.length + salt.length];
		
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xFF) + 256, 16).substring(1));
			}
			result = sb.toString();
			return result;
	}
}
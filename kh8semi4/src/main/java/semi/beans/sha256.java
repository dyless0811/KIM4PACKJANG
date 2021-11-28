package semi.beans;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class sha256 {
	private final static String mSalt = "김포박장";
	public static String encodeSha256(String source) throws NoSuchAlgorithmException{
		String result = "";
		
		byte[] a = source.getBytes();
		System.out.println(Arrays.toString(a));
		byte[] salt = mSalt.getBytes();
		System.out.println(Arrays.toString(salt));
		byte[] bytes = new byte[a.length + salt.length];
		System.out.println(Arrays.toString(bytes));
		System.arraycopy(a, 0, bytes, 0,a.length);
		System.arraycopy(salt, 0, bytes, a.length, salt.length);
		System.out.println(Arrays.toString(bytes));
		
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(bytes);
			
			byte[] byteData = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xFF) + 256, 16).substring(1));
			}
			result = sb.toString().substring(1,10);
			return result;
	}
}
package semi.image.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ProductImageDao;
import semi.beans.ProductImageDto;
@WebServlet (urlPatterns = "/product/productImage.kj")
public class ProductFileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			int no =Integer.parseInt(req.getParameter("no"));
			//처리
			ProductImageDao productIamgeDao= new ProductImageDao();
			ProductImageDto productImageDto = productIamgeDao.get(no);
			
			File dir=new File("D:/upload/product");
			File target =new File(dir,productImageDto.getProductFileSaveName());
			InputStream in = new FileInputStream(target);
			byte[] buffer = new byte[8192];
			
			String encodeFilename = URLEncoder.encode(productImageDto.getProductFileUploadName(), "UTF-8");
			encodeFilename = encodeFilename.replace("+", "%20");
			
			resp.setHeader("Content-Type", "application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+encodeFilename+"\"");
			resp.setHeader("Content-Encoding", "UTF-8");
			resp.setHeader("Content-Length", String.valueOf(productImageDto.getProductFileSize()));
			
			while(true) {
				int size = in.read(buffer);
				if(size == -1) break;
				resp.getOutputStream().write(buffer, 0, size);
			}
			//출력
			
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}

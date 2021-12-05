package semi.product.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.BoardImageDao;
import semi.beans.BoardImageDto;
import semi.beans.ProductColorDao;
import semi.beans.ProductDao;
import semi.beans.ProductDto;
import semi.beans.ProductImageDao;
import semi.beans.ProductImageDto;
import semi.beans.ProductSizeDao;
@WebServlet  (urlPatterns = "/product/productadd.kj")
public class ProductAddServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			String savePath="D:/upload/kh84/product";
			int maxSize= 30 * 1024  * 1024;
			String encoding ="UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = 
					new MultipartRequest(req, savePath, maxSize, encoding,policy);
			

			ProductDto productDto = new ProductDto();
			productDto.setSmallTypeNo(Integer.parseInt(mRequest.getParameter("smallTypeNo")));
			productDto.setName(mRequest.getParameter("name"));
			productDto.setPrice(Integer.parseInt(mRequest.getParameter("price")));
			productDto.setDescription(mRequest.getParameter("description"));

	
			//처리
			
			ProductDao productDao = new ProductDao();
			int no=productDao.getSeq();
			productDto.setNo(no);
			productDao.insert(productDto);
	
			if(mRequest.getParameter("size")!=null) {
				ProductSizeDao productSizeDao = new ProductSizeDao();
				for (String sizeNo : mRequest.getParameterValues("size")) {
					productSizeDao.insert(Integer.parseInt(sizeNo), no);
				}				
			}
			
			if(mRequest.getParameter("color")!=null) {
				ProductColorDao productColorDao = new ProductColorDao();
				for (String colorNo : mRequest.getParameterValues("color")) {
					productColorDao.insert(Integer.parseInt(colorNo), no);
				}
			}
			
			ProductImageDto productImageDto = new ProductImageDto();
			productImageDto.setProductNo(no);
			productImageDto.setProductFileSaveName(mRequest.getFilesystemName("attach"));
			productImageDto.setProductFileUploadName(mRequest.getOriginalFileName("attach"));
			productImageDto.setProductFileType(mRequest.getContentType("attach"));
			File target = mRequest.getFile("attach");
			
			if(target!=null) {
				productImageDto.setProductFileSize(target.length());
				
				ProductImageDao productImageDao = new ProductImageDao();
				productImageDao.insert(productImageDto);				
			}
		
			//출력
			resp.sendRedirect("./productdetail.jsp?no="+no);
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}

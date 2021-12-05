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

import semi.beans.ProductDao;
import semi.beans.ProductDto;
import semi.beans.ProductImageDao;
import semi.beans.ProductImageDto;
@WebServlet (urlPatterns = "/product/productedit.kj")
public class ProductEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String savePath="D:/upload/kh84/product";
			int maxSize= 30 * 1024  * 1024;
			String encoding ="UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = 
					new MultipartRequest(req, savePath, maxSize, encoding,policy);
			
			//입력
			int productNo = Integer.parseInt(mRequest.getParameter("productNo"));
			ProductDto productDto = new ProductDto();
			productDto.setNo(productNo);
			productDto.setSmallTypeNo(Integer.parseInt(mRequest.getParameter("smallTypeNo")));
			productDto.setName(mRequest.getParameter("name"));
			productDto.setPrice(Integer.parseInt(mRequest.getParameter("price")));
			productDto.setDescription(mRequest.getParameter("description"));
			//처리
			
			ProductDao productDao = new ProductDao();
			boolean success=productDao.update(productDto);
			
			if(success) {
				ProductImageDao productImageDao = new ProductImageDao();
				ProductImageDto productImageDto = new ProductImageDto();
				
				//existing = 기존파일, new = 신규파일, delete = 파일삭제
				String selectImage = mRequest.getParameter("selectImage");
				System.out.println("selectImage = " + selectImage);
				switch(selectImage) {
				case "new":
					productImageDao.deleteByProductNo(productNo);
					//실제 파일도 삭제해야함
					productImageDto.setProductNo(productNo);
					productImageDto.setProductFileSaveName(mRequest.getFilesystemName("attach"));
					productImageDto.setProductFileUploadName(mRequest.getOriginalFileName("attach"));
					productImageDto.setProductFileType(mRequest.getContentType("attach"));
					File target = mRequest.getFile("attach");
					
					if(target!=null) {
						productImageDto.setProductFileSize(target.length());
						
						productImageDao.insert(productImageDto);				
					}
					break;
				case "delete":
					productImageDao.deleteByProductNo(productNo);
					//실제 파일도 삭제해야함
					break;
				case "existing":
					break;
				}			
				
				//출력
				resp.sendRedirect("productdetail.jsp?no="+productNo);
			}else {
				resp.sendError(500);
			}
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}

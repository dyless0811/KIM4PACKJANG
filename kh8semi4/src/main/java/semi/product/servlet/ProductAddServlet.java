package semi.product.servlet;

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
@WebServlet  (urlPatterns = "/product/productadd.kj")
public class ProductAddServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			System.out.println("어디까지왓니 0-1");
			String savePath="D:/upload/product";
			System.out.println("어디까지왓니 0-2");
			int maxSize= 30 * 1024  * 1024;
			System.out.println("어디까지왓니 0-3");
			String encoding ="UTF-8";
			System.out.println("어디까지왓니 0-4");
			
			System.out.println("어디까지왓니 0-5");
			MultipartRequest mRequest = 
					new MultipartRequest(req, savePath, maxSize, encoding);
			
		
			System.out.println("어디까지왓니 0-6");
			
			System.out.println(mRequest.getParameter("no"));
			System.out.println("어디까지왓니 1");
			ProductDto productDto = new ProductDto();
			//productDto.setNo(Integer.parseInt(mRequest.getParameter("no")));
			productDto.setSmallTypeNo(Integer.parseInt(mRequest.getParameter("smallTypeNo")));
			System.out.println("어디까지왓니 1-2");
			productDto.setName(mRequest.getParameter("name"));
			System.out.println("어디까지왓니 1-3");
			productDto.setPrice(Integer.parseInt(mRequest.getParameter("price")));
			System.out.println("어디까지왓니 1-4");
			productDto.setDescription(mRequest.getParameter("description"));
			System.out.println("어디까지왓니 1-5");
			
			System.out.println("어디까지왓니 2");
			//처리
			ProductDao productDao = new ProductDao();
			productDao.insert(productDto);
			System.out.println("어디까지왓니 3");
			//출력
			resp.sendRedirect("./productaddsuccess.jsp");
			System.out.println("어디까지왓니 4");
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}

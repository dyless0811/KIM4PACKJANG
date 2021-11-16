package semi.servlet.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.beans.ProductDao;
import semi.beans.ProductDto;
@WebServlet (urlPatterns = "/product/edit.kj")
public class ProductEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			ProductDto productDto = new ProductDto();
			productDto.setNo(Integer.parseInt(req.getParameter("no")));
			productDto.setSmallTypeNo(Integer.parseInt(req.getParameter("SmallTypeNo")));
			productDto.setName(req.getParameter("name"));
			productDto.setPrice(Integer.parseInt(req.getParameter("price")));
			productDto.setDescription(req.getParameter("description"));
			//처리
			
			ProductDao productDao = new ProductDao();
			boolean success=productDao.update(productDto);
			
			//출력
			if(success) {
				resp.sendRedirect("productdetail.jsp?no="+productDto.getNo());
			}else {
				resp.sendError(500);
			}
		}catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}

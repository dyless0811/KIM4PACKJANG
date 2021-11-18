package semi.product.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import oracle.jdbc.proxy.annotation.Post;
import semi.beans.ProductDao;
import semi.beans.ProductDto;
@WebServlet  (urlPatterns = "/product/productadd-backdup.kj")
public class ProductAddServletBackup2 extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			ProductDto productDto = new ProductDto();
			
			productDto.setName(req.getParameter("name"));
			productDto.setSmallTypeNo(Integer.parseInt(req.getParameter("smallTypeNo")));
			productDto.setPrice(Integer.parseInt(req.getParameter("price")));
			productDto.setDescription(req.getParameter("description"));
		

			//처리
			ProductDao producDao = new ProductDao();
			producDao.insert(productDto);

			//출력
			resp.sendRedirect("./productaddsuccess.jsp");
			
		}catch(Exception e) {
			
		}
	}

}

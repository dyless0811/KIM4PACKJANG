package semi.reply.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.ReplyDao;
import semi.beans.ReplyDto;
import semi.beans.ReplyImageDao;
import semi.beans.ReplyImageDto;

/**
 * Servlet implementation class ReplyAddServlet
 */
@WebServlet("/reply/add.kj")
public class ReplyAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String savePath = "C:/upload/kh84/reply/";
			System.out.println(savePath);
			
			int maxSize = 30 * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = new MultipartRequest(request, savePath, maxSize, encoding, policy);
			
			ReplyDao replyDao = new ReplyDao();
			int replyNo = replyDao.getSeq();
			ReplyDto replyDto = new ReplyDto();
			replyDto.setNo(replyNo);
			replyDto.setContent(mRequest.getParameter("content"));
			replyDto.setBuyNo(Integer.parseInt(mRequest.getParameter("buyNo")));
			replyDto.setStarPoint(Integer.parseInt(mRequest.getParameter("starPoint")));
			
			replyDao.insert(replyDto);
			
			
			ReplyImageDto replyImageDto = new ReplyImageDto();
			replyImageDto.setReplyNo(replyNo);
			replyImageDto.setReplySaveName(mRequest.getFilesystemName("attach"));
			replyImageDto.setReplyUploadName(mRequest.getOriginalFileName("attach"));
			replyImageDto.setReplyFileType(mRequest.getContentType("attach"));
			File target = mRequest.getFile("attach");
			
			System.out.println(replyImageDto.toString());
			
			if(target != null) {
				replyImageDto.setReplyFileSize(target.length());
				
				ReplyImageDao replyFileDao = new ReplyImageDao();
				replyFileDao.insert(replyImageDto);
			}
			
			//출력
			response.sendRedirect("../board/review_detail.jsp?no="+ replyNo);
		}
		catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}

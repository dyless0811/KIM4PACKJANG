package semi.board.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.beans.BoardDao;
import semi.beans.BoardDto;
import semi.beans.BoardImageDao;
import semi.beans.BoardImageDto;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/board/write.kj")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String savePath = "D:/upload/board";
			int maxSize = 10  * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = new MultipartRequest(request, savePath, maxSize, encoding, policy);
			
			BoardDao boardDao = new BoardDao();
			int boardNo = boardDao.getSeq();
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(boardNo);
			boardDto.setMemberId((String)request.getSession().getAttribute("loginId"));
			boardDto.setBoardTypeNo(Integer.parseInt(mRequest.getParameter("boardTypeNo")));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardContent(mRequest.getParameter("boardContent"));
			
			boolean isAnswer = request.getParameter("boardSuperno") != null;
			if(isAnswer) {
				boardDto.setBoardSuperno(Integer.parseInt(mRequest.getParameter("boardSuperno")));
			}
			
			if(isAnswer) {
				BoardDto parentDto = boardDao.get(boardDto.getBoardSuperno());
				boardDto.setBoardGroupno(parentDto.getBoardGroupno());
				boardDto.setBoardDepth(parentDto.getBoardDepth()+1);
				boardDao.insertAnswer(boardDto);
			}else {
				boardDao.insert(boardDto);
			}
			
			BoardImageDto boardImageDto = new BoardImageDto();
			boardImageDto.setBoardNo(boardNo);
			boardImageDto.setBoardSaveName(mRequest.getFilesystemName("attach"));
			boardImageDto.setBoardUploadName(mRequest.getOriginalFileName("attach"));
			boardImageDto.setBoardFileType(mRequest.getContentType("attach"));
			File target = mRequest.getFile("attach");
			
			if(target!=null) {
				boardImageDto.setBoardFileSize(target.length());
				
				BoardImageDao boardFileDao = new BoardImageDao();
				boardFileDao.insert(boardImageDto);				
			}
			
			response.sendRedirect("/kh8semi4/board/detail.jsp?no="+boardNo);
		} catch (Exception e) {
			response.sendError(500);
			e.printStackTrace();
		}
	}

}

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
@WebServlet("/board/edit.kj")
public class BoardEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String savePath = "D:/upload/kh84/board/";
			int maxSize = 10  * 1024 * 1024;
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			MultipartRequest mRequest = new MultipartRequest(request, savePath, maxSize, encoding, policy);
			
			int boardNo = Integer.parseInt(mRequest.getParameter("boardNo"));
			BoardDao boardDao = new BoardDao();
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(boardNo);
			boardDto.setBoardTypeNo(Integer.parseInt(mRequest.getParameter("boardTypeNo")));
			boardDto.setBoardTitle(mRequest.getParameter("boardTitle"));
			boardDto.setBoardContent(mRequest.getParameter("boardContent"));
			
			boolean isAnswer = request.getParameter("boardSuperno") != null;
			if(isAnswer) {
				boardDto.setBoardSuperno(Integer.parseInt(mRequest.getParameter("boardSuperno")));
			}
			
			boardDao.update(boardDto);
			
			BoardImageDao boardImageDao = new BoardImageDao();
			BoardImageDto boardImageDto = new BoardImageDto();
			
			//existing = 기존파일, new = 신규파일, delete = 파일삭제
			String selectImage = mRequest.getParameter("selectImage");
			System.out.println("selectImage = " + selectImage);
			switch(selectImage) {
			case "new":
				boardImageDao.deleteByBoardNo(boardNo);
				//실제 파일도 삭제해야함
				boardImageDto.setBoardNo(boardNo);
				boardImageDto.setBoardSaveName(mRequest.getFilesystemName("attach"));
				boardImageDto.setBoardUploadName(mRequest.getOriginalFileName("attach"));
				boardImageDto.setBoardFileType(mRequest.getContentType("attach"));
				File target = mRequest.getFile("attach");
				
				if(target!=null) {
					boardImageDto.setBoardFileSize(target.length());
					
					boardImageDao.insert(boardImageDto);				
				}
				break;
			case "delete":
				boardImageDao.deleteByBoardNo(boardNo);
				//실제 파일도 삭제해야함
				break;
			case "existing":
				break;
			}
			
			response.sendRedirect(request.getContextPath()+"/board/detail.jsp?no="+boardNo);
		} catch (Exception e) {
			response.sendError(500);
			e.printStackTrace();
		}
	}

}

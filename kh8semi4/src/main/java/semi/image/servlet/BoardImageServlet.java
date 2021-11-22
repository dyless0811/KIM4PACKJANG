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

import semi.beans.BoardImageDao;
import semi.beans.BoardImageDto;

@WebServlet("/board/boardImage.kj")
public class BoardImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int boardNo =Integer.parseInt(request.getParameter("no"));
			//처리
			BoardImageDao boardIamgeDao= new BoardImageDao();
			BoardImageDto boardImageDto = boardIamgeDao.getByBoardNo(boardNo);
			
			File dir=new File("C:/upload/kh84/board");
			File target =new File(dir,boardImageDto.getBoardSaveName());
			InputStream in = new FileInputStream(target);
			byte[] buffer = new byte[8192];
			
			String encodeFilename = URLEncoder.encode(boardImageDto.getBoardUploadName(), "UTF-8");
			encodeFilename = encodeFilename.replace("+", "%20");
			
			response.setHeader("Content-Type", "application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\""+encodeFilename+"\"");
			response.setHeader("Content-Encoding", "UTF-8");
			response.setHeader("Content-Length", String.valueOf(boardImageDto.getBoardFileSize()));
			
			while(true) {
				int size = in.read(buffer);
				if(size == -1) break;
				response.getOutputStream().write(buffer, 0, size);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(500);
		}
	}

}

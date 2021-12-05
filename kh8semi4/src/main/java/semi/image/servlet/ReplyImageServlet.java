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
import semi.beans.ReplyImageDao;
import semi.beans.ReplyImageDto;

@WebServlet("/board/replyImage.kj")
public class ReplyImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int replyNo =Integer.parseInt(request.getParameter("no"));
			//처리
			ReplyImageDao replyIamgeDao= new ReplyImageDao();
			ReplyImageDto replyImageDto = replyIamgeDao.getByReplyNo(replyNo);
			
			File dir=new File("D:/upload/kh84/reply");
			File target =new File(dir,replyImageDto.getReplySaveName());
			InputStream in = new FileInputStream(target);
			byte[] buffer = new byte[8192];
			
			String encodeFilename = URLEncoder.encode(replyImageDto.getReplyUploadName(), "UTF-8");
			encodeFilename = encodeFilename.replace("+", "%20");
			
			response.setHeader("Content-Type", "application/octet-stream");
			response.setHeader("Content-Disposition", "attachment; filename=\""+encodeFilename+"\"");
			response.setHeader("Content-Encoding", "UTF-8");
			response.setHeader("Content-Length", String.valueOf(replyImageDto.getReplyFileSize()));
			
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

package semi.beans;

import java.util.Date;

public class BoardDto {
	private int no;
	private String memberId;
	private int boardTypeNo;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int boardHit;
	private int boardSuperno;
	private int boardGroupno;
	private int boardDepth;
	
	public BoardDto() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBoardTypeNo() {
		return boardTypeNo;
	}

	public void setBoardTypeNo(int boardTypeNo) {
		this.boardTypeNo = boardTypeNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}

	public int getBoardSuperno() {
		return boardSuperno;
	}

	public void setBoardSuperno(int boardSuperno) {
		this.boardSuperno = boardSuperno;
	}

	public int getBoardGroupno() {
		return boardGroupno;
	}

	public void setBoardGroupno(int boardGroupno) {
		this.boardGroupno = boardGroupno;
	}

	public int getBoardDepth() {
		return boardDepth;
	}

	public void setBoardDepth(int boardDepth) {
		this.boardDepth = boardDepth;
	}
}
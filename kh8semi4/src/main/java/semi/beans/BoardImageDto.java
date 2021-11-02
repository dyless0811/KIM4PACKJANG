package semi.beans;

public class BoardImageDto {
	private int no;
	private int boardNo;
	private String boardUploadName;
	private String boardSaveName;
	private long boardFileSize;
	private String boardFileType;
	
	
	//setter & getter
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardUploadName() {
		return boardUploadName;
	}
	public void setBoardUploadName(String boardUploadName) {
		this.boardUploadName = boardUploadName;
	}
	public String getBoardSaveName() {
		return boardSaveName;
	}
	public void setBoardSaveName(String boardSaveName) {
		this.boardSaveName = boardSaveName;
	}
	public long getBoardFileSize() {
		return boardFileSize;
	}
	public void setBoardFileSize(long boardFileSize) {
		this.boardFileSize = boardFileSize;
	}
	public String getBoardFileType() {
		return boardFileType;
	}
	public void setBoardFileType(String boardFileType) {
		this.boardFileType = boardFileType;
	}
	
	
	//생성자
	public BoardImageDto() {
		super();
	}
	
	//to String
	@Override
	public String toString() {
		return "BoardImageDto [no=" + no + ", boardNo=" + boardNo + ", boardUploadName=" + boardUploadName
				+ ", boardSaveName=" + boardSaveName + ", boardFileSize=" + boardFileSize + ", boardFileType="
				+ boardFileType + "]";
	}
	
	
	
	
	

}

package semi.beans;

public class ReplyImageDto {
	private int no;
	private int replyNo;
	private String replyUploadName;
	private String replySaveName;
	private long replyFileSize;
	private String replyFileType;
	
	//setter getter 
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyUploadName() {
		return replyUploadName;
	}
	public void setReplyUploadName(String replyUploadName) {
		this.replyUploadName = replyUploadName;
	}
	public String getReplySaveName() {
		return replySaveName;
	}
	public void setReplySaveName(String replySaveName) {
		this.replySaveName = replySaveName;
	}
	public long getReplyFileSize() {
		return replyFileSize;
	}
	public void setReplyFileSize(long replyFileSize) {
		this.replyFileSize = replyFileSize;
	}
	public String getReplyFileType() {
		return replyFileType;
	}
	public void setReplyFileType(String replyFileType) {
		this.replyFileType = replyFileType;
	}
	//tostring
	@Override
	public String toString() {
		return "ReplyImageDto [no=" + no + ", replyNo=" + replyNo + ", replyUploadName=" + replyUploadName
				+ ", replySaveName=" + replySaveName + ", replyFileSize=" + replyFileSize + ", replyFileType="
				+ replyFileType + "]";
	}
	//기본생성자
	public ReplyImageDto() {
		super();
	}

	
	
	
	
	

}

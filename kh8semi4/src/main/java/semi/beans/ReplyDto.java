package semi.beans;

import java.util.Date;

public class ReplyDto {
	private int no;
	private int buyNo;
	private int starPoint;
	private String content;
	private Date time;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBuyNo() {
		return buyNo;
	}
	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "ReplyDto [no=" + no + ", buyNo=" + buyNo + ", starPoint=" + starPoint + ", content=" + content
				+ ", time=" + time + "]";
	}
	
	
}

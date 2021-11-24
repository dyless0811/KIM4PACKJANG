package semi.beans;

import java.sql.Date;

public class MemberLogDto {
	private int logNo;
	private String memberId;
	private Date loginDate;
	public MemberLogDto() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	public int getLogNo() {
		return logNo;
	}
	public void setLogNo(int logNo) {
		this.logNo = logNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
}

package semi.vo;


public class MemberAgeVo {
	private String age;
	private String memberid;

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getAge() {
		return age;
	}
	
	//연도만 반환하는 가상의 게터
	public String getYearBirth() {
		return age.substring(0, 4);
	}
	public void setAge(String age) {
		this.age = age;
	}

	public MemberAgeVo() {
		super();
		// TODO 자동 생성된 생성자 스텁
	}
	
}

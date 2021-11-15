package semi.beans;

import java.sql.Date;

public class MemberDto {
	
	private String id;
	private String pw;
	private String name;
	private String address;
	private String phone;
	private String email;
	private String birth;
	private Date join;
	private int point;
	private String grade;
	private String gender;
	
	public MemberDto() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}
	
	public String getMemberBirthDay() {
		return birth.substring(0, 10);
	}
	

	public void setBirth(String birth) {
		this.birth = birth;
	}
	

	public Date getJoin() {
		return join;
	}

	public void setJoin(Date join) {
		this.join = join;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
}

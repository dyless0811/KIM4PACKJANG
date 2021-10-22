package semi.beans;

import java.sql.Date;

public class MemberDto {
private String Id;
private String Pw;
private String name;
private String address;
private String phone;
private String email;
private Date birth;
private Date join;
private int point;
private String grade;

//setter & getter 
public String getId() {
	return Id;
}
public void setId(String id) {
	Id = id;
}
public String getPw() {
	return Pw;
}
public void setPw(String pw) {
	Pw = pw;
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
public Date getBirth() {
	return birth;
}
public void setBirth(Date birth) {
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
//기본생성자
public MemberDto() {
	super();
}





	
}


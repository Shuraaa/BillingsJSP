package model;

public class TaiKhoan {

	private String userName;

	private String userPass;

	private int role;

	private String congTyID;
	public TaiKhoan(String userName, String userPass, int role, String congTyID) {
		super();
		this.userName = userName;
		this.userPass = userPass;
		this.role = role;
		this.congTyID = congTyID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getCongTyID() {
		return congTyID;
	}
	public void setCongTyID(String congTyID) {
		this.congTyID = congTyID;
	}
	public TaiKhoan() {
		super();
	}
	@Override
	public String toString() {
		return "TaiKhoan [userName=" + userName + ", userPass=" + userPass
				+ ", role=" + role + ", congTyID=" + congTyID + "]";
	}
	

}

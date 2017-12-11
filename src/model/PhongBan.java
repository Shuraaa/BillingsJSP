package model;


public class PhongBan {
	
	private String phongBanID;

	private String tenPhongBan;

	private String congTyID;
	public PhongBan(String phongBanID, String tenPhongBan, String congTyID) {
		super();
		this.phongBanID = phongBanID;
		this.tenPhongBan = tenPhongBan;
		this.congTyID = congTyID;
	}
	public String getPhongBanID() {
		return phongBanID;
	}
	public void setPhongBanID(String phongBanID) {
		this.phongBanID = phongBanID;
	}
	public String getTenPhongBan() {
		return tenPhongBan;
	}
	public void setTenPhongBan(String tenPhongBan) {
		this.tenPhongBan = tenPhongBan;
	}
	public String getCongTyID() {
		return congTyID;
	}
	public void setCongTyID(String congTyID) {
		this.congTyID = congTyID;
	}
	public PhongBan() {
		super();
	}
	@Override
	public String toString() {
		return "PhongBan [phongBanID=" + phongBanID + ", tenPhongBan="
				+ tenPhongBan + ", congTyID=" + congTyID + "]";
	}
	

}

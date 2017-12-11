package model;

public class CongTy {

	private String congTyID;

	private String tenCongTy;

	private String logo;

	private String maSoThue;

	private String diaChi;

	private String dienThoai;

	private String email;

	private double tiLeMakeUp;

	public CongTy(String congTyID, String tenCongTy, String logo, String maSoThue, String diaChi, String dienThoai,
			String email, double tiLeMakeUp) {
		super();
		this.congTyID = congTyID;
		this.tenCongTy = tenCongTy;
		this.logo = logo;
		this.maSoThue = maSoThue;
		this.diaChi = diaChi;
		this.dienThoai = dienThoai;
		this.email = email;
		this.tiLeMakeUp = tiLeMakeUp;
	}

	public String getCongTyID() {
		return congTyID;
	}

	public void setCongTyID(String congTyID) {
		this.congTyID = congTyID;
	}

	public String getTenCongTy() {
		return tenCongTy;
	}

	public void setTenCongTy(String tenCongTy) {
		this.tenCongTy = tenCongTy;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getMaSoThue() {
		return maSoThue;
	}

	public void setMaSoThue(String maSoThue) {
		this.maSoThue = maSoThue;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getDienThoai() {
		return dienThoai;
	}

	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getTiLeMakeUp() {
		return tiLeMakeUp;
	}

	public void setTiLeMakeUp(double tiLeMakeUp) {
		this.tiLeMakeUp = tiLeMakeUp;
	}

	public CongTy() {
		super();
	}

	@Override
	public String toString() {
		return "CongTy [congTyID=" + congTyID + ", tenCongTy=" + tenCongTy + ", logo=" + logo + ", maSoThue=" + maSoThue
				+ ", diaChi=" + diaChi + ", dienThoai=" + dienThoai + ", email=" + email + ", tiLeMakeUp=" + tiLeMakeUp
				+ "]";
	}
}

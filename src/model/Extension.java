package model;


public class Extension {
	
	private String extensionID;

	private String tenNguoiDung;

	private String dauSoSuDung;

	private String phongBanID;
	public Extension(String extensionID, String tenNguoiDung,
			String dauSoSuDung, String phongBanID) {
		super();
		this.extensionID = extensionID;
		this.tenNguoiDung = tenNguoiDung;
		this.dauSoSuDung = dauSoSuDung;
		this.phongBanID = phongBanID;
	}
	public String getExtensionID() {
		return extensionID;
	}
	public void setExtensionID(String extensionID) {
		this.extensionID = extensionID;
	}
	public String getTenNguoiDung() {
		return tenNguoiDung;
	}
	public void setTenNguoiDung(String tenNguoiDung) {
		this.tenNguoiDung = tenNguoiDung;
	}
	public String getDauSoSuDung() {
		return dauSoSuDung;
	}
	public void setDauSoSuDung(String dauSoSuDung) {
		this.dauSoSuDung = dauSoSuDung;
	}
	public String getPhongBanID() {
		return phongBanID;
	}
	public void setPhongBanID(String phongBanID) {
		this.phongBanID = phongBanID;
	}
	public Extension() {
		super();
	}
	@Override
	public String toString() {
		return "Extension [extensionID=" + extensionID + ", tenNguoiDung="
				+ tenNguoiDung + ", dauSoSuDung=" + dauSoSuDung
				+ ", phongBanID=" + phongBanID + "]";
	}
	

}

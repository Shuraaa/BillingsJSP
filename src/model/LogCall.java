package model;

public class LogCall {
	private String congTyID;
	private String tenCongTy;
	private String extensionID;
	private String thueBaoNhan;
	private String phongBanID;
	private String tenPhongBan;
	private int thoiGianGoi;
	private int thang;
	private String loaiCuocGoi;
	private double giaTien;
	private String thoiGianBatDau;
	private String thoiGianKetThuc;
	private String importID;

	public LogCall(String congTyID, String tenCongTy, String extensionID, String thueBaoNhan, String phongBanID,
			String tenPhongBan, int thoiGianGoi, int thang, String loaiCuocGoi, double giaTien, String thoiGianBatDau,
			String thoiGianKetThuc) {
		super();
		this.congTyID = congTyID;
		this.tenCongTy = tenCongTy;
		this.extensionID = extensionID;
		this.thueBaoNhan = thueBaoNhan;
		this.phongBanID = phongBanID;
		this.tenPhongBan = tenPhongBan;
		this.thoiGianGoi = thoiGianGoi;
		this.thang = thang;
		this.loaiCuocGoi = loaiCuocGoi;
		this.giaTien = giaTien;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
	}

	public LogCall(String extensionID, String thueBaoNhan, int thoiGianGoi, String thoiGianBatDau,
			String thoiGianKetThuc, String importID) {
		super();
		this.extensionID = extensionID;
		this.thueBaoNhan = thueBaoNhan;
		this.thoiGianGoi = thoiGianGoi;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
		this.importID = importID;
	}

	public String getImportID() {
		return importID;
	}

	public void setImportID(String importID) {
		this.importID = importID;
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

	public String getExtensionID() {
		return extensionID;
	}

	public void setExtensionID(String extensionID) {
		this.extensionID = extensionID;
	}

	public String getThueBaoNhan() {
		return thueBaoNhan;
	}

	public void setThueBaoNhan(String thueBaoNhan) {
		this.thueBaoNhan = thueBaoNhan;
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

	public int getThoiGianGoi() {
		return thoiGianGoi;
	}

	public void setThoiGianGoi(int thoiGianGoi) {
		this.thoiGianGoi = thoiGianGoi;
	}

	public int getThang() {
		return thang;
	}

	public void setThang(int thang) {
		this.thang = thang;
	}

	public String getLoaiCuocGoi() {
		return loaiCuocGoi;
	}

	public void setLoaiCuocGoi(String loaiCuocGoi) {
		this.loaiCuocGoi = loaiCuocGoi;
	}

	public double getGiaTien() {
		return giaTien;
	}

	public void setGiaTien(double giaTien) {
		this.giaTien = giaTien;
	}

	public String getThoiGianBatDau() {
		return thoiGianBatDau;
	}

	public void setThoiGianBatDau(String thoiGianBatDau) {
		this.thoiGianBatDau = thoiGianBatDau;
	}

	public String getThoiGianKetThuc() {
		return thoiGianKetThuc;
	}

	public void setThoiGianKetThuc(String thoiGianKetThuc) {
		this.thoiGianKetThuc = thoiGianKetThuc;
	}

	@Override
	public String toString() {
		return "LogCall [congTyID=" + congTyID + ", tenCongTy=" + tenCongTy + ", extensionID=" + extensionID
				+ ", thueBaoNhan=" + thueBaoNhan + ", phongBanID=" + phongBanID + ", tenPhongBan=" + tenPhongBan
				+ ", thoiGianGoi=" + thoiGianGoi + ", thang=" + thang + ", loaiCuocGoi=" + loaiCuocGoi + ", giaTien="
				+ giaTien + ", thoiGianBatDau=" + thoiGianBatDau + ", thoiGianKetThuc=" + thoiGianKetThuc
				+ ", importID=" + importID + "]";
	}
}
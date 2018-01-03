package model;

import java.util.Date;

public class LogCall {
	private String congTyID;
	private String tenCongTy;
	private String extensionID;
	private String thueBaoNhan;
	private String phongBanID;
	private String tenPhongBan;
	private int thoiGianGoi;
	private Date ngayGoi;
	private String loaiCuocGoi;
	private double giaTien;
	public LogCall(String congTyID, String tenCongTy, String extensionID,
			String thueBaoNhan, String phongBanID, String tenPhongBan,
			int thoiGianGoi, Date ngayGoi, String loaiCuocGoi, double giaTien) {
		super();
		this.congTyID = congTyID;
		this.tenCongTy = tenCongTy;
		this.extensionID = extensionID;
		this.thueBaoNhan = thueBaoNhan;
		this.phongBanID = phongBanID;
		this.tenPhongBan = tenPhongBan;
		this.thoiGianGoi = thoiGianGoi;
		this.ngayGoi = ngayGoi;
		this.loaiCuocGoi = loaiCuocGoi;
		this.giaTien = giaTien;
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
	public Date getNgayGoi() {
		return ngayGoi;
	}
	public void setNgayGoi(Date ngayGoi) {
		this.ngayGoi = ngayGoi;
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
	@Override
	public String toString() {
		return "LogCall [congTyID=" + congTyID + ", tenCongTy=" + tenCongTy
				+ ", extensionID=" + extensionID + ", thueBaoNhan="
				+ thueBaoNhan + ", phongBanID=" + phongBanID + ", tenPhongBan="
				+ tenPhongBan + ", thoiGianGoi=" + thoiGianGoi + ", ngayGoi="
				+ ngayGoi + ", loaiCuocGoi=" + loaiCuocGoi + ", giaTien="
				+ giaTien + "]";
	}
	
}

	
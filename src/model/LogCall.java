package model;

public class LogCall {

	private int logID;

	private String extensionID;

	private String thueBaoNhan;

	private int thoiGianGoi;

	private double giaTien;

	private String loaiCuocGoi;

	private String nhaMangID;

	private String maCuocGoi;

	public LogCall(int logID, String extensionID, String thueBaoNhan, int thoiGianGoi, double giaTien,
			String loaiCuocGoi, String nhaMangID, String maCuocGoi) {
		super();
		this.logID = logID;
		this.extensionID = extensionID;
		this.thueBaoNhan = thueBaoNhan;
		this.thoiGianGoi = thoiGianGoi;
		this.giaTien = giaTien;
		this.loaiCuocGoi = loaiCuocGoi;
		this.nhaMangID = nhaMangID;
		this.maCuocGoi = maCuocGoi;
	}

	public int getLogID() {
		return logID;
	}

	public void setLogID(int logID) {
		this.logID = logID;
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

	public int getThoiGianGoi() {
		return thoiGianGoi;
	}

	public void setThoiGianGoi(int thoiGianGoi) {
		this.thoiGianGoi = thoiGianGoi;
	}

	public double getGiaTien() {
		return giaTien;
	}

	public void setGiaTien(double giaTien) {
		this.giaTien = giaTien;
	}

	public String getLoaiCuocGoi() {
		return loaiCuocGoi;
	}

	public void setLoaiCuocGoi(String loaiCuocGoi) {
		this.loaiCuocGoi = loaiCuocGoi;
	}

	public String getNhaMangID() {
		return nhaMangID;
	}

	public void setNhaMangID(String nhaMangID) {
		this.nhaMangID = nhaMangID;
	}

	public String getMaCuocGoi() {
		return maCuocGoi;
	}

	public void setMaCuocGoi(String maCuocGoi) {
		this.maCuocGoi = maCuocGoi;
	}

	public LogCall() {
		super();
	}

	@Override
	public String toString() {
		return "LogCall [logID=" + logID + ", extensionID=" + extensionID + ", thueBaoNhan=" + thueBaoNhan
				+ ", thoiGianGoi=" + thoiGianGoi + ", giaTien=" + giaTien + ", loaiCuocGoi=" + loaiCuocGoi
				+ ", nhaMangID=" + nhaMangID + ", maCuocGoi=" + maCuocGoi + "]";
	}
}

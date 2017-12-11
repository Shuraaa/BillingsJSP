package model;


public class DauSo {

	private String dauSoSuDung;

	private String congTyID;

	private String nhaMangID;
	public DauSo(String dauSoSuDung, String congTyID, String nhaMangID) {
		super();
		this.dauSoSuDung = dauSoSuDung;
		this.congTyID = congTyID;
		this.nhaMangID = nhaMangID;
	}
	public String getDauSoSuDung() {
		return dauSoSuDung;
	}
	public void setDauSoSuDung(String dauSoSuDung) {
		this.dauSoSuDung = dauSoSuDung;
	}
	public String getCongTyID() {
		return congTyID;
	}
	public void setCongTyID(String congTyID) {
		this.congTyID = congTyID;
	}
	public String getNhaMangID() {
		return nhaMangID;
	}
	public void setNhaMangID(String nhaMangID) {
		this.nhaMangID = nhaMangID;
	}
	public DauSo() {
		super();
	}
	@Override
	public String toString() {
		return "DauSo [dauSoSuDung=" + dauSoSuDung + ", congTyID=" + congTyID
				+ ", nhaMangID=" + nhaMangID + "]";
	}
	
}

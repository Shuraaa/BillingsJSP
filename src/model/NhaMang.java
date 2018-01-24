package model;

public class NhaMang {

	private String nhaMang_ID;
	private String tenNhaMang;

	public NhaMang(String nhaMang_ID, String tenNhaMang) {
		super();
		this.nhaMang_ID = nhaMang_ID;
		this.tenNhaMang = tenNhaMang;
	}

	public String getNhaMang_ID() {
		return nhaMang_ID;
	}

	public void setNhaMang_ID(String nhaMang_ID) {
		this.nhaMang_ID = nhaMang_ID;
	}

	public String getTenNhaMang() {
		return tenNhaMang;
	}

	public void setTenNhaMang(String tenNhaMang) {
		this.tenNhaMang = tenNhaMang;
	}

	@Override
	public String toString() {
		return "NhaMang [nhaMang_ID=" + nhaMang_ID + ", tenNhaMang=" + tenNhaMang + "]";
	}

}

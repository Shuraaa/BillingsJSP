package model;




public class Blocks {


	private String loaiCuocGoi;

	private String nhaMangID;

	private String maCuocGoi;

	private double block1s;

	private double block6s;

	private double block10s;
	private double blocks1m;
	public Blocks(String loaiCuocGoi, String nhaMangID, String maCuocGoi,
			double block1s, double block6s, double block10s, double blocks1m) {
		super();
		this.loaiCuocGoi = loaiCuocGoi;
		this.nhaMangID = nhaMangID;
		this.maCuocGoi = maCuocGoi;
		this.block1s = block1s;
		this.block6s = block6s;
		this.block10s = block10s;
		this.blocks1m = blocks1m;
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
	public double getBlock1s() {
		return block1s;
	}
	public void setBlock1s(double block1s) {
		this.block1s = block1s;
	}
	public double getBlock6s() {
		return block6s;
	}
	public void setBlock6s(double block6s) {
		this.block6s = block6s;
	}
	public double getBlock10s() {
		return block10s;
	}
	public void setBlock10s(double block10s) {
		this.block10s = block10s;
	}
	public double getBlocks1m() {
		return blocks1m;
	}
	public void setBlocks1m(double blocks1m) {
		this.blocks1m = blocks1m;
	}
	public Blocks() {
		super();
	}
	@Override
	public String toString() {
		return "Blocks [loaiCuocGoi=" + loaiCuocGoi + ", nhaMangID="
				+ nhaMangID + ", maCuocGoi=" + maCuocGoi + ", block1s="
				+ block1s + ", block6s=" + block6s + ", block10s=" + block10s
				+ ", blocks1m=" + blocks1m + "]";
	}
	
}

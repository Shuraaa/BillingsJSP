/**
 * 
 * @author VinhPhu
 *
 */
package model;

/**
 * @author pc
 *
 */
public class LichSu {
	private String importID;
	private String ngayImport;
	private String tenFile;
	private int soDong;

	public LichSu(String importID, String ngayImport, String tenFile, int soDong) {
		super();
		this.importID = importID;
		this.ngayImport = ngayImport;
		this.tenFile = tenFile;
		this.soDong = soDong;
	}

	public String getImportID() {
		return importID;
	}

	public void setImportID(String importID) {
		this.importID = importID;
	}

	public String getNgayImport() {
		return ngayImport;
	}

	public void setNgayImport(String ngayImport) {
		this.ngayImport = ngayImport;
	}

	public String getTenFile() {
		return tenFile;
	}

	public void setTenFile(String tenFile) {
		this.tenFile = tenFile;
	}

	public int getSoDong() {
		return soDong;
	}

	public void setSoDong(int soDong) {
		this.soDong = soDong;
	}
}
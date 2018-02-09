package model;

public class Regex {
	private String ten;
	private String regex;
	private double block1sFPT;
	private double block6sFPT;
	private double block10sFPT;
	private double block1mFPT;
	private double block1sCMC;
	private double block6sCMC;
	private double block10sCMC;
	private double block1mCMC;

	public Regex(String ten, String regex, double block1sFPT, double block6sFPT, double block10sFPT, double block1mFPT,
			double block1sCMC, double block6sCMC, double block10sCMC, double block1mCMC) {
		super();
		this.ten = ten;
		this.regex = regex;
		this.block1sFPT = block1sFPT;
		this.block6sFPT = block6sFPT;
		this.block10sFPT = block10sFPT;
		this.block1mFPT = block1mFPT;
		this.block1sCMC = block1sCMC;
		this.block6sCMC = block6sCMC;
		this.block10sCMC = block10sCMC;
		this.block1mCMC = block1mCMC;
	}

	public Regex() {
		super();
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getRegex() {
		return regex;
	}

	public void setRegex(String regex) {
		this.regex = regex;
	}

	public double getBlock1sFPT() {
		return block1sFPT;
	}

	public void setBlock1sFPT(double block1sFPT) {
		this.block1sFPT = block1sFPT;
	}

	public double getBlock6sFPT() {
		return block6sFPT;
	}

	public void setBlock6sFPT(double block6sFPT) {
		this.block6sFPT = block6sFPT;
	}

	public double getBlock10sFPT() {
		return block10sFPT;
	}

	public void setBlock10sFPT(double block10sFPT) {
		this.block10sFPT = block10sFPT;
	}

	public double getBlock1mFPT() {
		return block1mFPT;
	}

	public void setBlock1mFPT(double block1mFPT) {
		this.block1mFPT = block1mFPT;
	}

	public double getBlock1sCMC() {
		return block1sCMC;
	}

	public void setBlock1sCMC(double block1sCMC) {
		this.block1sCMC = block1sCMC;
	}

	public double getBlock6sCMC() {
		return block6sCMC;
	}

	public void setBlock6sCMC(double block6sCMC) {
		this.block6sCMC = block6sCMC;
	}

	public double getBlock10sCMC() {
		return block10sCMC;
	}

	public void setBlock10sCMC(double block10sCMC) {
		this.block10sCMC = block10sCMC;
	}

	public double getBlock1mCMC() {
		return block1mCMC;
	}

	public void setBlock1mCMC(double block1mCMC) {
		this.block1mCMC = block1mCMC;
	}

	@Override
	public String toString() {
		return "Regex [ten=" + ten + ", regex=" + regex + ", block1sFPT=" + block1sFPT + ", block6sFPT=" + block6sFPT
				+ ", block10sFPT=" + block10sFPT + ", block1mFPT=" + block1mFPT + ", block1sCMC=" + block1sCMC
				+ ", block6sCMC=" + block6sCMC + ", block10sCMC=" + block10sCMC + ", block1mCMC=" + block1mCMC + "]";
	}
}

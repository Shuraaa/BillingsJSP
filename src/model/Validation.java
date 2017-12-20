package model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
	// return true if st is null or blank
	public boolean checkNull(String st) {
		if (st.equals("") || st == null) {
			return true;
		}
		return false;

	}

	// Check Length
	public boolean checkLength(String st, int min) {
		if (st.length() >= min) {
			return true;
		}
		return false;
	}

	// Check Password
	public boolean checkPass(String a, String b) {
		if (!a.equals(b)) {
			return false;
		}
		return true;
	}

	// Check Email
	public boolean checkEmail(String st) {
		String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		Pattern p = Pattern.compile(EMAIL_PATTERN);
		Matcher m = p.matcher(st);
		if (this.checkNull(st))
			return true;
		else
			return m.matches();
	}

	// check ti le make up
	public boolean checkTiLeMakeUp(String st) {
		String number_pattern = "^[0-9]{1,3}$";
		Pattern p = Pattern.compile(number_pattern);
		Matcher m = p.matcher(st);
		if (this.checkNull(st))
			return true;
		else
			return m.matches();
	}

	// check sdt
	public boolean checkPhoneNumber(String phoneNumber) {
		String PHONE_PATTERN = "^[0-9+]{6,15}$";
		Pattern p = Pattern.compile(PHONE_PATTERN);
		Matcher m = p.matcher(phoneNumber);
		if (this.checkNull(phoneNumber))
			return true;
		else
			return m.matches();
	}

	public static void main(String[] args) {
		Validation va = new Validation();
		System.out.println(va.checkNull("1"));
	}
}

package model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validation {
	public boolean checkNull(String st) {
		if (st.length() == 0) {
			return true;
		} else if (st.contains(" ")) {
			return true;
		}
		return false;

	}

	// Check Length
	public boolean checkLength(String st, int min, int max) {
		if (st.length() >= min && st.length() <= max) {
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
		return m.matches();
	}
}

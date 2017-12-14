package model;

import java.security.SecureRandom;
import java.util.Random;

public class RandomString {

	public String generateRandomPassword(int leng) {
		Random RANDOM = new SecureRandom();

		String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789";

		String pw = "";
		for (int i = 0; i < leng; i++) {
			int index = (int) (RANDOM.nextDouble() * letters.length());
			pw += letters.substring(index, index + 1);
		}
		return pw;
	}
}

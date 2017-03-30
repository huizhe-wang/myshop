package com.shop.utils;

import java.util.UUID;

/**
 * Generates a random string 
 */

public class UUIDUtils {
	/**
	 * Get a string randomly
	 * @return
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString().replace("-", "");
	}
}

package com.shop.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Security Code
 */
@Controller
public class CheckImgController {
	@RequestMapping("getCheckCodeImage")
	public String getImage(HttpSession session,HttpServletResponse response) throws Exception {
		int width = 120;
		int height = 30;
		
		// 1. draw a bufferedImage
		BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		// 2. set background 
		// get Object
		Graphics graphics = bufferedImage.getGraphics();
		// setColor
		graphics.setColor(getRandColor(200, 250));
		graphics.fillRect(0, 0, width, height);
		
		// 3. set border
		graphics.setColor(Color.WHITE);
		graphics.drawRect(0, 0, width-1, height-1);
		
		// four random number
		Graphics2D graphics2d = (Graphics2D) graphics;
		// setFont
		graphics2d.setFont(new Font("Times New Roman", Font.BOLD, 20));
		
		String words = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		
		Random random = new Random();
		// define StringBuffer
		StringBuffer sb = new StringBuffer();
		
		// define x
		int x = 10;
		for (int i = 0; i < 4; i++) {
			// random color
			graphics2d.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			// rotate -30 - 30
			int jiaodu = random.nextInt(60) - 30;
			// radian
			double theta = jiaodu * Math.PI / 180;
			// generate a random number from index[0] to index[length-1]
			int index = random.nextInt(words.length()); 
			// get number
			char c = words.charAt(index);
			sb.append(c);
			//out.print image
			graphics2d.rotate(theta,x,20);
			graphics2d.drawString(String.valueOf(c), x, 20);
			graphics2d.rotate(-theta, x, 20);
			x += 30;
		}
		// save the digits into session
		session.setAttribute("checkcode", sb.toString());
		// set interference lines
		graphics.setColor(getRandColor(160, 200));
		int x1;
		int x2;
		int y1;
		int y2;
		for (int i = 0; i < 30; i++) {
			x1 = random.nextInt(width);
			x2 = random.nextInt(12);
			y1 = random.nextInt(height);
			y2 = random.nextInt(12);
			graphics.drawLine(x1, y1, x1 + x2, x2 + y2);
		}
		// print the image on browser ImageIO
		graphics.dispose();
		ImageIO.write(bufferedImage, "jpg", response.getOutputStream());
		return null;
	}
	
	/**
	 * colors in range
	 * 
	 * @param fc
	 *            int range 1
	 * @param bc
	 *            int range 2
	 * @return Color
	 */
	private Color getRandColor(int fc, int bc) {
		// random color
		Random random = new Random();
		if (fc > 255) {
			fc = 255;
		}
		if (bc > 255) {
			bc = 255;
		}
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
}

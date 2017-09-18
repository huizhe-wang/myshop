package csye6220.assignment6.controller;

import java.io.OutputStream;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import csye6220.assignment6.account.*;
import csye6220.assignment6.dao.*;

@Controller
@RequestMapping("/rss")

public class controller {
	
	
	@Resource
	private accountDao service;

	@RequestMapping("/add")
	public void add(String title, String link, HttpServletResponse rep) {
		try {
			rep.setContentType("text/html;charset=UTF-8");
			OutputStream printWriter = null;

			printWriter = rep.getOutputStream();
			account account = null;
			account = new account(null, "URL", URLDecoder.decode(title, "utf-8"),
					URLDecoder.decode(link, "utf-8"));
			System.out.println(account.getID() + "," + account.getURL() + "," + account.getTITLE() + ","
					+ account.getLINK());
			service.add(account);
			printWriter.write("wang".getBytes());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("/index")
	public String toUserSpecify() {
		return "index";
	}

}

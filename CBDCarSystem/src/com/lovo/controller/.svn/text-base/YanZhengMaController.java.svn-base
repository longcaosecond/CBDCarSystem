package com.lovo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lovo.util.YanZhengMa;

@Controller
public class YanZhengMaController {

	@RequestMapping(path = "/getYanzhangma", method = RequestMethod.GET)
	public void getYanzhangma(HttpServletRequest request, HttpServletResponse response) throws IOException {
		YanZhengMa.outputCaptcha(request, response);
	}

	/**
	 * 验证输入的和生成的验证码是否一致
	 * 
	 * @param request
	 * @param out
	 */
	@RequestMapping(path = "/checkImageCode", method = RequestMethod.GET)
	public void checkImageCode(HttpServletRequest request, PrintWriter out) {
		String yanzhengma = request.getParameter("stringCode");
		String randomString = (String) request.getSession().getAttribute("randomString");
		if (randomString != null) {// 验证码没失效
			if (yanzhengma.equalsIgnoreCase(randomString)) {
				out.print("ok");
			} else {
				out.print("error");
			}
		} else {
			out.print("ImageCodeError");// 验证码失效
		}
	}
}

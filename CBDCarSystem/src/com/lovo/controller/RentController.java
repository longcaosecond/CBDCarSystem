package com.lovo.controller;

import java.io.File;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.lovo.bean.Rent;
import com.lovo.bean.User;
import com.lovo.service.RentService;
import com.lovo.util.PageBean;

@Controller
public class RentController {
	@Resource
	private RentService rentser;

	private SimpleDateFormat simpl = new SimpleDateFormat("yyyy-MM-dd");

	// 分页及模糊查询所有车位
	@RequestMapping(path = "/showAllRent", method = RequestMethod.POST)
	public @ResponseBody List<Object> showAllRent(String rentStartDate, String rentEndDate, int currentPage,
			BigDecimal minPrice, BigDecimal maxPrice, String rentAddress) throws java.text.ParseException {
		Date rentStartDat;
		try {
			rentStartDat = simpl.parse(rentStartDate);
			Date rentEndDat = simpl.parse(rentEndDate);
			PageBean page = new PageBean();
			page.setCurrentPage(currentPage);
			List<Rent> rents = rentser.selectAllRent(rentStartDat, rentEndDat, page, minPrice, maxPrice, rentAddress);
			int count = rentser.selectAllRentCount(rentStartDat, rentEndDat, currentPage, minPrice, maxPrice,
					rentAddress);
			page.setAll(count);
			page.getTotalPage();
			List<Object> objs = new ArrayList<Object>();
			objs.add(rents);
			objs.add(page);
			return objs;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 包租婆查看自己的所有车位
	@RequestMapping(path = "/findMyRents", method = RequestMethod.POST)
	public @ResponseBody List<Object> findMyRents(HttpSession session, int currentPage, String address,
			String startDate, String endDate, BigDecimal minPrice, BigDecimal maxPrice) {
		//从session中获取包租婆的个人信息
		User user = (User) session.getAttribute("user");
		Date startDat;
		Date endDat;
		try {
			startDat = simpl.parse(startDate);
			endDat = simpl.parse(endDate);
			if (user != null) {
				PageBean page = new PageBean();
				page.setCurrentPage(currentPage);
				List<Rent> rents = rentser.findMyRents(user.getUserId(), page, address, startDat, endDat, minPrice,
						maxPrice);
				int count = rentser.findMyRentsCount(user.getUserId(), page, address, startDat, endDat, minPrice,
						maxPrice);
				List<Object> objs = new ArrayList<Object>();
				objs.add(rents);
				page.setAll(count);
				page.getTotalPage();
				objs.add(page);
				return objs;
			}
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 根据id查询车位
	@RequestMapping(path = "/showRentById", method = RequestMethod.GET)
	public String showRentById(int rentId, HttpServletRequest req, HttpServletResponse res) {
		Rent rent = rentser.selectRentById(rentId);
		req.setAttribute("rent", rent);
		return "forward:jsp/user/vip/userRent.jsp";
	}

	// 包租婆上传新的车位
	@RequestMapping(path = "/addNewRent", method = RequestMethod.POST)
	public String addNewRent(HttpSession session, HttpServletRequest req, Rent rent,
			@RequestParam("rentCarPic") CommonsMultipartFile carFile,
			@RequestParam("rentPic") CommonsMultipartFile rentFile) {
		User user = (User) session.getAttribute("user");
		// 获取日期字符串
		String starData = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		// 车位图片
		String carNewFileName = System.currentTimeMillis() + carFile.getOriginalFilename();
		String carPath = req.getServletContext().getRealPath("images");
		// 产权证图片
		String rentNewFileName = System.currentTimeMillis() + rentFile.getOriginalFilename();
		String rentPath = req.getServletContext().getRealPath("uploadimg");
		File f = new File(carPath);
		if (!f.exists())
			f.mkdir();
		File file = new File(carPath);
		if (!file.exists())
			file.mkdir();
		Date starTime = null;
		Date endTime = null;
		try {
			starTime = simpl.parse(starData);
			endTime = simpl.parse(endDate);
			carFile.getFileItem().write(new File(carPath + File.separator + carNewFileName));
			rentFile.getFileItem().write(new File(rentPath + File.separator + rentNewFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		rent.setRentStartDate(starTime);
		rent.setRentEndDate(endTime);
		rent.setRentCarPicture(carNewFileName);
		rent.setRentPicture(rentNewFileName);
		rent.setUser(user);
		session.setAttribute("rent", rent);
		rentser.addRent(rent);
		return "redirect:jsp/user/vip/userout.jsp";
	}

	// 包租婆修改自己的车位信息
	@RequestMapping(path = "/updadaMyRents", method = RequestMethod.POST)
	public String updadaMyRent(Rent rent, @RequestParam("rentCarPic") CommonsMultipartFile carFile,
			HttpServletRequest req) {
		// 获取日期字符串
		String starData = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		// 获取车位图片
		String carNewFileName = System.currentTimeMillis() + carFile.getOriginalFilename();
		String carPath = req.getServletContext().getRealPath("images");
		File f = new File(carPath);
		if (!f.exists())
			f.mkdir();
		File file = new File(carPath);
		if (!file.exists())
			file.mkdir();
		Date starTime = null;
		Date endTime = null;
		try {
			starTime = simpl.parse(starData);
			endTime = simpl.parse(endDate);
			carFile.getFileItem().write(new File(carPath + File.separator + carNewFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 设置车位信息
		rent.setRentStartDate(starTime);
		rent.setRentEndDate(endTime);
		rent.setRentCarPicture(carNewFileName);
		req.getSession().setAttribute("rent", rent);
		// 调用方法修改车位信息
		rentser.updataMyRent(rent);
		return "redirect:jsp/user/vip/userout.jsp";
	}

	// 包租婆删除未出租的空闲车位
	@RequestMapping(path = "/deleteMyRent", method = RequestMethod.GET)
	public String deleteMyRent(Integer rentId, PrintWriter out) {
		// 不可删除: 0，删除成功:1
		int res = rentser.deleteMyRent(rentId);
		if (res == 1) {
			return "redirect:jsp/user/vip/userout.jsp?deletMsg=succes";
		} else {
			out.print("");
			return "redirect:jsp/user/vip/userout.jsp?deletMsg=false";
		}
	}

	// 根据产权号码验是否证重复
	@RequestMapping(path = "/checkMyRentByCnum", method = RequestMethod.POST)
	public void checkMyRent(String rentCnum, PrintWriter out) {
		// 没有重复:0 已经存在:1
		int res = rentser.findRentByNum(rentCnum);
		if (res == 0)
			out.print(0);
		if (res == 1)
			out.print(1);
	}
	// 根据id查询车位
	@RequestMapping(path = "/showRentByRentId", method = RequestMethod.GET)
	public String showRentByRentId(int rentId, HttpServletRequest req, HttpServletResponse res) {
		Rent rent = rentser.selectRentById(rentId);
		req.setAttribute("rent", rent);
		return "forward:all/showRent.jsp";
	}
}

package com.icia.itsmyplace.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.common.util.StringUtil;
import com.icia.itsmyplace.model.Cafe;
import com.icia.itsmyplace.model.CafePht;
import com.icia.itsmyplace.model.MenuPht;
import com.icia.itsmyplace.model.Order;
import com.icia.itsmyplace.model.Pay;
import com.icia.itsmyplace.model.Point;
import com.icia.itsmyplace.model.Response;
import com.icia.itsmyplace.model.Review;
import com.icia.itsmyplace.model.RsRv;
import com.icia.itsmyplace.model.Seat;
import com.icia.itsmyplace.model.SubArea;
import com.icia.itsmyplace.model.User;
import com.icia.itsmyplace.service.AreaService;
import com.icia.itsmyplace.service.CafeService;
import com.icia.itsmyplace.service.ReviewService;
import com.icia.itsmyplace.service.RsRvService;
import com.icia.itsmyplace.service.RsrvSeqService;
import com.icia.itsmyplace.service.UserService;
import com.icia.itsmyplace.util.CookieUtil;
import com.icia.itsmyplace.util.HttpUtil;
import com.icia.itsmyplace.util.JsonUtil;

import sun.nio.fs.DefaultFileSystemProvider;

@Controller("cafeController")
public class CafeController {
private static Logger logger = LoggerFactory.getLogger(CafeController.class);

	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CafeService cafeService;
	
	@Autowired
	private RsRvService rsRvService;
	
	@Autowired
	private RsrvSeqService rsrvSeqService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private AreaService areaService;
	
	private static final int LIST_COUNT = 4; 	// ??? ???????????? ????????? ???
	private static final int PAGE_COUNT = 1;	// ????????? ???
	

	
	//???????????????
	@RequestMapping(value="/cafe/intro", method=RequestMethod.GET)
	public String intro(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);//?????????????????????
		
		if(!StringUtil.isEmpty(cookieUserId)) {
			User user = userService.userSelect(cookieUserId);
			model.addAttribute("user", user);
		}
		List<Cafe> cafeList = cafeService.cafeList();
		
		List<String> cafeNumList = new ArrayList<String>();
		 
		 for(int i=0; i<cafeList.size(); i++) { 
			 String cafeNum = cafeService.cafeList().get(i).getCafeNum();
			 
			 SubArea subArea =  areaService.areaNameSelect(cafeList.get(i).getSubAreaNum());
			 
			 CafePht cafePht = new CafePht();
			 cafePht.setCafeNum(cafeNum);
			 cafePht.setPhtNum((short)2);
			 			 
			 List<CafePht> cafePhtList = cafeService.cafePhtList(cafePht);
			 List<Review> reviewList = reviewService.cafeReviewList(cafeNum);
			 
			 cafeList.get(i).setCafePhtList(cafePhtList);
			 cafeList.get(i).setReviewList(reviewList);
			 cafeList.get(i).setAreaName(subArea.getAreaName());
			 cafeList.get(i).setSubAreaName(subArea.getSubAreaName());
			 cafeNumList.add(cafeNum);
		 }
		 	
		 
//		List<Review> reviewList = new ArrayList<Review>();
//		
//		for(int i=0; i<cafeNumList.size(); i++)
//		{
//			List<Review> reviewListForSet = reviewService.allCafeReviewList(cafeNumList.get(i));
//			
//			reviewList.add(reviewListForSet.get(0));
//		}
		
		model.addAttribute("cafeList",cafeList);
//		model.addAttribute("reviewList", reviewList);
		//model.addAttribute("reviewMe", reviewMe);

		
		return "/cafe/intro";
	}
	
	//????????? ???????????????
	@RequestMapping(value="/cafe/detail", method=RequestMethod.GET)
    public String cafeDetail(Model model, HttpServletRequest request, HttpServletResponse response)
    {
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);//?????????????????????
		String cafeNum = HttpUtil.get(request, "cafeNum", "");
		
		if(!StringUtil.isEmpty(cookieUserId)) {
			User user = userService.userSelect(cookieUserId);
			model.addAttribute("user", user);
		}
		//????????? ?????????
		List<Review> list = null;
		list = reviewService.cafeReviewList(cafeNum);
		model.addAttribute("list", list);
		model.addAttribute("cafeNum", cafeNum);
				
		//content ??????????????? ????????? ??????
		//?????? cafeNum??? ??????
		
		List<String> bestSellerMenuNum = cafeService.BestSellerList(cafeNum);
		
		MenuPht menuPhtforSelect = new MenuPht();
		menuPhtforSelect.setCafeNum(cafeNum);
		
		List<MenuPht> menuPhtList = new ArrayList<MenuPht>();
		
		for(int i=0; i<bestSellerMenuNum.size(); i++)
		{
			menuPhtforSelect.setMenuNum(bestSellerMenuNum.get(i));
			MenuPht menuPht = cafeService.bestMenuPhtSelect(menuPhtforSelect);
			menuPhtList.add(menuPht);
		}

		model.addAttribute("menuPhtList", menuPhtList);
		
		Cafe cafe = cafeService.cafeSelect(cafeNum);
		CafePht cafePhtModelforPhtList = new CafePht();
		cafePhtModelforPhtList.setCafeNum(cafeNum);

		List<CafePht> cafephtList = cafeService.cafePhtList(cafePhtModelforPhtList);
		cafe.setCafePhtList(cafephtList);
		
		model.addAttribute("cafe", cafe);
		
		List<Cafe> cafeList = cafeService.cafeList();
		CafePht cafePhtAll = new CafePht();
		List<Cafe> cafeForAllList = new ArrayList<Cafe>();
		for(int j=0; j<cafeList.size(); j++)
		{	Cafe cafeForAll = new Cafe();
			cafePhtAll.setCafeNum(cafeList.get(j).getCafeNum());
			List<CafePht> cafePhtListAll = cafeService.cafePhtList(cafePhtAll);
			cafeForAll.setCafePhtList(cafePhtListAll);
			cafeForAll.setCafeNum(cafeList.get(j).getCafeNum());
			cafeForAll.setCafeName(cafeList.get(j).getCafeName());
			cafeForAll.setCafeOpnHrs(cafeList.get(j).getCafeOpnHrs());
			cafeForAll.setCafeClsHrs(cafeList.get(j).getCafeClsHrs());
			cafeForAll.setCafeAddr(cafeList.get(j).getCafeAddr());
			cafeForAllList.add(cafeForAll);
		}
		
		model.addAttribute("cafeForAllList", cafeForAllList);
		
        return "/cafe/detail";
    }

	//???????????? rsrvSeq RSRV, PAY, TBL_ORDER?????? ??????????????????
	//??????????????????(????????? ???????????? ????????????) cafeservice.cafeSelect(cafe)
	//???????????? RSRV?????? ????????????
	//????????? ??????(?????? ????????? ????????? ??????)  RSRV?????? DATE??? TIME ????????????
	//???????????? ORDER?????? MENU_NUM??? ???????????? CAFE_NUM??? ???????????? ?????? ????????????
	//??????????????? PAY??????????????? ???????????? TOTALPRICE
	//??????????????? ?????? ????????????

	
	//?????? ???. ?????? ????????? ????????? ?????? ???????????????
	@RequestMapping(value="/cafe/reservation", method=RequestMethod.GET)
	public String reservation(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);//?????????????????????
		String cafeNum = request.getParameter("cafeNum");
		
		//???????????????
		List<Seat> seat = null;
		
		if(!StringUtil.isEmpty(cookieUserId))
		{
			User user = userService.userSelect(cookieUserId);
			model.addAttribute("user", user);
		}
			
		//?????? ??????
		Cafe cafe = cafeService.cafeSelect(cafeNum);
		model.addAttribute("cafe", cafe);
	
		//?????? ??????
		seat = cafeService.seatSelect(cafeNum);
		model.addAttribute("seat", seat);
			
		return "/cafe/reservation";
	}
	
	//?????? ???????????? ??????
	@RequestMapping(value="/cafe/reservationNext", method=RequestMethod.POST)
    public String reservationNext(ModelMap model, HttpServletRequest request, HttpServletResponse response)
    {
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);//?????????????????????
		String cafeNum = request.getParameter("cafeNum"); // ???????????? - ??????????????? 
		String arr = request.getParameter("arr"); //????????????(??????) - rsrv
		String timeSel = request.getParameter("timeSelA"); //??????????????? - rsrv
		int pplCnt = Integer.parseInt(request.getParameter("pplCnt")); // ?????????????????? - rsrv
		String clockServer = request.getParameter("clockServer"); //????????????(????????????) - rsrv
		
		User user = userService.userSelect(cookieUserId);
		
		long rsrvSeq = rsrvSeqService.selectRsrvSeq();
		System.out.println("CafeController rsrvSeq = " + rsrvSeq);
		RsRv rsRv = new RsRv();
		rsRv.setRsrvSeq(rsrvSeq);
		rsRv.setUserName(user.getUserName());
		rsRv.setRsrvTime(timeSel); //???????????? ??????????????????????????????????????????
		rsRv.setRsrvDate(clockServer); //????????????(??????)
		rsRv.setRsrvPplCnt(pplCnt); //?????????
		rsRv.setSeatList(arr); // 10,11,13
		model.addAttribute("rsRv", rsRv); // Reservation
		
		Cafe cafe = cafeService.cafeSelect(cafeNum);
		model.addAttribute("cafe", cafe); // cafeName

		//???????????????
		List<MenuPht> menuPht = null;		
		menuPht = cafeService.menuPhtSelect(cafeNum);
		model.addAttribute("menuPht", menuPht);
		
		model.addAttribute("user", user);
		
		return "/cafe/reservationNext";
    }
	
	@RequestMapping(value="/cafe/selectSeatTime", method=RequestMethod.POST)
	@ResponseBody
    public Response<Object> selectSeatTime(HttpServletRequest request, HttpServletResponse response)
    {
		int selectTime = Integer.parseInt(HttpUtil.get(request, "time"));
		
		String cafeNum = HttpUtil.get(request, "cafeNum");
		
		int timeA =  selectTime - 199;
		int timeB =  selectTime + 199;
		System.out.println("*************************");
		System.out.println("selectTime = " + selectTime);
		System.out.println("timeA = " + timeA);
		System.out.println("timeB = " + timeB);
		System.out.println("*************************");
		
		List<RsRv> rsRvSeatList = cafeService.rsRvSelectList(cafeNum);
		
		
		for(int i=0; i<rsRvSeatList.size(); i++) {
			System.out.println("######################");
			System.out.println("rsRvSeat " + rsRvSeatList.get(i).getRsrvDate());
			System.out.println("rsRvSeat " + rsRvSeatList.get(i).getRsrvTime());
			System.out.println("rsRvSeat " + rsRvSeatList.get(i).getSeatList());
			System.out.println("######################");
		}

		String str = "";
		int cnt = 0;
		for(int j=0; j<rsRvSeatList.size(); j++) { // select 1501 <= 1700 <= 1899

			if(timeA <= Integer.parseInt(rsRvSeatList.get(j).getRsrvTime()) && 
			   timeB >= Integer.parseInt(rsRvSeatList.get(j).getRsrvTime()) )
			{
				str = str + rsRvSeatList.get(j).getSeatList() + ",";
				cnt++;
			}
		}
		System.out.println("#####################");
		System.out.println("str = " + str);
		System.out.println("#####################");
		
		String[] Astr = str.split(",");
		
		for(int a=0; a<Astr.length; a++) {
			System.out.println("Astr = " + Astr[a]);
		}
		Response<Object> ajaxResponse = new Response<Object>();
		
		if(Astr != null && cnt > 0) {
			ajaxResponse.setResponse(0, "Success", Astr);
		}
		else if(cnt == 0) {
			ajaxResponse.setResponse(0, "Success All Empty", Astr);
		}
		else {
			ajaxResponse.setResponse(404, "Error");
		}
		//????????????
		return ajaxResponse;
		
    }
	
	
}

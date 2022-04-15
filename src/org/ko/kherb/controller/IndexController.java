package org.ko.kherb.controller;

import java.util.List;

import org.ko.kherb.client.index.service.ClientIndexService;
import org.ko.kherb.vo.OrderVO;
import org.ko.kherb.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	

	@Autowired
	private ClientIndexService clientIndexService;
	
	//IndexPage 인기상품(판매량에 따라), 추천상품(가다나 순서), 신상품(pno를 기준으로 역순으로 구하기)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model,ProductVO pro) {

    	System.out.println("Index Page입니다.");
    	//신상품 3개 데이터 가져오기
		List<ProductVO>  newProData = clientIndexService.getNewPro();
		System.out.println("신상품  newProData : " + newProData);
		//추천상품 3개 데이터 가져오기
		List<ProductVO>  recomPro = clientIndexService.getRecomPro();
		System.out.println("추천 상품  recomPro : " + recomPro);
		//인기상품 pno가져오기
		List<ProductVO>  popularPro = clientIndexService.getPopularPro();
		System.out.println("인기 상품  paynoData : " + popularPro);
		
		model.addAttribute("newProData", newProData);
		model.addAttribute("recomPro", recomPro);
		model.addAttribute("popularPro", popularPro);
		return "index";
	}
	
}

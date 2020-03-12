package kr.co.fifa.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.fifa.DAO.CURDDAO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/management")
public class CURDController {
	
	@Autowired
	CURDDAO dao;
	
	@GetMapping("curd")
	public String curd() {
		
		log.info("move to CURD");
		
		return "/management/curd";
	}
	@GetMapping("/updatePlayer")
	public String updatePlayer() {
		
		log.info("move to updatePlayer");
		
		return "/management/updatePlayer";
	}
	@GetMapping("/insertPlayer")
	public String insertPlayer() {
		
		log.info("move to insertPlayer");
		
		return "/management/insertPlayer";
	}
}

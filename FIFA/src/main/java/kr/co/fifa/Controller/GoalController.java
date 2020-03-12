package kr.co.fifa.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fifa.DAO.GoalDAO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/goalRecord")
public class GoalController {
	
	@Autowired
	GoalDAO dao;
	
	@GetMapping("/goal")
	public String goal() {
		
		log.info("move to goalRecord");
		
		return "/record/goal";
	}
	@RequestMapping(value="goalList", method= RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String,Object>> goalList(Model model,@RequestParam(value="currentPage", defaultValue = "1")int currentPage){
		
		log.info("goalList 요청");
		
		
		ArrayList<HashMap<String,Object>> list = dao.selectGoalList();
		
		
		return list;
	}
	
	
	
}

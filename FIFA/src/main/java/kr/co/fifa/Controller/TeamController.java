package kr.co.fifa.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fifa.DAO.TeamDAO;
import kr.co.fifa.VO.PlayerVO;
import kr.co.fifa.VO.TeamVO;


@Controller
@RequestMapping("/teamRecord")
public class TeamController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	@Autowired
	TeamDAO dao;
	
	@GetMapping("team")
	public String teamRecord() {
		
		logger.info("move to teamRecord");
		
		return "/record/team";
	}
	
	@RequestMapping(value="/playerList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String,Object>> playerList(String teamName) {
		logger.info("teamLsit 요청");
		logger.info(teamName+ "조회");
		
		ArrayList<HashMap<String,Object>> list = dao.selectPlayerFromTeamName(teamName);
		
		if(list.isEmpty()) {
			logger.info("teamList 요청 실패");
		}else {
			logger.info("teamList 요청 성공");
		}
		
		return list;
	}
	
	@RequestMapping(value="/teamInfo" ,method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> teamInfo(String teamName) {
		logger.info("teamInfo 요청");
		logger.info(teamName+ "조회");
		
		HashMap<String, Object> tv = dao.selectTeamFromTeamName(teamName);
		
		if(tv.isEmpty()) {
			logger.info("teamInfo 요청 실패");
		}else {
			logger.info("teamInfo 요청 성공");
		}
		
		return tv;
	}

}














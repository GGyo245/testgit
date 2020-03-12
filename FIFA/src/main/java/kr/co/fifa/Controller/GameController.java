package kr.co.fifa.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fifa.DAO.GameDAO;
import kr.co.fifa.VO.GameVO;

@Controller
@RequestMapping(value="/gameRecord")
public class GameController {
	
	private static final Logger logger = LoggerFactory.getLogger(GameController.class);
	
	@Autowired
	GameDAO dao;
	
	@RequestMapping(value="gameList",method= RequestMethod.POST)
	@ResponseBody
	public ArrayList<HashMap<String,Object>> gameList(String year, String month) {
		logger.info("gameLsit 요청");
		logger.info(year+"년"+month+"월 조회");
		
		GameVO game = new GameVO();
		game.setGamedate(year+"-"+month);
		ArrayList<HashMap<String,Object>> list = dao.selectGameList(game);
		
		if(list.isEmpty()) {
			logger.info("gameLsit 요청 실패");
		}else {
			logger.info("gameLsit 요청 성공");
		}
		
		return list;
	}
	@RequestMapping(value="/updateWin", method= RequestMethod.POST)
	@ResponseBody
	public boolean updateWin(String team) {
		
		logger.info("updateWin 요청");
		logger.info("승리팀 : "+team);
		
		int teamnum = 0;
		
		switch (team) {
			case "서울": teamnum = 1;break;
			case "전북": teamnum = 2;break;
			case "울산": teamnum = 3;break;
			case "포항": teamnum = 4;break;
			case "대구": teamnum = 5;break;
			case "강원": teamnum = 6;break;
			case "상주": teamnum = 7;break;
			case "수원": teamnum = 8;break;
			case "성남": teamnum = 9;break;
			case "인천": teamnum = 10;break;
			case "경남": teamnum = 11;break;
			case "제주": teamnum = 12;break;
		
		default:break;
	}
		
		int fg = dao.updateWin(teamnum);
		
		if(fg != 0) {
			logger.info("updateWin 요청 성공");
			return true;
		}else {
			logger.info("updateWin 요청 실패");
		}
		
		return false;
	}
	@RequestMapping(value="/updateLose", method=RequestMethod.POST)
	@ResponseBody
	public boolean updateLose(String team) {
		
		logger.info("updateLose 요청");
		logger.info("패배팀 : "+team);
		
		int teamnum = 0;
		
		switch (team) {
			case "서울": teamnum = 1;break;
			case "전북": teamnum = 2;break;
			case "울산": teamnum = 3;break;
			case "포항": teamnum = 4;break;
			case "대구": teamnum = 5;break;
			case "강원": teamnum = 6;break;
			case "상주": teamnum = 7;break;
			case "수원": teamnum = 8;break;
			case "성남": teamnum = 9;break;
			case "인천": teamnum = 10;break;
			case "경남": teamnum = 11;break;
			case "제주": teamnum = 12;break;
		
		default:break;
		}
		
		int fg = dao.updateLose(teamnum);
				
				
		if(fg != 0) {
			logger.info("updateLose 요청 성공");
			return true;
		}else {
			logger.info("updateLose 요청 실패");
		}
		
		return false;
	}
	
}

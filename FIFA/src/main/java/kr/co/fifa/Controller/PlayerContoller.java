package kr.co.fifa.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fifa.DAO.PlayerDAO;
import kr.co.fifa.VO.PlayerVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/PlayerRecord")
@Slf4j
public class PlayerContoller {
	
	@Autowired
	PlayerDAO dao;
	
	@RequestMapping(value="/updatePlayer", method=RequestMethod.POST)
	@ResponseBody
	public void updatePlayer(PlayerVO player) {
		
		log.info("updatePlayer 요청");
		
		
		int fg = dao.updatePlater(player);
		
		if(fg != 0) {
			log.info("updatePlayer 요청 성공");
		}else {
			log.info("updatePlayer 요청  실패");
		}
		
	}
	@RequestMapping(value="/insertPlayer", method=RequestMethod.POST)
	@ResponseBody
	public void insertPlayer(PlayerVO player, String team) {
		
		log.info("insertPlayer 요청");
		log.info(team);
		log.info(player.getBirth());
		
		
		switch (team) {
			case "서울": player.setTeamnum(1);break;
			case "전북": player.setTeamnum(2);break;
			case "울산": player.setTeamnum(3);break;
			case "포항": player.setTeamnum(4);break;
			case "대구": player.setTeamnum(5);break;
			case "강원": player.setTeamnum(6);break;
			case "상주": player.setTeamnum(7);break;
			case "수원": player.setTeamnum(8);break;
			case "성남": player.setTeamnum(9);break;
			case "인천": player.setTeamnum(10);break;
			case "경남": player.setTeamnum(11);break;
			case "제주": player.setTeamnum(12);break;
			default:break;
		}
		
		int fg = dao.insertPlayer(player);
		
		if(fg != 0) {
			log.info("insertPlayer 요청 성공");
		}else {
			log.info("insertPlayer 요청  실패");
		}
		
	}
}

package kr.co.fifa.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.fifa.VO.PlayerVO;
import kr.co.fifa.VO.TeamVO;

public interface TeamMapper {

	public ArrayList<HashMap<String, Object>> selectPlayerFromTeamName(String teamName);

	public HashMap<String, Object> selectTeamFromTeamName(String teamName);

}

package kr.co.fifa.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.fifa.VO.GameVO;

public interface GameMapper {

	public ArrayList<HashMap<String, Object>> selectGameList(GameVO game);

	public int updateWin(int teamnum);

	public int updateLose(int teamnum);
	
}

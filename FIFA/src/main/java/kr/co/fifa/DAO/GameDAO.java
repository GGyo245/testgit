package kr.co.fifa.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fifa.VO.GameVO;

@Repository
public class GameDAO {
	@Autowired
	SqlSession session;

	public ArrayList<HashMap<String, Object>> selectGameList(GameVO game) {
		// TODO Auto-generated method stub
		ArrayList<HashMap<String, Object>> list = null;
		try {
			GameMapper mapper = session.getMapper(GameMapper.class);
			list = mapper.selectGameList(game);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public int updateWin(int teamnum) {
		// TODO Auto-generated method stub
		int fg = 0;
		try {
			GameMapper mapper = session.getMapper(GameMapper.class);
			fg = mapper.updateWin(teamnum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return fg;
	}

	public int updateLose(int teamnum) {
		// TODO Auto-generated method stub
		int fg = 0;
		try {
			GameMapper mapper = session.getMapper(GameMapper.class);
			fg = mapper.updateLose(teamnum);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return fg;
	}
}

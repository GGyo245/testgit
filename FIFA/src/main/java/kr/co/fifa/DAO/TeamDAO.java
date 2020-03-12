package kr.co.fifa.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fifa.VO.PlayerVO;
import kr.co.fifa.VO.TeamVO;

@Repository
public class TeamDAO {
	
	@Autowired
	SqlSession session;

	public ArrayList<HashMap<String, Object>> selectPlayerFromTeamName(String teamName) {
		// TODO Auto-generated method stub
		ArrayList<HashMap<String,Object>> list = null;
		try {
			TeamMapper mapper = session.getMapper(TeamMapper.class);
			list = mapper.selectPlayerFromTeamName(teamName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	public HashMap<String, Object> selectTeamFromTeamName(String teamName) {
		// TODO Auto-generated method stub
		HashMap<String, Object> tv = null;
		try {
			TeamMapper mapper = session.getMapper(TeamMapper.class);
			tv = mapper.selectTeamFromTeamName(teamName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return tv;
	}


}












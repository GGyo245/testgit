package kr.co.fifa.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fifa.VO.PlayerVO;

@Repository
public class PlayerDAO {
	
	@Autowired
	SqlSession session;
	
	public int updatePlater(PlayerVO player) {
		// TODO Auto-generated method stub
		int fg = 0;
		
		try {
			PlayerMapper mapper = session.getMapper(PlayerMapper.class);
			fg = mapper.updatePlayer(player);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return fg;
	}

	public int insertPlayer(PlayerVO player) {
		// TODO Auto-generated method stub
		int fg = 0;
		try {
			PlayerMapper mapper = session.getMapper(PlayerMapper.class);
			fg = mapper.insertPlayer(player);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return fg;
	}
}

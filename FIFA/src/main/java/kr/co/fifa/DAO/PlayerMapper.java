package kr.co.fifa.DAO;

import kr.co.fifa.VO.PlayerVO;

public interface PlayerMapper {

	
	public int updatePlayer(PlayerVO player);

	public int insertPlayer(PlayerVO player);
	
	
}

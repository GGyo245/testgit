package kr.co.fifa.DAO;

import kr.co.fifa.VO.UserVO;

public interface UserMapper {

	public int insertUser(UserVO user);

	public UserVO selectUserOne(UserVO user);

	public UserVO selectUserBasic(String email);

	public int updateUser(UserVO user);

	public void deleteUser(UserVO user);

}

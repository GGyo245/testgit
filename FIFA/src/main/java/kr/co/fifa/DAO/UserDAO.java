package kr.co.fifa.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.fifa.VO.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSession session;
	
	public int insertUser(UserVO user) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			count = mapper.insertUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}

	public UserVO selectUserOne(UserVO user) {
		// TODO Auto-generated method stub
		UserVO userdb = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			userdb = mapper.selectUserOne(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return userdb;
		
	}

	public UserVO selectUserBasic(String email) {
		// TODO Auto-generated method stub
		UserVO user = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			user = mapper.selectUserBasic(email);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}

	public int updateUser(UserVO user) {
		// TODO Auto-generated method stub
		int fg = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			fg = mapper.updateUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return fg;
	}

	public void deleteUser(UserVO user) {
		// TODO Auto-generated method stub
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			mapper.deleteUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	
}

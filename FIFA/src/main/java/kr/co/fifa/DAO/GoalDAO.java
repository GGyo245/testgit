package kr.co.fifa.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoalDAO {
	
	@Autowired
	SqlSession session;

	public ArrayList<HashMap<String, Object>> selectGoalList() {
		// TODO Auto-generated method stub
		ArrayList<HashMap<String, Object>> list = null;
		try {
			GoalMapper mapper = session.getMapper(GoalMapper.class);
			list = mapper.selectGoalList();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	public int selectTotalCount() {
		// TODO Auto-generated method stub
		int totalRecordsCount = 0;
		try {
			GoalMapper mapper = session.getMapper(GoalMapper.class);
			totalRecordsCount = mapper.selectTotalCount();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return totalRecordsCount;
		
	}
	
	
}

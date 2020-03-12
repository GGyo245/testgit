package kr.co.fifa.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

public interface GoalMapper {

	public ArrayList<HashMap<String, Object>> selectGoalList();

	public int selectTotalCount();

}

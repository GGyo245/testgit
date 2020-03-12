package kr.co.fifa.VO;

import lombok.Data;

@Data
public class GameVO {
	int gamenum;
    int hometeam;
    int awayteam;
    int homescore;
    int awayscore;
    String gamedate;
}

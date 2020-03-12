package kr.co.fifa.VO;

import lombok.Data;

@Data
public class TeamVO {
	int teamnum;
    String teamname;
    int win; 
    int lose; 
    int draw; 
    String foundationdate;
}

drop table goal;
drop table game;
drop table team;
drop table player;

drop sequence player_SEQ;
drop sequence team_SEQ;
drop sequence game_SEQ;
drop sequence goal_SEQ;

create table player(
    playernum number primary key,
    teamnum number,
    name varchar2(60) not null,
    birth date not null,
    debut date not null,
    retire date
);

create table team(
    teamnum number primary key,
    teamname varchar2(60) not null,
    win number default 0, 
    lose number default 0, 
    draw number default 0, 
    foundationdate date not null
);

create table game(
    gamenum number primary key,
    hometeam number not null,
    awayteam number not null,
    homescore number not null,
    awayscore number not null,
    gamedate date not null,
    
    constraint game_hometeam_fk foreign key (hometeam) references team(teamnum),
    constraint game_awayteam_fk foreign key (awayteam) references team(teamnum)
);

create table goal(
    goalnum number primary key,
    point number not null,
    playernum number not null,
    gamenum number not null,
    constraint goal_game_fk foreign key (gamenum) references game(gamenum),
    constraint goal_player_fk foreign key (playernum) references player(playernum)
);

create sequence player_SEQ start with 1;
create sequence team_SEQ start with 15;
create sequence game_SEQ start with 2000;
create sequence goal_SEQ start with 3000;

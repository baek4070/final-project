CREATE SCHEMA `final` ;
-- SCHEMA: 'final'
-- id: 'final'
-- pw: '12345'
-- 해당값으로 세팅하고 테이블 생성할것 !! 

DROP TABLE trade_user;

CREATE TABLE trade_user(
	uno INT PRIMARY KEY auto_increment,
    u_id VARCHAR(50) NOT NULL UNIQUE,
    u_pw VARCHAR(200) NOT NULL,
    u_name VARCHAR(100) NOT NULL,
    u_birth VARCHAR(100) NOT NULL,
    u_addr_post VARCHAR(100) NOT NULL,
    u_addr VARCHAR(50) NOT NULL,
    u_addr_detail VARCHAR(50) NOT NULL,
    u_phone VARCHAR(100) NOT NULL,
    u_visit_date TIMESTAMP NOT NULL DEFAULT now(),
    u_withdraw char(1) DEFAULT 'n'
);



DROP TABLE  if exists user_auth;

CREATE TABLE user_auth(
	u_id varchar(50) NOT NULL,
    u_auth VARCHAR(100) NOT NULL,
    CONSTRAINT fk_user_auth FOREIGN KEY(u_id) 
    REFERENCES trade_user(u_id)
);

INSERT INTO user_auth(u_id,u_auth) VALUES('qwe@qwe','ROLE_MASTER');

DESC trade_user;

DESC user_auth;

SELECT * FROM trade_user;

SELECT * FROM user_auth;

commit;




CREATE TABLE questioner(
	userId VARCHAR(50) NOT NULL,
    userNickname VARCHAR(50) NOT NULL,
    userEmail VARCHAR(50) NOT NULL,
    userPhone VARCHAR(50) NOT NULL
);

CREATE TABLE qna_tbl(
	qno INT primary key auto_increment,
	userId VARCHAR(50) NOT NULL,
    title VARCHAR(300) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    userNickname VARCHAR(20) NOT NULL,
    regdate TIMESTAMP NOT NULL DEFAULT now(),
    viewcnt INT DEFAULT 0,
    filename VARCHAR(300),
    filepath VARCHAR(300)
);








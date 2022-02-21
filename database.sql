CREATE SCHEMA `final` ;
-- SCHEMA: 'final'
-- id: 'final'
-- pw: '12345'
-- 해당값으로 세팅하고 테이블 생성할것 !! 

DROP TABLE trade_user;

CREATE TABLE trade_user(
	uno INT PRIMARY KEY auto_increment,
    u_id VARCHAR(50) NOT NULL,
    u_pw VARCHAR(200) NOT NULL,
    u_name VARCHAR(100) NOT NULL,
    regdate TIMESTAMP DEFAULT now()
);

DESC trade_user;

SELECT * FROM trade_user;

CREATE TABLE questioner(
	userId VARCHAR(50) NOT NULL,
    userNickname VARCHAR(50) NOT NULL,
    userEmail VARCHAR(50) NOT NULL,
    userPhone VARCHAR(50) NOT NULL
);

INSERT INTO questioner(userId, userNickname, userEmail, userPhone)
VALUES ('admin', 'admin', 'admin', 'admin'); 

SELECT * FROM questioner;

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

INSERT INTO qna_tbl(userId, title, content, userNickname) VALUES ('user1','1번째 작성','1번째 작성함','1번');

DESC qna_tbl;

commit;
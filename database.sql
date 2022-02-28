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

-- board 생성 및 데이터 삽입 쿼리문
CREATE TABLE IF NOT EXISTS board(
	bno INT PRIMARY KEY AUTO_INCREMENT,	-- 번호
    title VARCHAR(50) NOT NULL,			-- 제목
    content VARCHAR(50) NOT NULL,		-- 내용
    writer VARCHAR(50) NOT NULL,		-- 작성자
    regdate TIMESTAMP DEFAULT NOW(),	-- 등록일자
    updateDate TIMESTAMP DEFAULT NOW(),	-- 수정일자
    fileName varchar(500) default null, -- 파일이름
	filePath varchar(500) default null 	-- 파일경로
);

insert into board(title,content,writer) values('테스트 제목1','테스트 내용1','최기근');

-- board 생성 및 데이터 삽입 쿼리문 끝

commit;
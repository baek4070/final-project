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
INSERT INTO qna_tbl(userId, title, content, userNickname) VALUES ('user2','2번째 작성','1번째 작성함','1번');
INSERT INTO qna_tbl(userId, title, content, userNickname) VALUES ('user3','3번째 작성','1번째 작성함','1번');
INSERT INTO qna_tbl(userId, title, content, userNickname) VALUES ('user4','4번째 작성','1번째 작성함','1번');
INSERT INTO qna_tbl(userId, title, content, userNickname) VALUES ('user5','5번째 작성','1번째 작성함','1번');
INSERT INTO qna_tbl(userId, title, content, userNickname) VALUES ('user6','6번째 작성','1번째 작성함','1번');

SELECT * FROM qna_tbl;

commit;

ALTER TABLE qna_tbl ADD updatedate timestamp default now();
ALTER TABLE qna_tbl ADD deleted varchar(1) default 'n';

commit;

ALTER TABLE qna_tbl ADD root int default 0;
ALTER TABLE qna_tbl ADD depth int default 0;
ALTER TABLE qna_tbl ADD seq int default 0;

commit;

CREATE TABLE notice_tbl(
	nno INT primary key auto_increment,
    title VARCHAR(300) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    userNickname VARCHAR(20) NOT NULL,
    deleted VARCHAR(1) NOT NULL DEFAULT 'n',
    regdate TIMESTAMP NOT NULL DEFAULT now(),
    updatedate TIMESTAMP NOT NULL DEFAULT now(),
    viewcnt INT DEFAULT 0,
    filename VARCHAR(300),
    filepath VARCHAR(300)
);
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
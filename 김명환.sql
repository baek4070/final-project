-- board

CREATE TABLE IF NOT EXISTS board(
	bno INT PRIMARY KEY AUTO_INCREMENT,	-- 번호
    title VARCHAR(50) NOT NULL,			-- 제목
    content VARCHAR(50) NOT NULL,		-- 내용
    writer VARCHAR(50) NOT NULL,		-- 작성자
    writerId VARCHAR(50) NOT NULL,		-- 작성자id
    regdate TIMESTAMP DEFAULT NOW(),	-- 등록일자
    updateDate TIMESTAMP DEFAULT NOW(),	-- 수정일자
    tradeType VARCHAR(50) NOT NULL,		-- buy/cell
    category VARCHAR(50) NOT NULL,		-- one/two/three/four/five
    fileName varchar(500) default null, -- 파일이름
	filePath varchar(500) default null 	-- 파일경로
);

insert into board(title,content,writer,writerId,tradeType,category) values('테스트 제목1','테스트 내용1','김명환','id001@naver.com','buy','one');
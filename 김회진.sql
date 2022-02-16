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

commit;
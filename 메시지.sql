CREATE TABLE message(
	mno int primary key auto_increment,
    touser char(50) not null,
    fromuser char(50) not null,
    title char(200) not null ,
    content text not null,
    senddate timestamp default now(),
    isread char(1) default 'N'
);
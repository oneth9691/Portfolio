create table userinfo
(
	info_no int auto_increment primary key,
	userid varchar(25),
	userpw varchar(100),
	name varchar(15),
	gender varchar(5),
	email varchar(50),
	pn varchar(25),
	yesno varchar(5),
	subject varchar(30)
)

create table in_out
(
	userid varchar(25),
	username varchar(15),
	in_check varchar(10),
	out_check varchar(10),
	in_time datetime,
	out_time datetime,
	info_no integer,
	FOREIGN KEY (info_no) REFERENCES userinfo (info_no)
)

create table notice
(
	no int auto_increment primary key,
	userid varchar(50),
	title varchar(100),
	body text,
	hit int,
	wdate date,
	file varchar(15)
)

create table file
(
	fno int auto_increment primary key,
	fname varchar(50),
	no int, 
	FOREIGN KEY (no) REFERENCES notice(no)
)

create table class
(
	subject varchar(25),
	start_day datetime,
	end_day datetime,
	info_no integer,
	foreign key (info_no) references userinfo(info_no)
)


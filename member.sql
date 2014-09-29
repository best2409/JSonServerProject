create table members
(
	user_name		varchar(20),
	user_pwd		varchar(20),
	user_email		varchar(100)
)

select * from members

delete from members
where user_name is null

INSERT INTO MEMBERS
VALUES('ADMIN', '1234', 'AA@BB.COM')
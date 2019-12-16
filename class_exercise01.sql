
 
-- # DDL : CREATE, ALTER, USE, DROP, DESC, SHOW 


-- #	DDL : 데이터 베이스 생성
-- CREATE DATABASE test; 
-- use test;


-- # 테이블 생성 1 : 제약 조건이 없는 테이블 생성 

-- CREATE TABLE user1(
-- 	user_id INT, 
--     name VARCHAR(20),
--     email VARCHAR(30), 
--     age INT, 
--     rdate DATE);
--     
-- DESC user1;



-- # 테이블 생성 2 : 제약 조건이 있는 테이블 생성 

-- CREATE TABLE user2(
-- 	user_id INT PRIMARY KEY auto_increment,
--     name VARCHAR(20) NOT NULL,
--     email VARCHAR(30) UNIQUE NOT NULL, 
--     age INT DEFAULT '30', 
--     rdate TIMESTAMP);

--     
-- DESC user2;


-- # ALTER :수정 
-- # 데이터베이스 인코딩 수정 

-- use world;
-- ALTER DATABASE world CHARACTER SET = utf8;
-- SHOW VARIABLES LIKE "character_set_database";


-- # 테이블 변경 
-- # ADD: 컬럼 추가
-- USE test; 
-- DESC user2;
-- -- ALTER TABLE user2 ADD tmp TEXT;

-- # MODIFY : 컬럼 수정 

-- ALTER TABLE user2 MODIFY COLUMN tmp INT;

-- # DROP : 컬럼삭제 

-- ALTER TABLE user2 DROP tmp;

# MODIFY : 컬럼 수정 

# DROP : 삭제 
# 데이터 베이스 삭제

-- DROP DATABASE wps;


# 테이블 삭제 

-- USE test;
-- DROP TABLE wps;

# Quiz 2 
# 1. 

-- use world;
-- select distinct(count(Continent)) as count from country; 


# Quiz 2 
# 2 
-- use world;
-- select CountryCode, count(CountryCode) as count
-- from city
-- group by CountryCode
-- order by count desc
-- limit 5;


# Quiz 3 

-- use world;
-- select continent, count(continent) as count 
-- from country
-- group by continent
-- order by count desc;



# Quiz 2-3 : 대륙별 GNP 총량을 출력하는 컬럼을 추가 

-- use world; 
-- select continent, count(continent) as count, sum(gnp) as total_gnp
-- , avg(gnp) as total_gnp, sum(population) as total_popu,
-- sum(population), sum(gnp) / sum(population) * 100 as gpp
-- from country 
-- group by continent 
-- order by count desc;
 
 
 # INSERT : 데이터 추가 
 -- USE test;
--  INSERT INTO user1 (user_id, name, email, age, rdate)
--  Values (2, "peter", "peter@gmail.com", 35, now()),
--  (3, "angel", "angie@hotmail.com", 35, "2013-09-02");
--  
--  select * from user1;
--  
--  
 
--  use test;
--  INSERT INTO user2 (name, email) 
--  VALUES ("ANDY", "ANDY@namver.com") 
--  , ("PEter", "Peter@daum.net");
--  select * from user2
 
 # Select 문으로 출력된 결과를 INSERT 
 
--  USE world; 
 
 # 인구가 8000만이상인 국가를 출력 (국가코드, 국가이름, 인구) 
 
--  select code, name, population from country
--  where population >= 80000000;
--  
--  
 # 테이블 생성 
--  
--  create table country2(
-- 	code CHAR(3),
--     name VARCHAR(50),
--     population INT 
--  
--  );
-- use world;
-- INSERT INTO country2
-- select code, name, population
-- from country 
-- where population >= 80000000;

-- select * from country2;
--  
 
 
 # UPDATE SET 
 
--  use test; 

--  UPDATE user1 SET name="john" where age > 30;
 

 
 
 # DELETE DROP TRUNCATE
 
 # DELETE(DML) : 데이터 삭제 
--  use test;
--  
--  delete from user1 where age > 33;
--  
 
 # DROP(DLL) : 데이터(테이블) 삭제 
 
--  DROP TABLE user1; 
 
 # TRUNCATE(DLL) : 데이터(테이블) 초기화 
 
--  TRUNCATE user1; 
--  
--  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
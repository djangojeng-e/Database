CREATE TABLE user (
	user_id int(11) unsigned NOT NULL AUTO_INCREMENT,
	name varchar(30) DEFAULT NULL,
	PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;CREATE TABLE addr (
  	id int(11) unsigned NOT NULL AUTO_INCREMENT,
  	addr varchar(30) DEFAULT NULL,
	user_id int(11) DEFAULT NULL,
  	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;INSERT INTO user(name)
VALUES ("jin"),
              ("po"),
              ("alice"),
              ("petter");INSERT INTO addr(addr, user_id)
VALUES ("seoul", 1),
              ("pusan", 2),
              ("deajeon", 3),
              ("deagu", 5),
              ("seoul", 6); 
              
# INNER JOIN : 테이블간에 공통된 값이 없는 data는 출력하지 않는다. 
SELECT user.user_id, user.name, addr.addr
FROM user, addr 
where user.user_id = addr.user_id;

# LEFT JOIN 

SELECT user.user_id, user.name, addr.addr 
FROM user
LEFT JOIN addr 
ON user.user_id = addr.user_id; 



# World table 예제 
# World : 도시인구가 8000000만이 넘는 도시이름, 국가이름, 도시인구, 국가인구를 출력 

USE world;
select city.name, city.population from city 
join country on city.countrycode = country.code 
where city.population >= 8000000;


select *
from country; 


# OUTER JOIN : UNION  
use test; 
SELECT name
from user
UNION ALL		# UNION 은 데이터를 합치 중복 데이터를 제거 All 을 사용하면 제
select addr
from addr;


# OUTER  JOIN : 

select user.user_id, user.name, addr.addr
From user 
LEFT JOIN addr 
ON user.user_id = addr.user_id 
UNION
SELECT addr.user_id, user.name, addr.addr 
from user 
right join addr 
on user.user_id = addr.user_id;


# Sub Query : 쿼리 안에 쿼리 
# SELECT, FROM, WHERE 
# 전체 도시수, 전체 나라수, 전체 언어수 
use world;
-- SELECT
-- (select count(name) from city) as city,
-- (select count(name) from country) as country, 
-- (select count(distinct(language))) from countrylanguage as countrylanguage


# 도시인구가 800만 이상인 도시의 도시이름 도시인구 국가이름 출력 

use world;
select * from(
select countrycode, name, population 
from city 
where population >= 8000000) as sub1
JOIN (select code, name from country) as sub2 
on sub1.countrycode = sub2.code; 

# WHERE 절 Sub query 
# 800만 이상이되는 도시의 국가코드, 국가이름, GNP 출력 

select code, name, gnp 
from country
where code in (
	select countrycode
    from city 
    where population >= 8000000);









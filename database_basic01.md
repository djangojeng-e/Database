# Database



**DB : DATABASE definition** 



**DBMS definition** 





**RDBMS (Relational Database Management System**

e.g. Oracle, MySqul, Postresql, Sqlite 

데이터의 테이블 사이에 키값으로 관계를 가지고 있는 데이터 베이스 





**NoSQL**

Mongodb, Hbase, Cassandra 

데이터 테이블 사이의 관계가 없이 데이터를 저장하는 데이터 베이스 

데이터 사이의 관계가 없으므로 복잡성이 작고 많은 데이터의 저장이 가능. 

주로 MongoDB 를 사용 (표준 SQL 보다 javascript를 사용)



JSON 데이터 형태의 text format으로 저장하는 형식이라고 보면 됨. 



**좋은 쿼리가 효율적인 결과가 리턴됨. 성능 향상도 됨**





**MySQL**



- OpenSource 
- 다중 사용자와 다중 스레드 지원 
- 다양한 운영체제에 다양한 프로그래밍 언어 지원 
- 표준 SQL 사용 
- 작고 강력하며 가격이 저렴 



MySQL 은 C언어 베이스 



**License** 



MySQL 을 포함하는 하드웨어나 소프트웨어 기타 장비를 판매하는 경우 라이센스 필요 

배포시 소스를 공개하면 무료이지만 소스공개를 원치 않는 경우 사용 라이센스 필요 

**서비스에 이용하는건 무료로 가능** 



상용화 서비스는 licence 필요 





**Server > Database > Table > Row > Value** 





**RBDMS vs NoSQL** 



RBDMS is slow with insert 

NoSQL is faster with insert 





# Created AWS EC2 Instance 





AWS EC2 인스턴스에 Ubuntu OS에 MySQL 5.7.x 버전 설치

EC2 인스턴스 생성
- t2.micro
- Ubuntu 18.04 버전
- 보안그룹에서 3306 포트 추가

EC2 인스턴스에 접속



# pem 파일 400 권한으로 변경

$ ssh -i ~/.ssh/rada.pem ubuntu@15.164.231.87



# apt-get 업데이트

$ sudo apt-get update -y
$ sudo apt-get upgrade -y



# MySQL Server 설치

$ sudo apt-get install mysql-server



# MySQL secure 설정

$ sudo mysql_secure_installation
Would you like to setup VALIDATE PASSWORD plugin? N
New password: wps
Re-enter new password: wps
Remove anonymous users? Y
Disallow root login remotely? N

5

Remove test database and access to it? Y
Reload privilege tables now? Y



# MySQL 패스워드 설정

$ sudo mysql
mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password
BY 'wps';
mysql> FLUSH PRIVILEGES;
mysql> SELECT user,authentication_string,plugin,host FROM mysql.user;
mysql> exit



# 설정한 패스워드를 입력하여 접속

$ mysql -u root -p
Enter password: dss



# 외부접속 설정

$ sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf



# bind-address를 127.0.0.1을 0.0.0.0 으로 변경

------------------------------------------------------------------------------------------------
bind-address = 0.0.0.0
------------------------------------------------------------------------------------------------



# 외부접속 패스워드 설정

mysql> grant all privileges on *.* to root@'%' identified by 'wps';

6



# 서버 시작 종료 상태 확인

$ sudo systemctl start mysql.service
$ sudo systemctl stop mysql.service
$ sudo systemctl restart mysql.service
$ sudo systemctl status mysql.service





# 설정 후 서버 재시작으로 설정 내용 적용

$ sudo systemctl restart mysql.service





# password 변경 : wps로 패스워드를 변경하는 경우

mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'wps';







# Database Modelling



데이터 베이스 모델링은 데이터베이스에서 테이블 구조를 미리 계획해서 작성하는 것. 

RDBMS는 테이블간에 유기적으로 연결이 되어 있기 때문에, 모델링을 잘하는것이 중요합니다. 



**개념적 모델링** -> **논리적 모델링 -> 물리적 모델링** 순서로 진행 





**개념적 모델링 : 업무분석해서 데이터의 집합을 정의하는 과정**



**논리적 모델링: 개념적 모델링을 상세화 하는 과정 **



**물리적 모델링 : 논리적 모델링을 DBMS에 추가하기 위해 구체화 되는 과정**





# SQL QUERIES



**DML - Data Manipulation Language**



데이터 조작어 

데이터 검색, 삽입, 수정, 삭제 등에 사용 

SELECT INSERT UPDATE DELETE

트렌젝션이 발생하는 SQL문  - Review on Transaction Definition needed. 



**DDL - Data Definition Language**



데이터 정의어 

데이터 베이스, 테이블 뷰, 인덱스등의 데이터 베이스 개체를 생성,삭제 변경에 사용 

데이터 베이스, 테이블, 뷰, 인덱스 등의 데이터 베이스 개체를 생성, 삭제, 변경에 사용 

CREATE, DROP, ALTER, TRUNCATE 

실행 즉시 DB에 적용 



**DCL -  Data Control Language**



데이터 제어어 

사용자의 권한을 부여하거나 빼앗을때 사용 

CRUNT, REVORK, DENY 







```sql
use world; 
-- select * from country -- where population <= 100000000
-- AND population >= 70000000;
-- where population between 70000000 and 100000000;
-- select * from country where continent = "Asia" or 
-- continent ="Africa";

# where 
# in 

-- select * from country 
-- where continent in ("Asia", "Africa")

-- select * from country where Region like "%Europe";

-- select name, population from country order by population DESC;


-- select name, population from country
-- where population between 50000000 and 100000000
-- order by population DESC;


-- select CountryCode, name, population from city 
-- order by CountryCode ASC, name Desc;

# limit 
# 인구가 가장 많은 국가 5개를 출력 

select code, name, population from country
order by population desc limit 5, 3;

# 페이지네이션 개발시 중요할듯한것 limit 


```





```sql
-- use world; 

# 함수 사용법 : 90% 이상 사용되는 언어 출력 

-- select distinct(language) from countrylanguage 
-- where percentage >= 90 
-- order by language

# distinct() : 중복제거
# count() : 갯수 세기 

-- select count(distinct(language)) from countrylanguage
-- where percentage >= 99 
-- order by language


# Quiz1 

-- select distinct(continent) from country 

# Quiz2 

-- use sakila;
-- select country, count(country) as count from customer_list
-- where country = "India"

# Quiz 3 
-- use world;
-- select name, population from city
-- where countrycode ="KOR" and population >1000000 
-- order by population DESC

-- # Quiz 4 
-- use world;
-- select * from city where 
-- population between 8000000 and 1000000
-- order by population desc

# Quiz 5 

use world;
-- select * from city
-- where population between 8000000 and 1000000


# 국가 데이터에서 인구당 GNP 순위를 내림차순으로 출력 
select code, name, population, GNP, (GNP/Population) * 100 as gpp from country
order by gpp desc
 
```





```sql
use world; 
-- select * from country

# group by : count, max, min, avg, var_samp, stddev 
# city 테이블에서 국가별 도시의 갯수를 출력 

-- select countrycode, count(countrycode) from city 
-- group by countrycode


# 대륙별 인구수와 GNP 최대값을 조회 

-- select continent, avg(population), max(GNP) from country
-- where GNP > 0
-- group by continent


select continent, avg(population) as avg_population,
min(GNP) as min_gnp
from country 
where GNP >0 
group by continent 
having min_gnp > 100 
order by min_gnp desc 
limit 1





```





```sql
use sakila; 

# 고객과 스텝별 매출과 고객별 매출 총 합 

select customer_id, staff_id, sum(amount) from payment
group by customer_id, staff_id
with rollup
```





# REVIEW 





# DML, DDL, DCL 





데이터 베이스 개요 

DB, DBMS, RDBMS(MySQL)

Server - Database - Table -row, column - value 

모델링 - 개념적, 논리적, 물리적 



WHERE 와 HAVING 은 실행 시작 시점이 달름. 




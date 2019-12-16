# Function 1 
# CEIL, ROUND, TRUNCATE

-- select Ceil(12.345);
-- select ROUND(12.645, 2); 
-- select Truncate(12.645, 2);

-- use world; 
-- select name, round(gnp/population, 4) as gpp from country;

# DATE_FORMAT : 날짜데이터에 대한 포멧을 설정 

-- use sakila;
-- select amount, DATE_FORMAT(payment_date, "%Y-%m") as monthly, 
-- sum(amount) as total_amount from payment
-- group by monthly;


# FUNCTION 2 : IF, IFNULL, CASE  
# IF : world 도시인구가 100만이 넘으면, "big city"
# 아니면 "small city" 로 결과를 출력하는 IF문 작성 

USE world;
select name, population, IF(population >= 1000000, "big city", "small city") from city;


# IFNULL : NULL 데이터를 판단해서 데이터를 출력하는 방법 

select name, GNPOld, IFNULL(GNPOld, 0)
from country; 


# CASE : 여러개의 조건을 사용하는 방법 
# 나라별로 인구가 10억 이상, 1억 이상, 1억 이하를 출력하는 컬럼

select name, population, 
	CASE 
		WHEN population >= 1000000000 THEN "upper 1 billion"
        WHEN population >= 100000000 THEN "upper 100 million"
        ELSE "below 100 million"
	END AS result
from country; 

 
 # JOIN : 여러개의 테이블 데이터를 모아서 보여줄때 사용 
 # MySQL 에서 사용되는 JOIN의 종류는 : INNER, OUTER, LEFT, RIGHT 
 
 
 


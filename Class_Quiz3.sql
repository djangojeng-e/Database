-- 1. 멕시코보다 인구가 많은 나라이름과 인구수를 조회하시고 인구수 순으로 내림차순 하세요. 
-- Use of SUB QUERY 

use world;
SELECT Name, Population FROM country
WHERE Population > (Select Population FROM country
Where Name LIKE 'MEXICO')
ORDER BY Population DESC;


-- 2. 국가별 몇개의 도시가 있는지 조회하고, 도시수 순으로 10위까지 내림차순 하세요 

Select country.Name as CountryName, count(city.Name) as Count 
FROM country
JOIN city 
ON country.code = city.CountryCode
GROUP BY CountryName
ORDER BY Count DESC
LIMIT 10;




-- 3. 언어별 사용인구를 출력하고 언어 사용인구 순으로 10위까지 내림차순 하세요. 

SELECT countrylanguage.language as Language, sum(country.population) as population 
FROM countrylanguage 
JOIN country 
ON countrylanguage.countrycode = country.code
GROUP BY Language
ORDER BY population DESC
LIMIT 10;


-- 4. 나라 전체 인구의 10% 이상인 도시에서 도시인구가 500만이 넘는 도시를 조회 
-- 3개의 테이블 합치기 

-- City Name, CountryCode, CountryName, Percentage 

SELECT city.name as CityName, countrylanguage.countrycode as CountryCode,
country.Name as CountryName, countrylanguage.Percentage as Percentage
FROM city 
JOIN countrylanguage 
ON city.CountryCode = countrylanguage.CountryCode
JOIN country 
ON countrylanguage.CountryCode = country.code
WHERE Percentage > 10.0 and city.population > 5000000;

-- 5. 면적이 10000km^2 이상인 국가의 인구밀도 (1km^2 당 인구수)를 구하고 인구밀도가 200이상인 
-- 국가들의 사용하고 있는 언어수가 5가지 이상인 나라를 조회 하세요. 

use world;
select code, name, (Surfacearea/population) as density,surfacearea
FROM country
WHERE Surfacearea > 10000
ORDER BY density DESC;

select * from countrylanguage;


-- 6 사용하는 언어가 3가지 이하인 국가중 도시인구가 300만 이상인 도시를 아래와 같이 조회 하세요. 
-- GROUP_CONCAT(LANGUAGE) 를 사용하면, GROUP BY 할때 문자열을 합쳐서 볼수 있습니다. 
-- VIEW 를 이용하여 QUERY 를 깔끔하게 수정하세요 

use world;

select countrycode, GROUP_CONCAT(language) as languages,
count(language) as language_count  
from countrylanguage
group by countrycode
having countrycode <= 3; 





-- 7 한국과 미국의 인구를 아래와 같이 나타내세요 



select "population" as "category",
		sum(sub.KOR) as KOR,
        sum(sub.USA) as USA
from(select if(code="KOR", population, 0) as KOR, 
	   if(code="USA", population, 0) as USA, 
         1 as flag
from country) 
as sub
group by flag;



-- 8. Payment 테이블에서 수입 (amount)의 총합을 아래와 같이 출력하세요 
-- 년월 데이터 '2005-05' 를 쿼리문에 문자열로 사용해도 됩니다. 


use sakila;

select 

sum(if(DATE_FORMAT(payment_date, "%Y-%m")="2005-05", amount, 0)) as date1,
DATE_FORMAT(payment_date, "%Y-%m"), sum(amount) 
from payment
group by DATE_FORMAT(payment_date, "%Y-%m");





-- 9 QUiz8 의 결과에서 payment 테이블에서 월별 렌트 횟수 데이터를 추가하여 아래와 같이 출력하세요 
-- 년월 데이터 '2005-05' 를 쿼리문에 문자열로 사용ㅇ해도 됩니다. 






 

-- QUIZ 2 
USE world;
SELECT * FROM country;

select count(distinct continent) as count from country;


-- 국가 코드별 도시의 갯수를 출력 (상위 5개를 출력) 

Select CountryCode, count(Name) as Count from city
GROUP BY CountryCode ORDER BY TOTAL DESC LIMIT 5;


-- 대륙별 몇개의 나라가 있는지 대륙별 나라의 갯수로 내림차순하여 출력하세요. 


SELECT Continent, Count(Name) as count from country
Group By Continent ORDER BY count DESC;



-- 4.대륙별 인구가 1000만명 이상인 나라의 수와 GNP의 표준편차를 출력하세요. (GNP 표준편차 내림차순)


SELECT continent, count(name) as count, STDDEV(gnp) as std 
FROM country
WHERE population > 10000000
GROUP BY continent
ORDER BY std DESC;



-- 5. City 테이블에서 국가코드 (CountryCode) 별로 총인구가 몇명인지 조회 하고 총인구 순으로 내림차순 하세요 
-- (총 인구가 5천만 이상인 도시만 출력) 

SELECT countrycode, sum(population) as Population 
FROM city
GROUP BY countrycode
HAVING Population > 50000000
ORDER BY Population DESC;


-- 6. 언어별 사용하는 국가수를 조회하고 많이 사용하는 언어를 6위에서 10위까지 조회하세요. 

SELECT city.name AS country_name, country.name AS city_name 
FROM city 
JOIN country 
ON city.CountryCode = country.code ;


Select count(country.name) as count, countrylanguage.language as language 
from country 
join countrylanguage 
on country.code = countrylanguage.countrycode
GROUP BY language
ORDER BY COUNT DESC
LIMIT 5 OFFSET 5;



-- 7. 언어별 15곳 이상의 국가에서 사용되는 언어를 조회하고, 
-- 언어별 국가수에 따라 내림차순 하세요 


 Select language, count(countrycode) as count 
 from countrylanguage
 GROUP BY language
 HAVING count > 15
 ORDER BY count DESC;


-- 8. 대륙별 전체 표면적크기를 구하고 표면적 크기 순으로 내림차순하세요 

SELECT continent, sum(surfacearea) as SurfaceArea
FROM country
GROUP BY continent
ORDER BY SurfaceArea DESC; 
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

use world;




SELECT * FROM country where Population >= 100000000;

select * from country where population >= 70000000 AND Population <= 100000000;

select * from country where population between 70000000 and 100000000;

select * from country where Continent = "Asia" OR Continent = "Africa";

select * from country where Continent IN("Asia","Africa");

select * from country where Continent NOT IN("Asia","Africa");

SELECT * From country 
where 
Continent != "Asia" AND Continent != "Africa";


Select * from country where GovernmentForm Like "%Republic%";

select * from country order by population ASC;

select * FROM country order by population DESC;


select * from city order by CountryCode ASC, Population DESC;

SELECT * FROM country ORDER BY population DESC LIMIT 5;

SELECT * FROM country ORDER BY population DESC LIMIT 5, 3;

Select count(distinct(language)) as language_count from countrylanguage;


select count(distinct(language)) as language_count 
from countrylanguage;

select continent, Max(Population) as Population, MAX(GNP) as GNP
from country 
Group By continent;

select continent, Min(Population) as Population, MIN(GNP) as GNP 
from country 
where GNP != 0 AND Population != 0 
GROUP BY continent;

Select continent, sum(Population) as Population, SUM(GNP) as GNP 
FROM country 
where GNP != 0 AND Population != 0 
GROUP BY continent;


SELECT continent, AVG(Population) as Population, AVG(GNP) as GNP 
FROM country 
WHERE GNP != 0 AND Population != 0
GROUP BY continent 
ORDER BY Population DESC;


SELECT continent, SUM(Population) as Population
From country 
GROUP BY continent 
HAVING Population> 500000000;


SELECT continent, AVG(Population) as Population, AVG(GNP) as GNP, 
AVG(GNP) / AVG(Population) * 1000 as AVG 
FROM country 
WHERE GNP != 0 AND Population != 0 
GROUP BY continent 
HAVING AVG > 0.01 
ORDER BY AVG DESC;

use sakila;
select customer_id, staff_id, SUM(amount) as amount
FROM payment 
GROUP BY customer_id, staff_id
WITH ROLLUP;


use world; 

select distinct(continent) from country


use sakila;

select country, count(country) as count from customer_list 
where country = "India";


use world;
select * from city where Population > 1000000
AND countrycode = "KOR" ORDER BY Population ASC;



select Name, CountryCode, Population 
from city where population between 8000000 and 10000000
Order by population desc;


select code, concat(name, '(',IndepYear,')') as
 NameIndep,Continent, population
from country
where IndepYear between 1940 and 1950
order by IndepYear;
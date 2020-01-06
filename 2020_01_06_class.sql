# View : 가상테이블 
# 실제 데이터를 저장하지는 않습니다. 
# 데이터의 주소값만 저장하고 있다고 생각하면 됨. 
# 복잡한 쿼리문을 간단하게 만들어주는 효과가 있음. 
# 실제 테이블이 아니기 때문에 수정이 불가능하고, 인덱스 설정이 불가능합니다. 

use world;

Create VIEW code_name as 
select code, name from country;

Select * 
from city 
join code_name
on city.countrycode = code_name.code;


# INDEX 
# 테이블에서 데이터 검색을 빠르게 해줄수 있는 기능 
# 장점 : 검색속도가 빨라짐 
# 단점 : 저장공간을 추가로 차지, CUD 할때 속도가 느려짐. 

use employees;


select * from salaries;

# 쿼리가 인덱스를 사용하는지 확인 하려면 실행계획 확인 

EXPLAIN
SELECT * FROM salaries
WHERE from_date < "1986-01-01";

# 인덱스 생성 

CREATE INDEX fdate 
ON salaries (from_date);
 

# 인덱스 삭제 

# 두개의 컬럼을 갖는 인덱스 생성 

CREATE INDEX ftdate
ON salaries(from_date, to_date);

DROP INDEX ftdate
ON salaries




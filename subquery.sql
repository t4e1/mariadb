-- 유재식씨의 부서와 같은 부서에서 일하는 직원 (서브쿼리x)

SELECT * FROM employee;
SELECT dept_code FROM employee WHERE emp_name = '유재식';
SELECT * FROM employee WHERE dept_code = 'D6';  

-- 서브쿼리를 사용한 쿼리문

SELECT 
       *
  FROM employee
 WHERE dept_code = (SELECT dept_code
                      FROM employee 
                     WHERE emp_name = '유재식');
                     
-- '유재식'의 사원번호 추출/제거해서 결과에 안나오게끔

SELECT 
       *
  FROM employee
 WHERE dept_code = (SELECT dept_code
                      FROM employee
		               WHERE emp_name = '유재식')
	AND emp_id <> (SELECT emp_id
	                 FROM employee
	                WHERE emp_name = '유재식');


-- 인라인 뷰
-- FROM 절에서 서브쿼리가 사용된다면 무조건 별칭을 가져야 한다.
-- 이러한 서브쿼리(from절에서 사용된 서브쿼리)를 '인라인 뷰' 라고 부름  
SELECT
       MAX(count)
  FROM (SELECT COUNT(*) AS 'count'
          FROM tbl_menu
         GROUP BY category_code) AS countmenu;
 	                
	                
-- 상관 서브쿼리 
-- 메인 쿼리가 서브 쿼리에 영향을 주는 쿼리문
-- 서브쿼리의 결과가 항상 똑같지 않고, 메인 쿼리에 따라 결과가 계속 달라지는 쿼리 

-- 메뉴 조회시 동일 카테고리의 평균 가격보다 높은 가격의 메뉴만 조회하는 쿼리문

SELECT 
       a.menu_code
     , a.menu_price
     , a.menu_name
     , a.category_code
     , a.orderable_status
  FROM tbl_menu a
 WHERE a.menu_price > (SELECT AVG(b.menu_price)
                         FROM tbl_menu b
                        WHERE b.category_code = a.category_code);
                                                 
-- exists 
-- 결과가 있으면 TRUE / 없으면 FALSE 
SELECT
       a.category_code
     , a.category_name
  FROM tbl_category a
 WHERE EXISTS(SELECT 1
                FROM tbl_menu b
                WHERE b.category_code = a.category_code)
 ORDER BY 1;

-- join을 활용한 메뉴가 있는 카테고리 조회 
SELECT 
       a.category_code
     , a.category_name
  FROM tbl_category a
  JOIN tbl_menu b ON (a.category_code = b.category_code)
 GROUP BY a.category_code, a.category_name
 ORDER BY 1;
 
-- 가장 높은 급여를 받는 사원 조회 max() 사용 
SELECT 
       *
  FROM employee a 
 WHERE a.salary = (SELECT MAX(salary)
                     FROM employee);
                     
                      

-- 평균 급여가 가장 높은 부서 조회 max(avg())
-- *** mariadb에서는 중첩 함수 사용이 안됨 ex) max(avg()) 등 
SELECT d.dept_title 
from employee a
JOIN department d ON a.dept_code = d.dept_id 
group BY a.dept_code
having AVG(a.salary) >= ALL (select avg(b.salary) 
                               from employee b
                               group by dept_code);
                               
-- ALL / ANY 
-- 다중행 서브 쿼리의 경우에는 비교 연산자가 일반 연산자와 달라짐. 
-- 비교 연산자의 뒤에 ALL, ANY, IN 이 더 붙음 
-- >= ALL([sub query])
-- : 모든 서브쿼리 결과보다 크거나 같다 
-- >= ANY([sub query])
-- : 서브쿼리 결과보다 최소 하나는 크거나 같다(서브쿼리의 최소값보다 크다)  
-- IN([sub query])
-- : 서브쿼리 결과 중에 하나라도 일치한다. 
 
-- CTE (Common Table Expressions) 
-- 인라인뷰(FROM절에 사용되는 서브쿼리)를 미리 정의해서 메인쿼리가 심플해 질 수 있도록 사용하는 문법
-- WITH ~ 로 인라인뷰를 먼저 빼서 alias를 붙이고 select부터 이어지는 메인쿼리를 간단하게 만듬
WITH menucate AS (
    SELECT menu_name
         , category_name
      FROM tbl_menu a
      JOIN tbl_category b ON a.category_code = b.category_code
)
SELECT
       *
  FROM menucate
 ORDER BY menu_name;
 
 
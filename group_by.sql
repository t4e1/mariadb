
SELECT 
       category_code
  FROM tbl_menu
 WHERE category_code IS NOT NULL
 GROUP BY category_code;

-- SELECT에는 GROUP BY에 있는 컬럼과 그룹함수(SUM, AVG, COUTN  등...) 이외에는 들어가면 안된다.  
-- select menu_price, menu_name 
-- from menu
-- group by menu_price ; 
-- 위와 같은 쿼리는 작동하지 않는다는 뜻. 
-- MariaDB는 group by 컬럼이 들어가도 조회를 하기는 함 (옳바른 쿼리는 아님)   

-- 조회가 필요한 6가지 절(select from where group by having order by)을 모두 사용한 예제
-- select : gorup by 절에서 활용한 컬럼 or 그룹함수만 조회 
--   from :  테이ㅡㅂㄹ 또는 join을 활용한 result set을 작성
--  where : from 절의 각 행마다 적용될 조건을 작성
--  group by : where절까지 만족하는 행들에 대해 그룹이 될 컬럼을 작성
--  having : 그룹별로 적용할 조건을 group by 에서 작성한 컬럼 또는 그룹 함수를 통해 조회
--  order by : select의 결과의 순번, 별칭, 컬럼명 등으로 오름차순 or 내림차순함 

SELECT 
       category_code
     , COUNT(*)
     , SUM(menu_price)
     , AVG(menu_price)
  FROM tbl_menu
 WHERE category_code IS NOT NULL 
 GROUP BY category_code
HAVING SUM(menu_price) >= 24000
 ORDER BY 2;
 
-- COUNT함수에 컬럼명을 사용하면 해당 컬럼에서 NULL 이 아닌 값들만 카운팅해서 보여줌 
-- COUNT함수에 *를 사용하면 해당 컬럼의 모든 행의 갯수를 카운팅해서 보여줌 

-- ---------------------------------
-- 함수의 종류 
-- 단일행 함수
-- : NVL,IFNULL 등과 같이 단일 행마다 적용되어 행의 갯수만큼 함수의 결과가 나오는 함수  
-- 그룹 함수 
-- : COUNT, SUM, AVG 등과 같이 그룹별로 적용되어 그룹의 갯수만큼 결과가 나오는 함수
--  GROUP BY 로 별도의 그룹을 묶지 않으면 전체를 하나의 그룹으로 보고 그룹 함수의 결과가 하나만 나온다

-- WITH ROLLUP
-- 중간합계 및 최종 합계를 도출 
-- group by  에서 두개 이상의 컬럼으로 그룹 형성 시 

SELECT 
       menu_price
     , category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;  
 
-- GROUP BY 의 앞에 적은 콜럼을 기준으로 중간 합계가 나오게 됨. 


CREATE TABLE sales ( 
    CODE INT AUTO_INCREMENT, 
	 YEAR VARCHAR(4),
	 MONTH VARCHAR(2), 
	 product VARCHAR(50),
	 amount decimal(10, 2),
	 PRIMARY KEY(CODE)
	);  
	
INSERT
  INTO sales
(
  CODE, YEAR, MONTH
, product, amount
)
VALUES 
(
  NULL, '2023', LPAD('1', 2, '0')
, 'Product A', 1000.00  
),
(
  NULL, '2023', LPAD('1', 2, '0')
, 'Product B', 1500.00  
),
(
  NULL, '2023', LPAD('2', 2, '0')
, 'Product A', 2000.00  
),
(
  NULL, '2023', LPAD('2', 2, '0') 
, 'Product B', 2500.00
),
(
  NULL, '2023', LPAD('3', 2, '0') 
, 'Product A', 1200.00
),
(
  NULL, '2024', LPAD('3', 2, '0') 
, 'Product B', 1700.00
);

SELECT * FROM sales;

-- 연, 월, 상품명을 모두 하나의 그룹으로 묶어
-- 연, 월 중간 합계 및 전체 합계를 ROLLUP으로 구해 보자

SELECT
       year
     , month
     , product
     , SUM(amount) AS total_sales
  FROM sales
 GROUP BY YEAR, MONTH, product
  WITH ROLLUP ; 


-- SET OPERATORS ( 집합 연산자 )
-- 집합의 개념 ( 합집합, 교집합, 차집합 ) 
-- 기본적인 틀이 똑같아야한다 ( WHERE절 조건은 달라도 됨, 근데 SELECT 절의 수는 무조건 일치해야함 ) 
-- 집합 연산자와 JOIN 의 차이?
-- 집합 연산자는 두개의 쿼리를 묶어서 하나의 결과로 나타낸 것, JOIN 은 

-- UNION 
-- 합집합 ( 교집합을 한번만 )
SELECT
       menu_code
     , menu_price
     , menu_name
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION 
SELECT 
       menu_code
     , menu_price
     , menu_name
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000 ;
 
-- UNION ALL
-- A + B ( 중복허용 ) 
SELECT
       menu_code
     , menu_price
     , menu_name
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION ALL
SELECT 
       menu_code
     , menu_price
     , menu_name
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000 ;
 
-- INTERSECT ( 교집합 ) 
-- MySQL/MariaDB에서는 공식적으로는 Intersect를 지원하지 않음
-- 그래도 실행은 된다 
-- INNER JOIN 이나 IN 을 사용해서 구현이 가능
SELECT
       menu_code
     , menu_price
     , menu_name
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 INTERSECT 
SELECT 
       menu_code
     , menu_price
     , menu_name
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000 ;
 
-- MINUS ( 차집합 )
-- MySQL/MariaDB는 Minus도 지원안함
-- MINUS는 실행도 안됨 
-- LEFT JOIN 을 활용해 구현하기 
SELECT
       a.menu_code
     , a.menu_price
     , a.menu_name
     , a.category_code
     , a.orderable_status 
  FROM tbl_menu a
  LEFT JOIN (SELECT 
                    menu_code
                  , menu_price
                  , menu_name
                  , category_code
                  , orderable_status
               FROM tbl_menu
              WHERE menu_price < 9000 ) b ON a.menu_code = b.menu_code   
 WHERE a.category_code = 10 
   AND b.menu_code IS NULL;
 

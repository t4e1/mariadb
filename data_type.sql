-- data type 

-- 숫자형 datatype
-- 정수쓸 땐 int (21억이상은 bigint) / 실수에는 float 

-- 문자형 
-- varchar() 

-- 구분자 (delimiter)
-- mariadb는 특수기호를 구분자로 받아들임 
SELECT CAST('2023!5!30');

-- 명시적 형변환
-- 숫자 -> 숫자
SELECT AVG(menu_price) FROM tbl_menu; 
SELECT CAST(AVG(menu_price) AS UNSIGNED INTEGER) AS AVG FROM tbl_menu;
SELECT CAST(AVG(menu_price) AS FLOAT) AS AVG FROM tbl_menu; -- 소수점이하 한자리까지
SELECT CAST(AVG(menu_price) AS DOUBLE) AS AVG FROM tbl_menu; -- 소수점이하 12자리까지

-- 문자 -> 날짜 
-- 2023.12.27을 date형으로 변환
SELECT CAST('2023$12$27' AS DATE);
SELECT CONVERT('2023$12$27' , DATE);

-- 숫자 -> 문자
SELECT CONCAT(CAST(1000 AS CHAR), '원');



-- 암시적 형변환 
-- 연산자 사용시 자동 형변환이 되는데 주의해야 함 
-- 사용하지 않는게 좋다 
SELECT 1+'2';
SELECT CONCAT('1','2');

SELECT '안녕' + '하세요' ; -- 모든 문자는 산술연산, 비교 연산을 만나면 0이됨 
SELECT 5 > '반가워' ; -- '반가워'가 비교 연산자 떄문에 0 이 됨으로 true의 의미인 1이 반호나



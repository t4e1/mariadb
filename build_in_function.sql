 -- ASCII(), CHAR()
SELECT ASCII('a'), CHAR(97);

 -- BIT_LENGTH(), CHAR_LENGTH(), LENGTH()
 -- 영어, 숫자, 특수기호 제회 모든 언어는 한 글자에 3byte를 차지  
SELECT 
       BIT_LENGTH('한글')
     , CHAR_LENGTH('한글')
     , LENGTH('한글');

-- CONCAT(문자열1, 문자열2, 문자열3, ...), CONCAT_WS(구분자, 문자열1, 문자열2,...)     
SELECT CONCAT('nice','to','meet','you'); 
SELECT CONCAT_WS(' ', 'nice','shot', 'good');
SELECT CONCAT(CAST(menu_price AS CHAR), '원') FROM tbl_menu;


SELECT 
       ELT(2, '1', '2', '3'),
       FIELD('1', '2', '3', '1'),
       FIND_IN_SET('2', '2, 3, 1'),
       INSTR('ABBCCD', 'BC'),
       LOCATE('b', 'c,b,a'); 
       
-- INSERT(기준 문자열, 위치, 위치에서 삭제할 길이, 삽입할 문자열)
SELECT INSERT('Hello World!', 7, 3, 'Hi');

-- LEFT(문자열, 길이), RIGHT(문자열, 길이) 
SELECT LEFT('hello world!', 3), RIGHT('hello world!', 3);

-- UPPER(문자열), LOWER(문자열) 
SELECT UPPER('hello world!'), LOWER('HELLO WORLD!');

SELECT LPAD('hi', 3, 'x'), RPAD('hi', 3, 'x'); 

SELECT LTRIM('         왼쪽'), RTRIM('오른쪽           ');  

SELECT 
       TRIM('          MariaDB       '),
       TRIM(BOTH '@' FROM '@@@@MariaDB@@@@'),
       TRIM(LEADING '@' FROM '@@@@MariaDB@@@@'), 
       TRIM(TRAILING '@' FROM '@@@@MariaDB@@@@');

-- REPEAT(문자열, 횟수)
-- 입력받은 문자열을 횟수만큼 반복 
SELECT REPEAT('x', 5);

-- REPLACE(문자열, 찾을 문자열, 바꿀 문자열) 
-- 입력받은 문자열에서 찾을 문자열을 바꿀 문자열로 바꾼다 
SELECT REPLACE('마리아DB', '마리아', 'Maria'); 

-- REVERSE(문자열)
-- 입력받은 값을 반대로 출력해줌 ( abc -> cba ) 
SELECT REVERSE('happiness');

SELECT CONCAT('My house', SPACE(1), 'is', SPACE(1), 'too far');

SELECT SUBSTRING('Hello, World!', 8, 6);
SELECT SUBSTRING('Hello, World!', 2);

SELECT SUBSTRING_INDEX('Hello, World!, Im, Fine!', ',', 2)
		 , SUBSTRING_INDEX('Hello, World!, Im, Fine!', ',', -2);
		 
		 
-- 숫자 관련 함수
-- FORMAT(숫자, 소수점 자릿수)
-- 1000단위로 쉼표를 표시해주고, 입력한 소수점 자릿수까지만 표기해줌(반올림)
-- ex) FORMAT(100000.12345, 4) -> 100,000.1235 
SELECT FORMAT(12312314566, 3); 

-- BIN(숫자), OCT(숫자), HEX(숫자)
-- 입력한 숫자를 각각 2진수, 8진수, 16진수로 변경  
SELECT BIN(65), OCT(65), HEX(65); -- BIN(2진수), OCT(8진수), HEX(16진수)

-- ABS(숫자)
-- 입력받은 숫자를 모두 양수로 만듬 
SELECT ABS(-123); 

-- CEILING(숫자), FLOOR(숫자), ROUND(숫자) 
-- 각각 올림, 내림, 반올림 연산
SELECT CEILING(1234.56), FLOOR(1234.56), ROUND(1234.56);

-- CONV(숫자, 원래 진수, 변환할 진수)
-- 숫자를 변환할 진수의 숫자로 변환  
SELECT CONV('A', 16, 10);

-- MOD(숫자1, 숫자2) 
-- 숫자1을 숫자2로 나눴을 때 남는 나머지 반환
SELECT MOD(10, 3); 

-- POWER(숫자1, 숫자2), SQRT(숫자) 
-- POWER: 숫자1을 숫자2만큼 곱한다 (거듭제곱) 
-- SQRT: 숫자의 제곱근 
SELECT POWER(3, 2), SQRT(81); 

-- RAND() * 생성할 난수 갯수 + 난수의 초기값 
-- RAND()자체는 0.000... ~ 0.9999... 사이의 값을 반환 
-- ex) 1~10 까지의 난수 생성 : FLOOR(RAND() * 10 + 1)
-- 1. 몇개의 난수를 생성할 것인지 계산 -> 2. 입력 
SELECT RAND();
SELECT FLOOR(RAND()*10 + 22);  

-- SIGN(숫자) 
-- 양수면 1, 음수면 -1, 0이면 0을 반환 
SELECT SIGN(123);

-- TRUNCATE(숫자, 정수)
-- 정수가 양수면 소수점 아래로 정수만큼 표현하고 나머지를 버림 
-- 정수가 음수면 소수점 위로 정수만큼 표현하고 나머지를 버림 
SELECT TRUNCATE(12345.12345, 2);
SELECT TRUNCATE(12345.12345, -2); 


-- 날짜, 시간 관련 함수 

SELECT ADDDATE('2023-12-28', INTERVAL 30 DAY );
SELECT SUBDATE('2023-12-28', INTERVAL 30 DAY );

SELECT SUBDATE('2023-12-28', INTERVAL 30 MONTH );

SELECT ADDTIME('2023-12-28 10:27:00', '1:0:10'); 

SELECT CURDATE(), CURTIME(), NOW(), SYSDATE(); 

SELECT @@GLOBAL.time_zone; 

SELECT YEAR(CURDATE()), MONTH(CURDATE()), DAY(CURDATE()), DAY(CAST('2023-12-28' AS DATE));

SELECT HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

SELECT DATE(sysdate()), TIME(SYSDATE());

SELECT DATEDIFF('2024-06-14', NOW()), TIMEDIFF('18:00:00', CURTIME());

SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

SELECT LAST_DAY(CURDATE());

-- MAKEDATE(연도, 지난 날)
-- 
SELECT MAKEDATE(2023, 35);
 
-- MAKETIME(시, 분, 초) 
-- 
SELECT MAKETIME(17, 50, 01);

SELECT TIME_TO_SEC(CURTIME());
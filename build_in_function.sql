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

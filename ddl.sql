-- DDL 
-- 스키마 : 데이터의 틀( 컬럼, 타입이 어떤지, 몇 바이트가 들어가있는지, 제약조건은 무엇인지 ) 을 말함 

-- CREATE

CREATE TABLE IF NOT EXISTS tb1 (
    pk INT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE = INNODB;

DESC tb1;

INSERT 
  INTO tb1
VALUES 
(
  1, 2, 'Y'
); 

-- ---------------------

CREATE TABLE IF NOT EXISTS tb2 (
    pk INT PRIMARY KEY AUTO_INCREMENT, 
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y', 'N'))
) ENGINE = INNODB;

INSERT 
  INTO tb2
VALUES 
(
  null, 2, 'Y'
),
(
  null, 2, 'Y'
); 

DESC tb2;
SELECT * FROM tb2;
DROP TABLE tb1 ; 


-- ALTER 
-- 테이블의 부분을 추가나 변경/삭제 하는것 

ALTER TABLE tb2 
  ADD col2 INT UNIQUE ;

ALTER TABLE tb2 
 DROP COLUMN col2 ; 
 
ALTER TABLE tb2 
CHANGE COLUMN col2 col3 VARCHAR(255) ;

-- 제약조건 제거
ALTER TABLE tb2 
MODIFY pk INT;

ALTER TABLE tb2 DROP PRIMARY KEY;


-- TRUNCATE 

CREATE TABLE if NOT EXISTS tb6 ( 
  pk INT AUTO_INCREMENT PRIMARY KEY, 
  fk INT, 
  col1 VARCHAR(255), 
  CHECK(col1 IN ('Y', 'N'))
) ENGINE=INNODB;

INSERT 
  INTO tb6 
VALUES (NULL, 10, 'Y'), (NULL, 20, 'Y'), (NULL, 30, 'Y'), (NULL, 40, 'Y');

SELECT * FROM tb6;

TRUNCATE tb6;

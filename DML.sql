-- DML (Data Manipulation Language) 
-- 데이터를 조작에 관련된 SQL 

-- INSERT 
-- 테이블에 새로운 행을 추가 

DESC tbl_menu;

INSERT 
  INTO tbl_menu
(
  menu_code 
, menu_name
, menu_price
, category_code
, orderable_status
) 
VALUES 
(
  NULL
, '바나나해장국'
, 8500
, 4
, 'Y'
);

SELECT 
       * 
  FROM tbl_menu 
 ORDER BY 1 DESC ; 
 
DELETE 
  FROM tbl_menu
 WHERE menu_code = 22;

ALTER TABLE tbl_menu AUTO_INCREMENT = 22; 

-- UPDATE
-- 기존에 있던 행의 정보를 수정 
-- WHERE 절 추가 안할시 전체 행이 바뀜으로 조건절 꼭 넣어야함 

UPDATE tbl_menu 
   SET menu_name = '딸기해장국'
 WHERE menu_code = 22;
 
-- DELETE 
-- 행을 삭제하는 SQL 

-- REPLACE 
-- 기존에 없는 값이면 INSERT, 기존에 있는 값이면 UPDATE로 동작을 함 
-- INSERT + UPDATE 합한 기능 
-- MERGE 나 최신정보로의 UPDATE등의 상황이 아니면 사용이 권장되지는 않음
-- 제약조건에 어긋나는 정보가 들어왔을때 INSERT나 UPDATE는 에러를 일으킬 수 있는데, 
-- REPLACE 사용시에는 에러가 나지 않아 어디에 문제가 있는지 에러 파악이 힘들어짐 ( 오히려 에러가 나는걸 권장 ) 
-- 평소에는 목적에 맞게 INSERT/UPDATE로 쓰고 특수한 상황에서만 사용할 것 
 
-- PRIMARY KEY / FOREIGN KEY 
-- PRIMARY KEY 
-- : 해당 테이블의 해당 컬럼에 있어서는 절대 중복값이나 NULL값이 들어가면 안됨 

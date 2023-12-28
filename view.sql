CREATE VIEW v_menu 
AS
SELECT 
       menu_name
     , menu_price
  FROM tbl_menu;

SELECT 
       menu_name
     , menu_price
  FROM tbl_menu;

SELECT 
       menu_name
     , menu_price
  FROM v_menu;
  
UPDATE tbl_menu
   SET menu_price = 10 
 WHERE menu_name = '흑마늘아메리카노';
 
SELECT * FROM tbl_menu;

-- --------------------
-- VIEW 생성
CREATE VIEW hansik AS
SELECT 
       menu_code 
     , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu 
 WHERE category_code = 4;

-- 생성된 VIEW 조회
SELECT * FROM hansik;

-- INSERT INTO hansik VALUES (null, '식혜맛국밥', 5500, 4, 'Y');    -- 에러 발생
INSERT 
  INTO hansik
VALUES (99, '수정과맛국밥', 5500, 4, 'Y');   
SELECT * FROM hansik;
SELECT * FROM tbl_menu; -- VIEW를 통해서도 원본테이블에 영향 o 

UPDATE hansik
   SET menu_name = '버터맛국밥', menu_price = 5700 
 WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

DELETE FROM hansik WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

DROP VIEW hansik;

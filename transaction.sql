-- 트랜잭션 
/* TRANSACTION 은 데이터베이스의 무결성(일관성?) 을 위한
데이터 베이스에서 한 번에 수행되는 작업의 단위
새로운  
*/

-- auto commit 비 활성화

SET autocommit = OFF;
SET autocommit = 0 ;

-- START TRANSACTION 



SELECT * FROM tbl_menu;

INSERT INTO tbl_menu VALUES (NULL, '바나나 해장국', 8500, 4, 'Y');
UPDATE tbl_menu SET menu_name = '수정된 메뉴' WHERE menu_code = 5;

COMMIT ; 
ROLLBACK ;

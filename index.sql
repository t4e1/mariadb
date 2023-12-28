CREATE TABLE phone (
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);

INSERT 
  INTO phone (phone_code , phone_name , phone_price )
VALUES 
(1, 'galaxyS23', 1200000),
(2, 'iPhone14pro', 1433000),
(3, 'galaxyZfold3', 1730000);

SELECT * FROM phone;

EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

CREATE INDEX idx_name ON phone (phone_name);

SHOW INDEX FROM phone;

OPTIMIZE TABLE phone;

DROP INDEX idx_name ON phone;
SHOW INDEX FROM phone;
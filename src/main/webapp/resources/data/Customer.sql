CREATE TABLE customer (
    customer_id      VARCHAR2(100) PRIMARY KEY,
    customer_pw      VARCHAR2(100) NOT NULL,
    customer_name    VARCHAR2(100) NOT NULL,
    customer_phone   VARCHAR2(13) NOT NULL,
    customer_state   CHAR(1) DEFAULT 1,
    reg_date         DATE DEFAULT sysdate,
    update_date      DATE DEFAULT sysdate,
    auth             VARCHAR2(8) DEFAULT 'customer',
    business_number  NUMBER(10)
);

CREATE TABLE persistent_logins (
    username   VARCHAR2(200) NOT NULL,
    series     VARCHAR2(200) PRIMARY KEY,
    token      VARCHAR2(200) NOT NULL,
    last_used  TIMESTAMP NOT NULL
);

SELECT
    *
FROM
    customer;
    
select * from persistent_logins;

DELETE FROM customer;

COMMIT;

ALTER TABLE customer ADD auth VARCHAR2(8) DEFAULT 'customer';

INSERT INTO customer (
    customer_id,
    customer_pw,
    customer_name,
    customer_phone
) VALUES (
    'customer@gmail.com',
    '1234',
    'customer',
    '111-1111-1111'
);

COMMIT;

UPDATE customer
SET
    auth = 'ROLE_ADMIN'
WHERE
    customer_id = 'zoxcibk@naver.com';
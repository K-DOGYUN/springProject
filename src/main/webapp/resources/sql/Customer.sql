CREATE TABLE customer (
    customer_id    VARCHAR2(100) PRIMARY KEY,
    customer_pw    VARCHAR2(100) NOT NULL,
    customer_name  VARCHAR2(100) NOT NULL,
    customer_phone VARCHAR2(13) NOT NULL,
    customer_state CHAR(1) DEFAULT 1,
    reg_date       DATE DEFAULT sysdate,
    update_date    DATE DEFAULT sysdate,
    auth           VARCHAR2(8) DEFAULT 'customer'
);

ALTER TABLE customer ADD auth VARCHAR2(8) DEFAULT 'customer';

SELECT
    *
FROM
    customer;

CREATE SEQUENCE addr_seq MINVALUE 0 MAXVALUE 9999;

SELECT
    c.customer_id    customer_pw,
    customer_name,
    customer_phone,
    customer_state,
    c.reg_date,
    c.update_date,
    auth,
    addr_num,
    addr_main,
    addr_detail,
    addr_zipno,
    addr.customer_id,
    addr.reg_date    AS addr_reg_date,
    addr.update_date AS addr_update_date
FROM
    customer c
    LEFT OUTER JOIN address  addr ON c.customer_id = addr.customer_id
WHERE
    c.customer_id = 'aefdaf002@naver.com'
ORDER BY
    addr_num ASC;

SELECT
    c.customer_id    customer_pw,
    customer_name,
    customer_phone,
    customer_state,
    c.reg_date,
    c.update_date,
    auth,
    addr_num,
    addr_main,
    addr_detail,
    addr_zipno,
    addr.customer_id,
    addr.reg_date    AS addr_reg_date,
    addr.update_date AS addr_update_date
FROM
    customer c
    LEFT OUTER JOIN address  addr ON c.customer_id = addr.customer_id
WHERE
    c.customer_id = 'aefdaf002@naver.com'
ORDER BY
    addr_num ASC;
    

CREATE TABLE customer (
    customer_id     VARCHAR2(100) PRIMARY KEY,
    customer_pw     VARCHAR2(100) NOT NULL,
    customer_name   VARCHAR2(100) NOT NULL,
    customer_phone  VARCHAR2(13) NOT NULL,
    customer_state  CHAR(1) DEFAULT 1,
    reg_date        DATE DEFAULT sysdate,
    update_date     DATE DEFAULT sysdate
);

select * from customer;
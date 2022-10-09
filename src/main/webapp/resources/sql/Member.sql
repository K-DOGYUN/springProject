CREATE TABLE member (
    member_id     VARCHAR2(100) PRIMARY KEY,
    member_pw     VARCHAR2(100) NOT NULL,
    member_name   VARCHAR2(100) NOT NULL,
    member_phone  VARCHAR2(100) NOT NULL,
    auth          VARCHAR2(100) NOT NULL,
    member_state  NUMBER(1) NOT NULL,
    business_no   NUMBER(10),
    emp_no        NUMBER(10),
    member_reg    DATE NOT NULL,
    member_update DATE NOT NULL
);

SELECT * FROM member;

select sysdate as reg_date, sysdate as update_date from dual;

DROP TABLE member;
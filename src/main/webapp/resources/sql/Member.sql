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

delete from member;
commit;

select sysdate as reg_date, sysdate as update_date from dual;

DROP TABLE member;

update member set member.member_state = 1 where member.member_id = 'customer004@naver.com';
commit;
SELECT
    m.member_id as mid,
    m.member_pw,
    m.member_name,
    m.member_phone,
    m.auth,
    m.member_state,
    m.business_no,
    m.emp_no,
    m.member_reg,
    m.member_update,
    addr.addr_num,
    addr.addr_main,
    addr.addr_detail,
    addr.addr_zipno,
    addr.member_id,
    addr.addr_reg,
    addr.addr_update
FROM
    member  m
    LEFT OUTER JOIN address addr ON m.member_id = addr.member_id
WHERE
    m.member_id = 'customer005@naver.com'
ORDER BY
    addr_num ASC;
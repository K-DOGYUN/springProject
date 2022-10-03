CREATE TABLE address (
    addr_num    VARCHAR2(13) PRIMARY KEY,
    addr_main   VARCHAR2(200) NOT NULL,
    addr_detail VARCHAR2(200),
    addr_zipno  NUMBER(5) NOT NULL,
    customer_id VARCHAR2(100) NOT NULL
        CONSTRAINT fk_addr
            REFERENCES customer ( customer_id ),
    reg_date    DATE DEFAULT sysdate,
    update_date DATE DEFAULT sysdate
);

SELECT
    *
FROM
    address;

DROP TABLE address;

SELECT
    'a'
    || to_char(sysdate, 'YYYYMMDD')
    || substr(addr_seq.NEXTVAL + 10000, 2) AS addr_no,
    sysdate                                AS reg_date,
    sysdate                                AS update_date
FROM
    dual;

DELETE FROM address
WHERE
    addr_num = 'a202210030035';

SELECT
    *
FROM
    address
WHERE
    address.customer_id = 'aefdaf002@naver.com';
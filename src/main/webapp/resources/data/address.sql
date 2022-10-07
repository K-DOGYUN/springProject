CREATE TABLE address (
    addr_num     VARCHAR(13) PRIMARY KEY,
    addr_main    VARCHAR(200) NOT NULL,
    addr_detail  VARCHAR(200),
    addr_zipno   NUMBER(5),
    customer_id  VARCHAR(100)
        CONSTRAINT fk_addr
            REFERENCES customer ( customer_id ),
    reg_date     DATE DEFAULT sysdate,
    update_date  DATE DEFAULT sysdate
);

CREATE SEQUENCE addr_seq MINVALUE 0 MAXVALUE 9999;

INSERT INTO address (
    addr_num,
    addr_main,
    addr_detail,
    addr_zipno,
    customer_id
) VALUES (
    'a'
    || to_char(sysdate, 'YYYYMMDD')
    || substr(addr_seq.NEXTVAL + 10000, 2),
    '111',
    '111',
    12345,
    'customer@naver.com'
);

select * from address;
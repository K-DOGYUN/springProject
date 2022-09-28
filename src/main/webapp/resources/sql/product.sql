CREATE TABLE product (
    p_num         VARCHAR2(13) PRIMARY KEY,
    p_name        VARCHAR2(100) NOT NULL,
    p_stat        VARCHAR2(20) DEFAULT '일반' NOT NULL
        CONSTRAINT stat_ck CHECK ( p_stat IN ( '일반', '중고', '재생' ) ),
    p_stock       NUMBER(8) DEFAULT 0 NOT NULL
        CONSTRAINT stock_ck CHECK ( p_stock >= 0 ),
    p_price       NUMBER(12) NOT NULL
        CONSTRAINT price_ck CHECK ( p_price >= 0 ),
    deliv_fee     NUMBER(12) NOT NULL
        CONSTRAINT deliv_ck CHECK ( deliv_fee >= 0 ),
    s_num         VARCHAR2(13) NOT NULL,
    manufac_num   VARCHAR2(100),
    category_num  NUMBER(8) NOT NULL
        CONSTRAINT category_fk
            REFERENCES category ( category_number ),
    reg_date      DATE NOT NULL,
    up_date       DATE NOT NULL
);

CREATE SEQUENCE p_seq MINVALUE 0 MAXVALUE 9999;

INSERT INTO product VALUES (
    'p'
    || to_char(sysdate, 'YYYYMMDD')
    || substr(p_seq.NEXTVAL + 10000, 2),
    'product',
    '일반',
    100,
    10000,
    2000,
    's2018',
    'm77',
    2491,
    sysdate,
    sysdate
);

SELECT
    *
FROM
    product
ORDER BY
    p_num DESC;

SELECT
    'p'
    || to_char(sysdate, 'YYYYMMDD')
    || substr(p_seq.NEXTVAL + 10000, 2)
FROM
    dual;

SELECT
    *
FROM
    product
WHERE
    p_num = 'p202209260021';
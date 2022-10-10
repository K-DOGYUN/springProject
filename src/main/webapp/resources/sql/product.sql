CREATE TABLE product (
    product_no     VARCHAR2(100) PRIMARY KEY,
    product_name   VARCHAR2(100) NOT NULL,
    manufac_name   VARCHAR2(100) NOT NULL,
    product_stat   NUMBER(1) NOT NULL,
    product_stock  NUMBER(10) NOT NULL,
    product_price  NUMBER(10) NOT NULL,
    deliv_fee      NUMBER(10) NOT NULL,
    seller_no      VARCHAR2(100) NOT NULL
        CONSTRAINT fk1_product
            REFERENCES member ( member_id ),
    category_no    NUMBER(8) NOT NULL
        CONSTRAINT fk2_product
            REFERENCES category ( category_number ),
    product_reg    DATE DEFAULT sysdate,
    product_update DATE DEFAULT sysdate
);

SELECT
    *
FROM
    product;
commit;
DROP TABLE product;

CREATE SEQUENCE p_seq MINVALUE 0 MAXVALUE 9999;

INSERT INTO product VALUES (
    'p'
    || to_char(sysdate, 'YYYYMMDD')
    || substr(p_seq.NEXTVAL + 10000, 2),
    'product',
    'Á¦Á¶»ç',
    1,
    100,
    10000,
    2000,
    'seller001@naver.com',
    '1880102',
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
    product p, img i, option o
WHERE
    p_num = 'p202210110021';
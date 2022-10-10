CREATE TABLE options (
    option_no     VARCHAR2(100) PRIMARY KEY,
    option_name   VARCHAR2(100) NOT NULL,
    option_detail VARCHAR2(100) NOT NULL,
    option_stock  NUMBER(10) NOT NULL,
    option_price  NUMBER(10) NOT NULL,
    product_no    VARCHAR2(100) NOT NULL
        CONSTRAINT fk_option
            REFERENCES product ( product_no ),
    option_reg date not null,
    option_update date not null
);

drop table options;

CREATE SEQUENCE o_seq MINVALUE 0 MAXVALUE 9999;
CREATE TABLE images (
    img_num      VARCHAR2(13) PRIMARY KEY,
    img_name     VARCHAR2(200) NOT NULL,
    img_path     VARCHAR2(50) NOT NULL,
    img_uuid     VARCHAR2(50) NOT NULL,
    parent_num   VARCHAR(13) NOT NULL,
    parent_type  VARCHAR(1) NOT NULL
        CONSTRAINT img_ck CHECK ( parent_type IN ( 'p', 'r', 'q' ) )
);

DROP TABLE images;

CREATE SEQUENCE img_seq MINVALUE 0 MAXVALUE 9999;

SELECT
    *
FROM
    images
ORDER BY
    img_num DESC;

SELECT
    *
FROM
    images
WHERE
    parent_num = 'p202209260021';
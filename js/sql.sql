CREATE USER SMC_USER IDENTIFIED BY SMC_USER;

GRANT CREATE SESSION TO SMC_USER;

CREATE TABLE A (A varchar2(10)) 

GRANT CREATE TABLE TO SMC_USER;

CREATE TABLESPACE smc
DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\smc.DBF' 
SIZE 2048M 
AUTOEXTEND ON 
NEXT 4M MAXSIZE UNLIMITED
LOGGING PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K 
SEGMENT SPACE MANAGEMENT MANUAL 
FLASHBACK ON;

ALTER USER SMC_USER
IDENTIFIED BY SMC_USER
DEFAULT TABLESPACE smc
quota unlimited on smc;

INSERT INTO A(A) VALUES ('ABCTEST');

DROP TABLE A;

CREATE TABLE PRODUCT (
    id number NOT NULL,
    category_id number NOT NULL,
    name varchar2(200) NOT NULL,
    price number NOT NULL,
    stock number DEFAULT 0,
    description varchar2(1000),
    origin varchar2(200),
    CONSTRAINT PRODUCT_PK PRIMARY KEY (id)
);

CREATE TABLE CATEGORY(
    id number NOT NULL,
    name varchar2(200) NOT NULL,
    CONSTRAINT CATEGORY_PK PRIMARY KEY (id)
);

CREATE TABLE MEMBER(
    id number NOT NULL,
    password varchar2(100) NOT NULL,
    name varchar2(50) NOT NULL,
    email varchar2(100) NOT NULL,
    phone varchar2(40),
    address varchar2(200),
    age number(3),
    CONSTRAINT MEMBER_PK PRIMARY KEY (id)
);

CREATE TABLE PAYMENT_HISTORY(
    id number NOT NULL,
    order_date date NOT NULL,
    order_status varchar2(16) NOT NULL,
    order_count number NOT NULL,
    order_price number NOT NULL,
    product_id number NOT NULL,
    member_id number NOT NULL,
    address varchar2(200) NOT NULL,
    CONSTRAINT PAYMENT_HISTORY_PK PRIMARY KEY (id),
    CONSTRAINT PAYMENT_HISTORY_CK CHECK (order_status IN('PAYMENT_WAITING', 'PAYMENT_SUCCESS', 'SHIPPING', 'SHIPPED'))
);

COMMENT ON COLUMN PAYMENT_HISTORY.ORDER_STATUS IS '주문 진행 단계, 4가지 단계만 들어갈 수 있도록 함';

SELECT *
FROM ALL_COL_COMMENTS
WHERE TABLE_NAME = 'PAYMENT_HISTORY'

INSERT INTO PRODUCT(ID, CATEGORY_ID, NAME, PRICE, STOCK, DESCRIPTION, ORIGIN)
VALUES(49, 1, "2021년식 맥북", 1690000, 10, "애플 그 이상", "캘리포니아");

CREATE TABLE CATALOGUE (
    id number NOT NULL,
    name varchar2(200) NOT NULL,
    stock number DEFAULT 0,
    origin varchar2(200),
);

INSERT INTO CATALOGUE
SELECT id, name, price, origin
FROM PRODUCT
WHERE price >= 100000;

update PRODUCT
SET STOCK = STOCK + 5
WHERE price >= 100000;

DELETE FROM PRODUCT WHERE ID=49;
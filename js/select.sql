-- *이름* -> 데이터중 "이름" 이 포함된 데이터를 찾아옴
-- *이름 => 데이터중 "이름" 으로 끝나는 데이터를 찾아옴
-- 이름* -> 데이터중 "이름" 으로 시작하는 데이터를 찾아옴
-- SQL에서는 LIKE구문을 사용할 때 *이 아닌 %문자를 사용
--이름* -> 이름%

SELECT * FROM MEMBER WHERE email like '%gmail.com';

SELECT * FROM MEMBER WHERE email like '%gmail.com' and LENGTH(MEMBER.EMAIL) >= 12;

-- LENGTH(컬럼명) - 해당 컬럼의 길이가 나옵니다
-- 조건과 조건 사이를 잇는 AND OR 조건은 다음과 같이 컬럼1 = '어쩌구' AND 컬럼2 = '저쩌구
-- 와 같이 AND, OR 로 쓰입니다

SELECT * FROM MEMBER WHERE (email like '%gmail.com' and LENGTH(MEMBER.EMAIL) >= 12) OR 
    (email like '%naver.com' and LENGTH(MEMBER.EMAIL) >= 10)

-- 조건중 AND와 OR를 분리하고 싶을때는
-- (조건1 AND 조건2) OR (조건3 AND 조건4)

-- 테이블의 컬럼 개수를 출력하고 싶으면 다음 쿼리를 실행한다
SELECT COUNT(1) FROM MEMBER

SELECT  * FROM PAYMENT_HISTORY WHERE (order_price >= 1000000 and ORDER_COUNT <= 10) OR (order_price <= 100000 and ORDER_COUNT >= 10)

-- 조건물에 IN절을 사용 가능
-- IN절은 뒤에 따라오는 문자열 여러개 중 하나라고 들어있으면 TRUE를 반환합니다
-- 예) 'A' IN('A', 'B', 'C') -> TRUE
SELECT  * FROM PAYMENT_HISTORY WHERE ((order_price >= 1000000 and ORDER_COUNT <= 10) OR 
    (order_price <= 100000 and ORDER_COUNT >= 10)) AND address IN ('서울','서울시','서울특별시')

-- SELECT A.NUMBER AS SUMMARY_NUMBER, B.NUMBER AS, C.NUMBER FROM A, B, C
-- 컬럼명 뒤, 혹은 함수 뒤에 "AS 불리게될 컬럼명" 을 적어주시면 불리게될 컬렴명으로 출력
SELECT COUNT(1) AS TABLE_ROW_COUNT FROM MEMBER

SELECT 
    * 
FROM PAYMENT_HISTORY 
WHERE ((order_price >= 1000000 and ORDER_COUNT <= 10) OR 
       (order_price <= 100000 and ORDER_COUNT >= 10)) AND address NOT IN ('서울','서울시','서울특별시')

    -- BRTWEEN 문법은 X부터 Y까지 사이에 있는 데이터를 뽑기에 적합합니다.
    -- 예) PRICE BETWEEN 10000 AND 100000;
    SELECT  
        * 
    FROM PAYMENT_HISTORY 
    WHERE order_price BETWEEN 100000 AND 10000000

    -- EXIST <- 존재하는지를 확인할 수 있다
    -- 예) 컬럼명 IS NULL
    SELECT  
        * 
    FROM PRODUCT
    WHERE ORIGIN IS NULL 

    SELECT * 
    FROM MEMBER
    WHERE 
        ((EMAIL like '%gmail.com' AND ADDRESS LIKE '%서울시' AND LENGTH(PASSWORD) >= 10) OR
        (EMAIL like '%naver.com' AND PHONE LIKE '%1%')) AND
    age <= 100;

    --DISTINCT 문은 중복을 제거할 수 있습니다
    -- 예를 들어 address가 ('서울시','서울시','은평구')와 같이 3row가 있다ㅏ고 가정한다면
    -- 다음과 같이 사용하면 중복을 제거할 수 있습니다, 따라서 값은 ('서울시','은평구')
    -- SELECT DISTINCT COLUMN FROM TABLE;

    SELECT DISTINCT
    ADDRESS
    FROM MEMBER

    -- ORDER BY 문은 뽑아온 데이터를 정렬할때 사용
    -- DESC는 내림차순, ASC는 오름차순
    -- 사용 법은 SELECT문 제일 뒤에(WHERE) 사용
    -- SELECT * FROM TABLE ORDER BY ID DESC;
    
SELECT
    MEMBER.NAME AS 구매자명, 
    PAYMENT_HISTORY.ORDER_PRICE AS 구매금액, 
    PAYMENT_HISTORY.ORDER_DATE AS 구매일자
FROM   
    MEMBER, PAYMENT_HISTORY
WHERE
    MEMBER.ID = PAYMENT_HISTORY.MEMBER_ID AND 
    PAYMENT_HISTORY.ORDER_PRICE >= 1000000
ORDER BY ORDER_PRICE DESC

SELECT
    PAYMENT_HISTORY.ORDER_PRICE AS 구매금액, CATEGORY.NAME AS 카테고리, PRODUCT.NAME AS 상품명
FROM 
    PAYMENT_HISTORY, PRODUCT, CATEGORY
WHERE
    PAYMENT_HISTORY.ORDER_PRICE = PRODUCT.PAYMENT_HISTORY_ORDER_PRICE AND
    CATEGORY.NAME = PAYMENT_HISTORY.CATEGORY.NAME

    SELECT 
    PAYMENT_HISTORY.ORDER_PRICE AS 구매금액,
    PAYMENT_HISTORY.ORDER_COUNT AS 구매개수,
    PRODUCT.NAME AS 상품명,
    CATEGORY.NAME AS 카테고리명
FROM
    PAYMENT_HISTORY, PRODUCT, CATEGORY
WHERE
    PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID AND
    PRODUCT.CATEGORY_ID = CATEGORY.ID

SELECT 
    PAYMENT_HISTORY.ORDER_PRICE AS 구매금액,
    PAYMENT_HISTORY.ORDER_COUNT AS 구매개수,
    PRODUCT.NAME AS 상품명,
    CATEGORY.NAME AS 카테고리명,
    MEMBER.NAME AS 구매자명
FROM
    PAYMENT_HISTORY, PRODUCT, CATEGORY, MEMBER
WHERE
    PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID AND
    PRODUCT.CATEGORY_ID = CATEGORY.ID AND
    PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID
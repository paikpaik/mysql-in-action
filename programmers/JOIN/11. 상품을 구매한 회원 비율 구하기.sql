-- Level 5
-- 문제 설명
/*
 다음은 어느 의류 쇼핑몰에 가입한 회원 정보를 담은 USER_INFO 테이블과 온라인 상품 판매 정보를 담은 
ONLINE_SALE 테이블 입니다. 

 USER_INFO 테이블은 아래와 같은 구조로 되어있으며 USER_ID, GENDER, AGE, JOINED는 각각 회원 ID, 
성별, 나이, 가입일을 나타냅니다.

 GENDER 컬럼은 비어있거나 0 또는 1의 값을 가지며 0인 경우 남자를, 1인 경우는 여자를 나타냅니다.

 ONLINE_SALE 테이블은 아래와 같은 구조로 되어있으며 ONLINE_SALE_ID, USER_ID, PRODUCT_ID, 
SALES_AMOUNT, SALES_DATE는 각각 온라인 상품 판매 ID, 회원 ID, 상품 ID, 판매량, 판매일을 나타냅니다.

 동일한 날짜, 회원 ID, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.
*/

-- 문제
/* 
 USER_INFO 테이블과 ONLINE_SALE 테이블에서 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 
상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을 
년, 월 별로 출력하는 SQL문을 작성해주세요. 상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고, 
전체 결과는 년을 기준으로 오름차순 정렬해주시고 년이 같다면 월을 기준으로 오름차순 정렬해주세요.
*/

-- 정답 코드
SELECT YEAR(O.SALES_DATE) AS YEAR, 
    MONTH(O.SALES_DATE) AS MONTH, 
    COUNT(DISTINCT O.USER_ID) AS PUCHASED_USERS, 
    ROUND(COUNT(DISTINCT O.USER_ID) / (
        SELECT COUNT(DISTINCT(USER_ID)) 
        FROM USER_INFO
        WHERE JOINED like '%2021%'), 1) AS PUCHASED_RATIO
FROM USER_INFO U, ONLINE_SALE O
WHERE U.USER_ID = O.USER_ID AND
    DATE_FORMAT(U.JOINED, '%Y') = '2021'
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH
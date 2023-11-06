-- Level 2
-- 문제 설명
/*
 다음은 어느 의류 쇼핑몰에서 판매중인 상품들의 상품 정보를 담은 PRODUCT 테이블과 오프라인 상품 판매 
정보를 담은 OFFLINE_SALE 테이블 입니다. 

 PRODUCT 테이블은 아래와 같은 구조로 PRODUCT_ID, PRODUCT_CODE, PRICE는 각각 상품 ID, 상품코드, 
판매가를 나타냅니다.

 상품 별로 중복되지 않는 8자리 상품코드 값을 가지며, 앞 2자리는 카테고리 코드를 의미합니다.

 OFFLINE_SALE 테이블은 아래와 같은 구조로 되어있으며 OFFLINE_SALE_ID, PRODUCT_ID, SALES_AMOUNT, 
SALES_DATE는 각각 오프라인 상품 판매 ID, 상품 ID, 판매량, 판매일을 나타냅니다.

 동일한 날짜, 상품 ID 조합에 대해서는 하나의 판매 데이터만 존재합니다.
*/

-- 문제
/* 
 PRODUCT 테이블과 OFFLINE_SALE 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 출력하는 
SQL문을 작성해주세요. 결과는 매출액을 기준으로 내림차순 정렬해주시고 매출액이 같다면 상품코드를 
기준으로 오름차순 정렬해주세요.
*/

-- 정답 코드
SELECT P.PRODUCT_CODE, SUM(P.PRICE*S.SALES_AMOUNT) AS SALES
FROM PRODUCT P, OFFLINE_SALE S
WHERE P.PRODUCT_ID = S.PRODUCT_ID
GROUP BY P.PRODUCT_ID
ORDER BY SALES DESC, P.PRODUCT_CODE ASC
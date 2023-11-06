-- Level 4
-- 문제 설명
/*
 다음은 식품의 정보를 담은 FOOD_PRODUCT 테이블입니다. FOOD_PRODUCT 테이블은 다음과 같으며 
PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE는 식품 ID, 식품 이름, 식품코드, 
식품분류, 식품 가격을 의미합니다.
*/

-- 문제
/* 
 FOOD_PRODUCT 테이블에서 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 
SQL문을 작성해주세요. 이때 식품분류가 '과자', '국', '김치', '식용유'인 경우만 출력시켜 
주시고 결과는 식품 가격을 기준으로 내림차순 정렬해주세요.
*/

-- 정답 코드
SELECT F1.CATEGORY, F1.PRICE AS MAX_PRICE, F1.PRODUCT_NAME
FROM FOOD_PRODUCT F1 
LEFT JOIN FOOD_PRODUCT F2
ON F1.PRICE < F2.PRICE AND
    F1.CATEGORY = F2.CATEGORY
WHERE F2.PRODUCT_ID IS NULL AND
    F1.CATEGORY IN ('과자', '국', '김치', '식용유') 
ORDER BY MAX_PRICE DESC
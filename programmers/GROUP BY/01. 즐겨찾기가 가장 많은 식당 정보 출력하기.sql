-- Level 3
-- 문제 설명
/*
 다음은 식당의 정보를 담은 REST_INFO 테이블입니다. REST_INFO 테이블은 다음과 같으며 REST_ID, 
REST_NAME, FOOD_TYPE, VIEWS, FAVORITES, PARKING_LOT, ADDRESS, TEL은 식당 ID, 식당 이름, 
음식 종류, 조회수, 즐겨찾기수, 주차장 유무, 주소, 전화번호를 의미합니다.
*/

-- 문제
/* 
 REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 
즐겨찾기수를 조회하는 SQL문을 작성해주세요. 이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.
*/

-- 정답 코드
SELECT R1.FOOD_TYPE, R1.REST_ID, R1.REST_NAME, R1.FAVORITES
FROM REST_INFO R1
LEFT JOIN REST_INFO R2 
ON R1.FAVORITES < R2.FAVORITES AND
    R1.FOOD_TYPE = R2.FOOD_TYPE
WHERE R2.REST_ID IS NULL
ORDER BY FOOD_TYPE DESC
-- Level 4
-- 문제 설명
/*
 ANIMAL_OUTS 테이블은 동물 보호소에서 입양 보낸 동물의 정보를 담은 테이블입니다. ANIMAL_OUTS 
테이블 구조는 다음과 같으며, ANIMAL_ID, ANIMAL_TYPE, DATETIME, NAME, SEX_UPON_OUTCOME는 
각각 동물의 아이디, 생물 종, 입양일, 이름, 성별 및 중성화 여부를 나타냅니다.
*/

-- 문제
/* 
 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 0시부터 23시까지, 각 
시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 이때 결과는 시간대 순으로 
정렬해야 합니다.
*/

-- 정답 코드
WITH RECURSIVE CTE AS (
    SELECT 0 AS N
    UNION ALL
    SELECT N+1 FROM CTE WHERE N < 23
)

SELECT N AS HOUR, 0
FROM CTE
WHERE N NOT IN(
    SELECT HOUR(DATETIME) HOUR
    FROM ANIMAL_OUTS 
    GROUP BY HOUR
)
UNION ALL
SELECT HOUR(DATETIME) AS HOUR, COUNT(ANIMAL_ID) AS COUNT
FROM ANIMAL_OUTS
GROUP BY HOUR
ORDER BY HOUR
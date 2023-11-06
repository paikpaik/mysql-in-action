-- Level 4
-- 문제 설명
/*
 다음은 어느 한 서점에서 판매중인 도서들의 도서 정보(BOOK), 저자 정보(AUTHOR) 테이블입니다.

 BOOK 테이블은 다음과 같으며 BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE는 각각 
도서 ID, 카테고리 (경제, 인문, 소설, 생활, 기술), 저자 ID, 판매가 (원), 출판일을 의미합니다.

 AUTHOR 테이블은 도서의 저자의 정보를 담은 테이블로 다음과 같으며 AUTHOR_ID, AUTHOR_NAME은
각각 저자 ID, 저자명을 의미합니다.

 BOOK_SALES 테이블은 각 도서의 날짜 별 판매량 정보를 담은 테이블로 다음과 같으며 BOOK_ID, 
SALES_DATE, SALES는 각각 도서 ID, 판매일, 판매량을 의미합니다.
*/

-- 문제
/* 
 2022년 1월의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 
을 구하여, 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 
출력하는 SQL문을 작성해주세요. 결과는 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 
정렬해주세요.
*/

-- 정답 코드
SELECT A.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(B.PRICE * S.SALES) AS TOTAL_SALES
FROM BOOK B, AUTHOR A, BOOK_SALES S
WHERE A.AUTHOR_ID = B.AUTHOR_ID AND
    B.BOOK_ID = S.BOOK_ID AND
    DATE_FORMAT(SALES_DATE, "%Y-%m") = '2022-01'
GROUP BY A.AUTHOR_ID, B.CATEGORY
ORDER BY A.AUTHOR_ID, B.CATEGORY DESC
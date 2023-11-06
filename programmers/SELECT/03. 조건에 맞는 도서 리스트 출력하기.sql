-- Level 1
-- 문제 설명
/*
 다음은 어느 한 서점에서 판매중인 도서들의 도서 정보(BOOK) 테이블입니다. BOOK 테이블 구조는 
다음과 같으며 BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE는 각각 도서 ID, 카테고리
저자 ID, 판매가 (원), 출판일을 나타냅니다.
*/

-- 문제
/* 
 BOOK 테이블에서 2021년에 출판된 '인문' 카테고리에 속하는 도서 리스트를 찾아서 도서 ID(BOOK_ID), 
출판일 (PUBLISHED_DATE)을 출력하는 SQL문을 작성해주세요. 결과는 출판일을 기준으로 오름차순 
정렬해주세요.
*/

-- 정답 코드
SELECT BOOK_ID, DATE_FORMAT(PUBLISHED_DATE, "%Y-%m-%d") AS PUBLISHED_DATE
FROM BOOK
WHERE CATEGORY = '인문' AND 
    DATE_FORMAT(PUBLISHED_DATE, "%Y") = '2021'
ORDER BY PUBLISHED_DATE
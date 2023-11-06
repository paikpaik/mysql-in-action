-- Level 2
-- 문제 설명
/*
 다음은 어느 한 서점에서 판매중인 도서들의 도서 정보(BOOK), 저자 정보(AUTHOR) 테이블입니다.

 BOOK 테이블은 다음과 같으며 BOOK_ID, CATEGORY, AUTHOR_ID, PRICE, PUBLISHED_DATE는 각각 
도서 ID, 카테고리 (경제, 인문, 소설, 생활, 기술), 저자 ID, 판매가 (원), 출판일을 의미합니다.

 AUTHOR 테이블은 도서의 저자의 정보를 담은 테이블로 다음과 같으며 AUTHOR_ID, AUTHOR_NAME은
각각 저자 ID, 저자명을 의미합니다.
*/

-- 문제
/* 
 '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 
리스트를 출력하는 SQL문을 작성해주세요. 결과는 출판일을 기준으로 오름차순 정렬해주세요.
*/

-- 정답 코드
SELECT B.BOOK_ID, A.AUTHOR_NAME, DATE_FORMAT(B.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE
FROM BOOK B, AUTHOR A
WHERE B.AUTHOR_ID = A.AUTHOR_ID AND 
    B.CATEGORY = '경제'
ORDER BY B.PUBLISHED_DATE
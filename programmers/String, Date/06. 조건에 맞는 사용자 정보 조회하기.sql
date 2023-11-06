-- Level 3
-- 문제 설명
/*
 다음은 중고 거래 게시판 정보를 담은 USED_GOODS_BOARD 테이블과 중고 거래 게시판 첨부파일 정보를 담은 
USED_GOODS_USER 테이블입니다. 

 USED_GOODS_BOARD 테이블은 다음과 같으며 BOARD_ID, WRITER_ID, TITLE, CONTENTS, PRICE, CREATED_DATE, 
STATUS, VIEWS는 게시글 ID, 작성자 ID, 게시글 제목, 게시글 내용, 가격, 작성일, 거래상태, 조회수를 의미합니다.

 USED_GOODS_USER 테이블은 다음과 같으며 USER_ID, NICKNAME, CITY, STREET_ADDRESS1, STREET_ADDRESS2, 
TLNO는 각각 회원 ID, 닉네임, 시, 도로명 주소, 상세 주소, 전화번호를 의미합니다.
*/

-- 문제
/* 
 USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서 중고 거래 게시물을 3건 이상 등록한 사용자의 사용자 ID, 
닉네임, 전체주소, 전화번호를 조회하는 SQL문을 작성해주세요. 이때, 전체 주소는 시, 도로명 주소, 상세 주소가
함께 출력되도록 해주시고, 전화번호의 경우 xxx-xxxx-xxxx 같은 형태로 하이픈 문자열(-)을 삽입하여 출력해주세요. 
결과는 회원 ID를 기준으로 내림차순 정렬해주세요.
*/

-- 정답 코드
SELECT U.USER_ID, 
    U.NICKNAME, 
    CONCAT(U.CITY, " ", U.STREET_ADDRESS1, " ", U.STREET_ADDRESS2) AS 전체주소, 
    INSERT(INSERT(U.TLNO, 4, 0, '-'), 9, 0, '-') AS 전화번호 
FROM USED_GOODS_USER U, USED_GOODS_BOARD B
WHERE U.USER_ID = B.WRITER_ID
GROUP BY U.NICKNAME
HAVING COUNT(*) > 2
ORDER BY U.USER_ID DESC
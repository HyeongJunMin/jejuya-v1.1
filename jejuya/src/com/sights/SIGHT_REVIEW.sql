-- TYPE : Oracle_11
-- NAME : New Oracle
-- DATABASE : xe
CREATE TABLE SIGHT_REVIEW (
    SEQ NUMBER NOT NULL PRIMARY KEY,
    TITLE VARCHAR2(400) NOT NULL,
    ID VARCHAR2(400) NOT NULL,
    CONTENT VARCHAR2(4000),
    FILENAME VARCHAR2(4000),
    WDATE DATE NOT NULL,
    SCORE NUMBER(4),
    DEL NUMBER(2)
);
--DROP TABLE SIGHT_REVIEW CASCADE CONSTRAINTS;
--DROP SEQUENCE SEQ_SIGHT_REVIEW;

--CREATE SEQUENCE SEQ_SIGHT_REVIEW START WITH 1 MAXVALUE 9999999999 INCREMENT BY 1;
--DROP SEQUENCE SEQ_SIGHT_REVIEW;

SELECT * FROM SIGHT_REVIEW;

SELECT TITLE, AVG(SCORE) FROM SIGHT_REVIEW GROUP BY TITLE

--별점이 있는 모든 관광지의 정보를 얻을 수 있는 쿼리. 타이틀만 일치하면 다 보여줌
SELECT A.TITLE, A.SEQ, A.CATEGORY, B.SCORE FROM SIGHTS A, (SELECT TITLE, AVG(SCORE) AS SCORE FROM SIGHT_REVIEW GROUP BY TITLE) B WHERE A.TITLE = B.TITLE AND A.CATEGORY=0; 

SELECT TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT FROM SIGHTS

SELECT A.RNUM, A.TITLE, A.SEQ, A.CATEGORY, A.THEME, A.FILENAME, A.ADDRESS, A.PHONE, A.HOMEPAGE, A.CONTENT, A.ADDSCHEDULE, A.DEL, A.READCOUNT, B.SCORE
FROM ( SELECT ROWNUM AS RNUM, TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT 
	FROM ( SELECT TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT 
		 FROM SIGHTS WHERE ( CATEGORY = 0 ) 
		)
	 ) A , (SELECT TITLE, AVG(SCORE) AS SCORE FROM SIGHT_REVIEW GROUP BY TITLE) B
 WHERE A.TITLE = B.TITLE AND ( (RNUM >= 1 ) AND (RNUM <= 10 ) )
 
SELECT A.RNUM, A.TITLE, A.SEQ, A.CATEGORY, A.THEME, A.FILENAME, A.ADDRESS, A.PHONE, A.HOMEPAGE, A.CONTENT, A.ADDSCHEDULE, A.DEL, A.READCOUNT, NVL(B.SCORE,0)
FROM ( SELECT ROWNUM AS RNUM, TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT 
	FROM ( SELECT TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT 
		 FROM SIGHTS WHERE ( CATEGORY = 0 ) 
		)
	 ) A , (SELECT TITLE, AVG(SCORE) AS SCORE FROM SIGHT_REVIEW GROUP BY TITLE) B
 WHERE A.TITLE = B.TITLE(+) AND ( (RNUM >= 1 ) AND (RNUM <= 10 ) )
 
 SELECT A.RNUM, A.TITLE, A.SEQ, A.CATEGORY, A.THEME, A.FILENAME, A.ADDRESS, A.PHONE, A.HOMEPAGE, A.CONTENT, A.ADDSCHEDULE, A.DEL, A.READCOUNT, NVL(B.SCORE,0)
FROM ( SELECT ROWNUM AS RNUM, TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT 
	FROM ( SELECT TITLE, SEQ, CATEGORY, THEME, FILENAME, ADDRESS, PHONE, HOMEPAGE, CONTENT, ADDSCHEDULE, DEL, READCOUNT 
		 FROM SIGHTS 
		)
	 ) A , (SELECT TITLE, AVG(SCORE) AS SCORE FROM SIGHT_REVIEW GROUP BY TITLE) B
 WHERE A.TITLE = B.TITLE(+) 
 
 

--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '사려니숲길', 'admin', '안좋았다', '파일없다', SYSDATE, 0, 0)
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 4, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 4, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 4, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 4, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 3, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 3, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 5, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 5, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 5, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 5, 0);
--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '성산일출봉', 'admin', '안좋았다', '파일없다', SYSDATE, 5, 0);



--INSERT INTO SIGHT_REVIEW VALUES( SEQ_SIGHT_REVIEW.NEXTVAL, '테스트 제목', 'admin', '테스트 내용', '파일테스트', SYSDATE, 0, 0); 
CREATE DATABASE crud;
USE crud;

CREATE TABLE user (
	id VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(50) NOT NULL,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

CREATE TABLE board (
	board_number INT NOT NULL UNIQUE AUTO_INCREMENT,
	title TEXT NOT NULL,
    contents TEXT NOT NULL,
    write_date DATE NOT NULL,
    writer_id VARCHAR(20) NOT NULL,
    
    CONSTRAINT board_pk PRIMARY KEY (board_number),
    CONSTRAINT board_writer_fk FOREIGN KEY (writer_id) REFERENCES user(id)
);

INSERT INTO board (title, contents, write_date, writer_id) VALUES (?, ?, CURDATE(), ?);

SELECT
	B.board_number,
    B.title,
    U.Nickname,
    B.write_date
FROM board B INNER JOIN user U
ON B.writer_id = U.id
ORDER BY B.board_number DESC;

SELECT
	B.title,
    U.nickname,
    B.write_date,
    B.contents
FROM board B INNER JOIN user U
ON B.writer_id = U.id
WHERE B.board_number = ?;


CREATE VIEW board_view AS
SELECT
	B.board_number board_number,
    B.title tltie,
    U.nickname nickname,
    B.write_date write_date,
    B.contents contents
FROM board B INNER JOIN user U
ON B.writer_id = U.id;


SELECT * FROM board_view
ORDER BY board_number DESC;

SELECT * FROM board_view
WHERE board_number = ?;

UPDATE board SET title = ?, contents = ? WHERE
board_numbar = ?;

DELETE FROM board WHERE board_number = ?;


-- 게시물 댓글
CREATE TABLE comment (
	comment_number INT NOT NULL UNIQUE AUTO_INCREMENT,
	contents TEXT NOT NULL, 				-- 내용
    board_number INT NOT NULL,				-- 게시글
	writer_id VARCHAR(20) NOT NULL, 		-- 작성자
    write_datetime DATETIME NOT NULL, 		-- 작성일시
    status BOOLEAN NOT NULL,				-- 상태 
    parent_comment INT,			 			-- 부모의 댓글
    
    CONSTRAINT comment_pk PRIMARY KEY (comment_number),
    CONSTRAINT comment_board_fk FOREIGN KEY (board_number) REFERENCES board (board_number),
    CONSTRAINT comment_user_fk FOREIGN KEY (writer_id) REFERENCES user(id),
    CONSTRAINT parent_comment_fk FOREIGN KEY (parent_comment) REFERENCES comment (comment_number)
);

-- 관계에 대한 테이블
CREATE TABLE favorite (
	id VARCHAR(20) NOT NULL,
    board_number INT NOT NULL,
    
    CONSTRAINT favorite_pk PRIMARY KEY (id, board_number),
    CONSTRAINT favorite_user_fk FOREIGN KEY (id) REFERENCES user (id),
    CONSTRAINT favorite_board_fk FOREIGN KEY (board_number) REFERENCES board (board_number)
);

INSERT INTO comment (contents, board_number, writer_id, write_datetime, status, parent_comment)
VALUES ("QWER", 2, "qwer1234", now(), true, null);

INSERT INTO comment (contents, board_number, writer_id, write_datetime, status, parent_comment)
VALUES ("자식댓글1", 2, "qwer1234", now(), true, 1);

INSERT INTO comment (contents, board_number, writer_id, write_datetime, status, parent_comment)
VALUES ("자식댓글2", 2, "qwer1234", now(), true, 1);

INSERT INTO comment (contents, board_number, writer_id, write_datetime, status, parent_comment)
VALUES ("자식댓글2-1", 2, "qwer1234", now(), true, 3);

SELECT * FROM comment;

-- 댓글 숨기기
UPDATE comment SET status = false WHERE comment_number = 2;

-- 댓글 삭제
DELETE FROM comment WHERE comment_number = 2;

SELECT * FROM favorite WHERE id = 'qwer1234' AND board_number = 3;

-- 좋아요 누르기
INSERT INTO favorite VALUES ("qwer1234",2);
-- 좋아요 취소
DELETE FROM favorite WHERE id = "qwer1234" AND board_number = 2;

SELECT board_number, COUNT(*) FROM comment WHERE board_number = 2 GROUP BY board_number;

SELECT board_number, COUNT(*) FROM favorite WHERE board_number = 2 GROUP BY board_number;

SELECT 
	C.board_number 'board_number',
    IFNULL(F.count, 0) 'comment_count',
    IFNULL(F.count, 0) 'favorite_count'
FROM (SELECT board_number, COUNT(*) count FROM comment WHERE board_number = 2 GROUP BY board_number) C
LEFT JOIN  -- 둘중 하나가 없을수도 있어서 INNER JOIN 사용 불가능
(SELECT board_number, COUNT(*) count FROM favorite WHERE board_number = 2 GROUP BY board_number) F
ON C.board_number = F.board_number;

SELECT * FROM board;








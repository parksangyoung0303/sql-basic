# 주석사용시
-- 주석사용시

-- 데이터 정의어 (DDL)
-- 데이터베이스를 정의하고 관리하는데 사용되는 언어, 사용자를 정의하고 관리하는데 사용되는 언어

-- 구조 = schema
-- CREATE : 구조를 생성하는 명령어
-- CREATE 생성할구조 구조이름 (구조별 옵션);

-- 데이터베이스 생성 (실행키 cmd + enter)
CREATE DATABASE practice_sql;
-- 데이터베이스 사용 : 데이터베이스 작업을 수행하기 전에 반드시 사용할 데이터베이스를 선택해야함
USE practice_sql;

-- 테이블 생성
CREATE TABLE example_table (
	example_column1 INT,
    example_column2 BOOLEAN
);

-- 모든 생성이름은 lower snakecase로 사용하는게 좋음
-- 논리형은 사용할수 없고 문자, 숫자만 사용할수 있다 ture = 1 false = 0 으로 구분

-- 컬럼의 데이터 타입
CREATE TABLE data_type (
	-- INT : 정수 타입
    int_c INT,
    -- DOUBLE : 실수 타입
    double_c DOUBLE,
    -- FLOAT : 실수 타입
    float_c FLOAT,
    -- BOOLEAN : 논리 타입 (실제로는 정수 0 과 1을 다루는 tiny_int)
    boolean_c BOOLEAN,
    -- VARCHAR(문자열의 길이) : 가변길이 문자열 - 모든 제약조건에도 실행시킬수 있음 자주 사용하는 데이터 타입
    varchar_c VARCHAR(5),
    -- TEXT : 고정된 크기를 가지는 문자열 (64KB) 장문 사용시 - index, default 같은 제약조건에는 사용할수 없음
    text_c TEXT,
    -- DATE : 날짜
    date_c DATE,
    -- DATETIME : 날짜 및 시간
    datetime_c DATETIME
    );

-- 사용자 생성
-- CREATE USER '사용자명'@'접속IP' IDENTIFIED BY '비밀번호';
CREATE USER 'developer'@'%' IDENTIFIED BY '1234';
CREATE USER 'guest2'@'192.168.1.101' IDENTIFIED BY '1234';

-- DROP : 데이터 구조(스키마)를 삭제할 때 사용되는 명령어
-- DROP 구조이름 (스키마명)
-- 사용자 삭제
DROP USER 'guest'@'192.168.1.101';
-- 테이블 삭제
DROP TABLE data_type;
-- 데이터베이스 삭제
DROP DATABASE practice_sql;

-- ALTER : 데이터 구조(스키마)를 변경(수정)하는 명령어
-- 테이블 컬럼추가
ALTER TABLE example_table ADD example_column3 VARCHAR(10);
-- 테이블 컬럼삭제
ALTER TABLE example_table DROP COLUMN example_column3;
-- 테이블 컬럼 타입 수정
ALTER TABLE example_table MODIFY COLUMN example_column2 TEXT;
-- 테이블 컬럼 전체 수정	
ALTER TABLE example_table CHANGE example_column1 column1 VARCHAR(5);
-- 데이터베이스 문자셋 수정
ALTER DATABASE practice_sql DEFAULT CHARACTER SET utf8;



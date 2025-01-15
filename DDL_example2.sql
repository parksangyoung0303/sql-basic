-- 축구 경기 (football) 데이터베이스

-- 참가팀(team) [국가명(nation), 조(seed), 감독(manager), 피파랭킹(ranking)]
-- 선수(player) [이름(name), 생년월일(birth), 포지션(position), 등번호(uniform_number), 국가(country)]
-- 경기장(stadium) [이름(name), 주소(address), 좌석수(seats)]
-- 심판(referee) [이름(name), 생년월일(birth), 국가(country), 포지션(position)]

-- 사용자1 : football_developer @ % / password foot!@
-- 사용자2 : football_broadcast @ % / password foot#$

-- 예시
-- 참가팀 [대한민국, A, 홍길동, 30]
-- 선수 [이성계, 1998-01-15, 공격수, 10, 대한민국]
-- 경기장 [한양메인스타디움, 대한민국 서울특별시 강남구, 2000]
-- 심판 [이방원, 1994-06-05, 대한민국, 주심]

-- 1. 데이터베이스 생성
CREATE DATABASE football;
-- 2. 축구 데이터베이스 선택
USE football;
-- 3. 참가팀 테이블 생성
CREATE TABLE team (
	nation VARCHAR(100),
    seed VARCHAR(1),
    manager VARCHAR(50),
    ranking INT
);
-- 4. 선수 테이블 생성
CREATE TABLE player (
	name VARCHAR(50),
    birth VARCHAR(50),
    position VARCHAR(6),
    uniform_number INT,
    country VARCHAR(100)
);
-- 5. 경기장 테이블 생성
CREATE TABLE stadium (
	name VARCHAR(255),
    address TEXT,
    seats INT
);
-- 6. 심판 테이블 생성
CREATE TABLE referee (
	name VARCHAR(50),
    birth VARCHAR(50),
    country VARCHAR(100),
    position VARCHAR(6)
);
-- 7. 계정 생성
CREATE USER 'football_developer'@'%' IDENTIFIED BY 'foot!@';
CREATE USER 'football_broadcast'@'%'  IDENTIFIED BY 'foot#$';

-- 8. 심판과 선수의 birth 컬럼의 데이터 타입을 DATE로 변경 
ALTER TABLE player MODIFY COLUMN birth DATE;
ALTER TABLE referee MODIFY COLUMN birth DATE;
-- ALTER TABLE referee CHANGE birth birth DATE; CHANGE 전반적인 모든걸 바꿀때 사용할수도 있음






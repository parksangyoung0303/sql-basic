USE practice_sql;

CREATE TABLE sale (
	sequence_number INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
	amount INT,
    employee_number INT
);

INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-20', 100000, 1);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-20', 120000, 2);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-20', 60000, 1);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-21', 200000, 3);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-21', 150000,2);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-23', 100000, 3);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-24', 160000, 1);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-25', 80000, 3);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-25', 90000, 1);
INSERT INTO sale (date, amount, employee_number) VALUES ('2025-01-26', 120000, 2);

SELECT * FROM sale;

-- 집계 함수 : 여러 행의 레코드를 종합하여 하나의 결과값을 반환

-- count() : 특정 조건에 해당하는 레코드의 개수를 반환
SELECT COUNT(*) FROM sale;
SELECT COUNT(*) FROM sale WHERE amount >= 100000;
SELECT COUNT(amount) FROM sale WHERE amount >= 100000;

-- SUM() : 특정 조건에 해당하는 컬럼의 값을 모두 더한 결과를 반환
SELECT SUM(amount) FROM sale;
SELECT SUM(amount) FROM sale WHERE employee_number = 1;

-- AVG() : 특정 조건에 해당하는 컬럼의 값의 평균을 반환
SELECT AVG(amount) FROM sale;
SELECT AVG(amount) FROM sale WHERE employee_number = 1;

-- MIN(), MAX() : 특정 조건에 해당하는 컬럼 값의 최대 최소 값을 반환
SELECT MIN(amount), MAX(amount) FROM sale;
SELECT MIN(amount), MAX(amount) FROM sale WHERE employee_number = 1;

-- 그룹화 (GROUP BY) : 조회 결과에 대해서 레코드를 하나 이상의 컬럼으로 그룹화하여 결과를 도출하는 것, 일반적으로 집계함수와 같이 사용됨
SELECT MIN(amount), MAX(amount), employee_number
FROM sale
GROUP BY employee_number;

-- 집계함수, 그룹화가 되어 있는 쿼리에서는 그룹화한 컬럼과 집계함수를 제외한 컬럼은 SELECT 절에서 선택 불가
SELECT MIN(amount), MAX(amount), date
FROM sale
GROUP BY employee_number;

SELECT MIN(amount), MAX(amount), employee_number, date
FROM sale
GROUP BY employee_number, date;

-- 필터링 (HAVING) : 그룹회된 결과에 필터 작업을 수행 결과 및 사용법이 WHERE 절과 비슷하게 보이지만, 
-- 순서가 WHERE 절은 조회할 떄 사용되고 HAVING 절은 조회 후에 사용됨
SELECT 
	MIN(amount) '최소',
    MAX(amount) '최대',
    employee_number '사번'
FROM sale 
-- WHERE date = '2025-01-20'
GROUP BY employee_number
HAVING date = '2025-01-20';


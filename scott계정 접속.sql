DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE LOCATIONS;
DROP TABLE SALGRADE;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) 
);
CREATE TABLE EMP(
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

CREATE TABLE SALGRADE( 
    GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER 
);
CREATE TABLE LOCATIONS (
     LOC_CODE  CHAR(2) ,
     CITY      VARCHAR2(12)
) ;

-- DEPT테이블에 데이터 삽입
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP테이블에 데이터 삽입
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('09-12-1982','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('12-1-1983','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

-- SALGRADE테이블에 데이터 삽입
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
                        
select * from emp;  /*emp 테이블에 있는 모든 컬럼을 화면에 출력하시오
                     계정 만들기, 테이블 권한 */
                     
select empno, ename, job, mgr, hiredate, sal, comm deptno from emp;

select empno, ename, job,  sal, comm  from emp;

select empno, ename,  sal, sal+500 from emp;

select empno, ename,  sal, 2*sal+500 from emp;  --우선순위가 있다
            
select empno, ename,  sal, 2*(sal+500) from emp;

select empno, ename, comn, comn+500 from emp;

select ename As name, sal 월급, sal*12 "Annual Salary" from emp;

select ename 결과1, 'ABC' 결과2, sal 결과3, 500 결과4 from emp;

select ename || ':' || empno || ':' || job "이름 사번 업무" from emp;

select enam || 'is a ' || jab as "employees Details" from emp;

select ename || ' : 1 Year salary =' || sal*12 AS  Monthly from emp;

select All job from emp;

select deptno, job from emp;

select distinct deptno, job from emp; --부서번호이면서 업무가 동일한 중복을 제거

select rowid, rownum, ename, sal from emp; 
--rowid는 오라클에서 제공한느 것으로 모든 행을 구별해주는 열
--rownum은 일렬번호를 부여해준느 컬럼으로 1씩 증가한다


select ename, LPAD(ename,15,'*'),sal, LPAD(sal,10,'*')from emp where deptno =10;

select ename, RPAD(ename,15,'*'),sal, RPAED(sal,10,'*')from emp where deptno =10;

select ename, jab,LTRIM(job,'A'),sal,LTRIM(sal,1)
from emp
where deptno =20;


select ename, jab,RTRIM(job,'T'),sal,LTRIM(sal,0)
from emp
where deptno =10;

select 
    TRIM(leading 'A' from 'AABDCADD')결과1,
     --문자열 'AABDCADD'의 맨앞에 있는 'A' 삭제
    TRIM('A' from 'AABDCADD')결과2,
        --문자열 'AABDCADD'의 맨앞에 있는 'A'와 맨뒤에있는 'A'를 모두 삭제
    TRIM(trailing 'A' from 'AABDCADD')결과3
     --문자열 'AABDCADD'의  맨뒤에있는 'D'를 삭제
from dual;    

----replace 함수
--select ename, replace (ename, 'sc', '*?') 변경결과
----ename,에 있는 
--from emp
--where deptno =20;

select ename, translate(ename, 'sc', '*?') 변경결과
--ename,에 있는 데이터에서 문자열 'S'또는 'C'가 있는 문자를
    -- 'S'는 '*'로  'C'는 '?'로 변경
from emp
where deptno =20;


-- 사원이름을 소문자로 바꾸는 것을 translate()함수를 이용해서 작성하시오
select ename,
    translate(ename,'ABCDEFGHIJKLMNOP','abcdefghijklmnop')
        u_lowe
    from emp;

--lower함수 이용해서 작성
select ename, lower(ename) u_lower
from emp;


select 
    round(4567.678)결과1,
    round(4567.678,0)결과2,
    round(4567.678,2)결과3,
    round(4567.678,-2)결과4
from dual;

select 
    round(4567.678)결과1,
    round(4567.678,0)결과2,
    round(4567.678,2)결과3,
    round(4567.678,-2)결과4
from dual;








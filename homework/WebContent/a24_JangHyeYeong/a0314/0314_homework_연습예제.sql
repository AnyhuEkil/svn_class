/*
연습예제
1. emp중에 급여가 2000미만이 되는 사원 정보 중에 사번과 급여를 출력하라
2. 연봉과 보너스의 한산 급액이 1500미만인 사람의 이름, 연봉, 보너스, 합산액을 출력하세요.
3. mgr이 null인 사람의 job과 이름 연봉을 출력하세요.
4. job이 clerk인 사람 중 deptno가 30인 사람의 이름, 직책, 부서번호를 출력하세요.
5. 연봉이 2000에서 3000 사이에 있는 사람의 부서번호, 이름, 연봉을 출력하세요.
###혼자 해결하고, 해결하지 못하는 옆사람이나, 주위사람에도 도움을 받아 해결하고
다시 새로운 문제를 받아서 혼자 힘으로 해결한 후에 종료
*/


select empno "사번", sal "급여" from emp where sal<2000;
select ename "이름", sal "연봉", comm "보너스", sal+nvl(comm,0) "합산액" 
from emp 
where sal+nvl(comm,0)<1500;
select job, ename "이름", sal "연봉" from emp where mgr is null;
select ename "이름", job "직책", deptno "부서번호" from emp where job='CLERK';
select deptno "부서번호", ename "이름", sal "연봉" from emp where 2000>=sal and sal<=3000;
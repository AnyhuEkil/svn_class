/*
숙제1)
6개월의 인턴기간에는 급여의 70%만 지급하기로 했다.
사원의 인턴기간만료시점을 출력하고, 6개월간의 급여의 총합을 계산하세요..
월급여 - sal/13
인턴기간 - 월급여의 70%
인턴기간월급여총액 - 인턴기간6개월간 급여 총액을 10단위 절삭해서 출력
사원번호	사원명	입사일	인턴기간만료시점	인턴기간월급여(10단위절삭)
*/
select empno, ename, hiredate, add_months(hiredate, 6), trunc(((sal/13) * 0.7) * 6, -1) from emp;

-- (숙제) 급여 계산.. 3단계 급여일을 나누어서 출력하세요.
-- 1단계 당월 20일
-- 2단계 당월 마지막날
-- 3단계 다음달 10일
-- 사원 입사일 첫월급1 첫월급2 첫월급3
select ename, hiredate,
		last_day(add_months(hiredate, -1))+20,
		last_day(hiredate) grade02,
		last_day(hiredate)+10
		from emp;
		
/*
숙제
	근무개월수에 따른 차등 보너스 지급
	가장 오래된 개월~가장 최근에 입사한 개월수
	1/3 = 30%, 1/3 = 20%, 1/3 = 10% (연봉기준)
	사원, 입사일, 현재날짜(@@/@@/@@ AM @@시 @@분 @@초), 근무개월수,
*/
select ename, hiredate, to_char(sysdate, 'YY/MM/DD AM HH24:MI:SS') , trunc((sysdate - hiredate)/30), 
	case when (trunc((sysdate - hiredate)/30) - 416) / 8 <= 1 then sal*0.1  
		when (trunc((sysdate - hiredate)/30) - 416) / 8 <= 2 then sal*0.2
		when (trunc((sysdate - hiredate)/30) - 416) / 8 > 2 then sal*0.3
		else 0
	end result
from emp;

/*
숙제
조회값이 '1981년 01월 01일'부터 '1982년 12월 12일' 사이의 데이터 중,
	부서가 30인 데이터를 조회하여,
list형식
	사원명(10자리-앞에 #기호처리)
	직책(10자리-나머지뒤에 '-'처리)
	입사일(@@년 @@월 @@일 @요일 24시 @@분 @@초)
	연봉( ####1,600.0 표시)로 나타내세요.. 
*/
select lpad(ename, 10 , '#'), rpad(ename, 10, '-'), to_char(hiredate, 'YYYY"년 "MM"월 "DD"일 "DAY" "HH24"시 "MI"분 "SS"초"'), lpad(to_char(sal, '9,999.9'), 11, '#') from emp;

-- 숙제 이름 관리자번호 보너스 ==> 데이터가 없을 때는 관리자번호경우 '최고레벨', 보너스는 '0'표시
select ename, nvl(to_char(mgr), '최고레벨'), nvl(comm, 0) from emp; 
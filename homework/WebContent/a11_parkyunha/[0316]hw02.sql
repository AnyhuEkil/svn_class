/*
����1
6������ ���ϱⰣ���� �޿��� 70%�� �����ϱ�� ����.
����� ���ϱⰣ ��������� ����ϰ�, 6�������� �޿���
������ ����ϼ���.
���޿� - sal/13
���ϱⰣ - ���޿��� 70%
���ϱⰣ���޿��Ѿ� - ���ϱⰣ 6������ �޿� �Ѿ��� 10���� �����ؼ� ���
�����ȣ	�����	�Ի���	���ϱⰣ�������		���ϱⰣ���޿�
*/
select
	empno		�����ȣ,
	ename		����̸�,
	hiredate	�Ի���,
	sal			���翬��,
	add_months(hiredate, 6)	"���ϱⰣ �������",
	trunc((sal/13)*0.7,-1)	"���ϱⰣ ���޿�"
from emp;

-- ����2
-- �޿���� 3�ܰ� �޿����� ����� ����ϼ���.
-- 1�ܰ� ��� 20��	//
-- 2�ܰ� ��� ��������
-- 3�ܰ� ������ 10��
-- ���		�Ի���		ù����1		ù����2		ù����3
select
	ename,
	last_day(hiredate),
	last_day(hiredate)	pay2,
	last_day(hiredate)+10	pay3
from emp;

/*
����3
�ٹ��������� ���� ���� ���ʽ� ����
���� ������ ����~���� �ֱٿ� �Ի��� ������
1/3 = 30%, 1/3 = 20%, 1/3 = 10% (��������)
���	�Ի���	���糯¥(YY/MM/DD AM @@�� @@�� @@��)	�ٹ�������	���ʽ�
*/
select * from emp;
select
	ename,
	hiredate,
	to_char(sysdate, 'YY/MM/DD'),
	floor(months_between(hiredate, sysdate)),
	
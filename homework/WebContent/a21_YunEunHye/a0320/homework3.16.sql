/*
����1)
6������ ���ϱⰣ���� �޿��� 70%�� �����ϱ�� �ߴ�.
����� ���ϱⰣ��������� ����ϰ�, 6�������� �޿��� ������ ����ϼ���.
���޿� - sal/13
���ϱⰣ - ���޿��� 70%
���ϱⰣ���޿� �Ѿ� - ���ϱⰣ 6������ �޿� �Ѿ��� 10���� �����ؼ� ���
�����ȣ	�����	�Ի���	���ϱⰣ�������		���ϱⰣ���޿�(10��������)
*/
select * from emp;
select empno, ename, hiredate, add_months(hiredate,6) "expire",trunc(((sal/13)*0.7)*6,-1)"pay" from emp; 
 /*
 ����2(���ʽ� �� �ذ�)
 		�ٹ��������� ���� ���� ���ʽ� ����
		���� ������ ����~�����ֱٿ� �Ի��� ������
		1/3 = 30%, 1/3 = 20%, 1/3=10%(��������)
 		���, �Ի���, ���糯¥(@@/@@/@@ AM @@�� @@�� @@��), �ٹ�������, ���ʽ�
  */ 
 select ename, hiredate, to_char(sysdate,'YY/MM/DD AM HH:MI:SS'),
 trunc(months_between(sysdate,hiredate)) from emp;

 select trunc(months_between(sysdate,hiredate)) from emp;
  /*
����3 
��ȸ���� '1981��01��01��' ���� '1982�� 12�� 12�ϱ���' ������ ������ ��,
	  �μ��� 30�� �����͸� ��ȸ�Ͽ�, 
LIST����
	  �����(10�ڸ�-�տ� #��ȣ ó��)
	  ��å(10�ڸ�-�������ڿ� '-'ó��)
	  �Ի���(@@�� @@�� @@�� @���� 24�� @@�� @@��)
	  ����(####1,600.0 ǥ��)�� ��Ÿ���ÿ�.
*/
select lpad(ename,10,'#'), rpad(job,10,'-'), to_char(hiredate,' YY"��"MM"��"DD"��" DAY HH24 "��" MM"��"SS"��"'),
 lpad(sal,10,'#') from emp
 where (hiredate between '1981/01/01' and '1982/12/12') and deptno=30;

-- ���� 	�̸� 		�����ڹ�ȣ		 ���ʽ� ==>�����Ͱ� �������� �����ڹ�ȣ��� '�ְ�����','���ʽ�'�� '0'ǥ��
select ename,nvl(to_char(mgr,'9999'),'�ְ�������'),  nvl(comm,0) from emp;


/*
���� 
������ ���� ���ü�踦 �������� �Ѵ�. 
decode�� Ȱ���ؼ�, 
		1000 �̸� F���               ������ 3%
		1000 ~ 2000 �̸� E���     ������ 5%
		2000 ~ 3000 �̸� D���          ������ 7%
		3000 ~ 4000 �̸� C���          ������ 4%
		4000 ~ 5000 �̸� B���         ������ 3%
		5000�̻� A���               ������ 2%
�̸�		�μ�		�������		������		�Ѿ�(����+������)
*/


select ename, deptno,
		 decode(round((sal+500),-3), '1000', 'F���'
		 										,'2000', 'E���'
		 										,'3000', 'D���'
		 										,'4000', 'C���'
		 								,'5000','B���'
										,'6000','A���'
										,'��޿�'
						 ) "���" ,
		decode('���','F���',sal*0.02,
							 'E���', sal*0.05,
							 'D���' ,sal*0.07,
							 'C���' ,sal*0.04,
							 'B���' ,sal*0.03,
						sal*0.02
	) "������",
	decode('���','F���',sal*1.02,
							 'E���', sal*1.05,
							 'D���' ,sal*1.07,
							 'C���' ,sal*1.04,
							 'B���' ,sal*1.03,
						sal*1.02
	) "�ѿ���",floor(sal)
 FROM EMP;





/*				                       
����)�Ի� �б� ���� ǥ��(1/4,2/4,3/4,4/4) �Ի� �б⸦ ǥ��
�����ȣ, �̸�, �Ի�(��/��), �Ի�б�

*/
select empno, ename, to_char(hiredate,'YY/MM'),
		case when to_char(hiredate,'MM')<=3 then '1�б�'
		     when to_char(hiredate,'MM')<=6 then '2�б�'
		     when to_char(hiredate,'MM')<=9then '3�б�'
		     when to_char(hiredate,'MM')>=10 then '4�б�'
				end  result
from emp;








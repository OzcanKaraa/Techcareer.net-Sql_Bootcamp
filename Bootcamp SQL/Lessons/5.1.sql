/* 14.06.2023  Konu Anlatim I.Part */

--CASE WHEN : IF/ELSE Kosul 

	syntax :   	case 
				when
				else 
				end 


--  Case When Example : Maas araliklarina gore sonuclari goruntuleme:
---------------------------------------------------

	select employee_id ,first_name ,last_name,salary ,

	case        -->  Case : Sartlari Olusturma 

		when salary > 5000 and salary < 7000  then 'Dusuk Gelir'
		when salary > 7001 and salary <= 9000 then 'Ortalama Gelir'
		when salary > 9000 then 'Yuksek Gelir'
		else 'Gelir Araligi Bilinmiyor'

	end as gelir_araligi                                                    

	from employees e 

------------------------------------------------------------------------------------------------------
	CTE : COMMON TABLE EXPRESSION 
	-----------------------------------------

	1-Gecici sonuc uretip bir sonraki query de kullanma firsati veriyor.
	2-Tablo olarak kullanilabiliyor.
	3-With ile Baslar 
	4-Birden fazla CTE kullanilabilir.
	5-Memory de kullanilan gecici veriler kumesidir.
	6-Hiyerasik yapi sonucuna erisebilmek icin
	7-Kullanildigi kadar is gorur.
	
------------------------------------------------------------------------------------------------------
--CTE Example 1: benim_tablom isminde tablo olusturuldu
	 with benim_tablom as
	(
	select first_name,last_name,e.department_id , department_name
	from employees e 
	left join departments d on d.department_id = e.department_id
	)
	select * from benim_tablom
------------------------------------------------------------------------------------------------------
--CTE Example 2: employee tablosunda  ortalama maastan yuksek olanlari listeleme

	with ortalama as 
	(
		select * from employees e 
		where salary > (select avg(salary) from employees e )
	)
		select * from ortalama

------------------------------------------------------------------------------------------------------
--CTE Example 3 : employee tablosunda job_tittle gore ortalama maastan yuksek olanlari gosteren

	with ortalama_maas as 
	(
		select j.job_title , salary from employees e 
		left join jobs j on j.job_id = e.job_id
		where salary > (select avg(salary) from employees e)
	
	)
		select * from  ortalama_maas
------------------------------------------------------------------------------------------------------
--CTE Example 4 : employee tablosunda job_tittle gore ortalama maas 

	with ortalama_maaslar as 
	(
	   select  job_title , avg(salary) as avg_salary from employees e 
		left join jobs j  on j.job_id = e.job_id
		group by job_title
	)
		select job_title , avg_salary from ortalama_maaslar

------------------------------------------------------------------------------------------------------
-- IC ICE CTE KULLANIM

		with ortalama_maas as 
		(
			select j.job_title , salary from employees e 
			left join jobs j on j.job_id = e.job_id
			where salary > (select avg(salary) from employees e)
	
		),
		  ortalama_maaslar as 
		(
		   select  job_title , avg(salary) as avg_salary from employees e 
			left join jobs j  on j.job_id = e.job_id
			group by job_title
		)
			select job_title , avg_salary from ortalama_maaslar
------------------------------------------------------------------------------------------------------













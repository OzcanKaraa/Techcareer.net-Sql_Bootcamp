/* 23.06.2023 Konu Anlatim -I */

INDEX : 
Database uzerinde obje
Database uzerinde performans artirma.
Veri milyonlarca milyarlarca ciktigi zaman veriyi hizlica dondurebilme.
Sutunlar uzerinden siralama
Index ile query hizli donus saglar
scan (tarama islemi) eder.
Index maliyeti dusurur.
Index ile sql liste obje tablo ile hizli sonuc alinir.
Index uzerinde aktif sekilde hizlica search yapip hizli sonuc donduren query
Surekli update insert islemleri aktif tablolara index kurulmamasi da performansi artirir.
Index search yapilan sutunlar uzerinde gerceklestirilir.Tc Kimlik ,ID 
Tum sutunlarda index olmaz.Olur ise performans dusurur yavaslatir.

Dezavantaj :
--------------
Obje oldugu icin diskte yer kaplar.
Update insert islemleri performansi duser yavaslatir.


30 milyon kayit insert oldu index ile daha hizli olmasi icin:
Index disable edilir.(Valid)
Indexleri drop ile silip tekrar index olusturma.
Tum tablolari olusturup insert islemlerde bitirip en son index olusturmus.
Ya indexleri disable edilir.Ya da indexleri drop edilebilir.

Indexleri drop edilir tablodan
Indexle ugrasmayip Insert islemleri yapilir.Yuklemeler gerceklestirilir.
Insert islemi bittikten sonra Indexleri tekrar olusturulabilir perfromansina gore.
Index yokken tekrar index olusturmak maliyeti daha azdir.
Ya da Indexi drop yerine Disable edilip Indexi ReBuild edilir.Valid aktif olur.

Index varken insert islemi yapmak maliyeti fazla islem.




explain
select * from employees e      --Seq Scan on employees e  (cost=0.00..3.34 rows=8 width=72)





explain                             
select * from employees e  
where last_name like '%T%'      --  Filter: ((last_name)::text ~~ '%T%'::text)





explain
select *,department_name from employees e 
left join departments d on d.department_id = e.department_id
where last_name like '%T%'

--Hash Left Join  (cost=1.61..4.97 rows=8 width=240)
--  Hash Cond: (e.department_id = d.department_id)
--    Seq Scan on employees e  (cost=0.00..3.34 rows=8 width=72)
--         Filter: ((last_name)::text ~~ '%T%'::text)
--   ->  Hash  (cost=1.27..1.27 rows=27 width=90)
--        ->  Seq Scan on departments d  (cost=0.00..1.27 rows=27 width=90)



--INDEX OLUSTURMA :
create index emp_lst_name on employees (last_name)




explain
select e.*,e2.*,department_name from employees e 
left join departments d on d.department_id = e.department_id
inner join emp_2 e2 on e2.last_name = e.last_name
where e.last_name like '%T%'
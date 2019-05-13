create view prof_vlhora
as select curso.id_cur, nm_prof, vl_hora_prof 
from curso inner join professor on curso.id_cur = professor.id_cur
where curso.id_cur = 1;

sp_help prof_vlhora;

select id_cur 'identificador do curso', nm_prof 'nome do professor', vl_hora_prof 'valor hora' from prof_vlhora;

drop view prof_vlhora;

select * from professor 
where vl_hora_prof > (select avg(vl_hora_prof) from professor)
order by vl_hora_prof desc

select * from professor 
where vl_hora_prof <= (select avg(vl_hora_prof) from professor)
order by vl_hora_prof

select * from aluno 
where dt_nas_alu > (select dt_nas_alu from aluno where pn_alu = 'Silvio')

select id_prof,id_cur,nm_prof,tt_hs_prof,((vl_hora_prof*5)/100)+vl_hora_prof as 'vl_hora_prof' from professor 
where vl_hora_prof <= (select avg(vl_hora_prof) from professor)

create view prof_vlhora_aumento
as select id_prof,id_cur,nm_prof,tt_hs_prof,vl_hora_prof,((vl_hora_prof*5)/100)+vl_hora_prof as 'vl_hora_prof_aum' from professor 
where vl_hora_prof <= (select avg(vl_hora_prof) from professor)


select * from professor
select * from curso
select * from aluno
select * from prof_vlhora
select * from prof_vlhora_aumento


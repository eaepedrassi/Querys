select * from area
select * from curso
select * from turma
select * from aluno
select * from professor
select * from materia


select	* 
from	area 
			inner join curso on 
								area.id_are = curso.id_are
--////////////////////////////////////////////////////////////////////
select	area.id_are, 
		nm_are, 
		nm_cur, 
		nm_prof 
from	area 
			inner join curso on 
								area.id_are = curso.id_are 
			inner join professor on 
									curso.id_cur = professor.id_cur
--///////////////////////////////////////////////////////////////////
select	area.id_are, 
		nm_are, 
		nm_cur, 
		nm_prof 
from	area 
			inner join curso on 
								area.id_are = curso.id_are 
			inner join professor on 
									curso.id_cur = professor.id_cur 
order by area.id_are
--//////////////////////////////////////////////////////////////////
select	area.id_are, 
		nm_are, 
		nm_cur, 
		nm_prof, 
		nm_mat, 
		sg_mat 
from	area 
			inner join curso on 
								area.id_are = curso.id_are 
			inner join professor on 
									curso.id_cur = professor.id_cur 
			inner join materia on 
									professor.id_prof = materia.id_mat
--///////////////////////////////////////////////////////////////////////
select	area.id_are, 
		nm_are, 
		nm_cur, 
		nm_prof, 
		nm_mat, 
		sg_mat 
from	area 
			inner join curso on 
								area.id_are = curso.id_are 
			inner join professor on 
									curso.id_cur = professor.id_cur 
			inner join materia on 
									professor.id_prof = materia.id_mat 
where	area.id_are = 1
--//////////////////////////////////////////////////////////////////////
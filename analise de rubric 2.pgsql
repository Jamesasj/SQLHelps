select * from mdl_gradingform_rubric_levels;
SELECT * from mdl_workshopform_rubric;
SELECT * from mdl_gradingform_rubric_criteria;
SELECT * from mdl_gradingform_rubric_levels;
select * from mdl_assignsubmission_onlinetext;


SELECT schemaname,relname,n_live_tup 
  FROM pg_stat_user_tables 
  ORDER BY n_live_tup DESC;


select * from mdl_gradingform_rubric_fillings x
inner join mdl_gradingform_rubric_levels y on x.criterionid = y.id;

select * from mdl_grade_grades_history;
SELECT * from mdl_assign_user_mapping;
select * from mdl_assign_grades;

select * from mdl_assign;
select * from mdl_assign_submission;
select * from mdl_assignsubmission_onlinetext WHERE id = 12;

select * from mdl_gradingform_rubric_fillings;

SELECT * from mdl_grading_instances;


SELECT
    ag.assignment as id_atividade,
    ag.userid as id_aluno,
    ag.grade as nota_final,
    gi.status as status_rubric,
    rc.description as desc_criterio,
    rl.score as nota_criterio ,
    rl.definition as decricao_select
FROM
    mdl_assign_grades ag
    INNER JOIN mdl_grading_instances gi on ag.id = gi.itemid
    INNER JOIN mdl_gradingform_rubric_fillings rf on gi.id = rf.instanceid
    INNER JOIN mdl_gradingform_rubric_levels rl on rl.id = rf.levelid
    INNER JOIN mdl_gradingform_rubric_criteria rc on rf.criterionid = rc.id 
WHERE gi.status = 0
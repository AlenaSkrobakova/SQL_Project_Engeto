--1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
--Spojím na sebe tabulku t_alena_skrobakova_project_SQL_primary_final a zjistím meziroční změny mezd v jednotlivých odvětvích.

CREATE OR replace TABLE question_1 as
SELECT taspspf.industry_branch,
       taspspf.payroll_year, 
       taspspf.average_wage, 
       taspspf2.payroll_year AS next_payroll_year,
       taspspf2.average_wage AS wage_of_the_next_year,
       round((taspspf2.average_wage-taspspf.average_wage)/taspspf.average_wage*100,2) AS percentage_wage_diff
FROM t_alena_skrobakova_project_sql_primary_final taspspf 
JOIN t_alena_skrobakova_project_sql_primary_final taspspf2 
ON taspspf.industry_branch = taspspf2.industry_branch AND taspspf.payroll_year = taspspf2.payroll_year -1
GROUP BY industry_branch, payroll_year
ORDER BY industry_branch; 

CREATE OR REPLACE TABLE question_1_final as
SELECT *
FROM question_1 q 
WHERE average_wage > wage_of_next_year 
GROUP BY industry_branch 
ORDER BY percentage_wage_diff 








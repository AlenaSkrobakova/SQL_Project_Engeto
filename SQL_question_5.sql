-- 5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

-- Napojím na sebe tabulku t_alena_skrobakova_project_sql_secondary_final a zjistím meziroční změny v HDP.
-- Napojím na vzniklou tabulku i tabulku z otázky č. 4 se změnami cen potravin a mezd.


CREATE OR REPLACE TABLE question_5_final as
SELECT taspssf.country,
       taspssf.`year`,
       taspssf.GDP,
       taspssf2.`year` AS next_year,
       taspssf2.GDP AS GDP_of_the_next_year,
       round((taspssf2.GDP - taspssf.GDP)/taspssf.GDP*100,2) AS GDP_change,
       qf.price_change,
       qf.wage_change 
FROM t_alena_skrobakova_project_sql_secondary_final taspssf 
JOIN t_alena_skrobakova_project_sql_secondary_final taspssf2 
ON taspssf.`year` = taspssf2.`year` -1
JOIN question_4_final qf 
ON taspssf.`year` = qf.payroll_year; 
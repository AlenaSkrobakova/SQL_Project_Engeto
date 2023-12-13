-- 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

-- Zjistím průměrnou cenu všech potravin a všech mezd v jednotlivých letech.

CREATE OR REPLACE TABLE wages_prices as
SELECT DISTINCT payroll_year,
       round(avg(average_wage),0) AS avg_wage_of_all_industry_branches,
       `year`,
       round(avg(average_price),2) AS avg_prices
FROM t_alena_skrobakova_project_sql_primary_final taspspf 
GROUP BY payroll_year;

-- Vytvořím tabulku s meziročními změnami v cenách a mzdách. 

CREATE OR REPLACE TABLE question_4_final as
SELECT wp.payroll_year,
	   wp.avg_wage_of_all_industry_branches,
	   wp.avg_prices,
	   wp2.payroll_year AS next_year,
	   wp2.avg_prices AS avg_prices_of_the_next_year,
       round(((wp2.avg_prices)/(wp.avg_prices)*100-100),2) AS price_change, 
       round(((wp2.avg_wage_of_all_industry_branches)/(wp.avg_wage_of_all_industry_branches)*100-100),2) AS wage_change
FROM wages_prices wp 
JOIN wages_prices wp2 
  ON wp.payroll_year = wp2.payroll_year  -1;

 
SELECT *, price_change - wage_change  AS price_wage_diff
FROM question_4_final qf 
  

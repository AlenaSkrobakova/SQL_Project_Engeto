-- 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

-- Vyfiltruju si ceny mléka a chleba a stanovím průměrné ceny v letech 2006 a 2018.

-- Zjistím průměrnou mzdu za všechna odvětví v letech 2006 a 2018.


CREATE OR REPLACE TABLE question_2_final as
SELECT year, 
       name, 
       average_price, 
       price_value, 
       price_unit, 
       round(avg(average_wage),0) AS avg_wage_total
FROM t_alena_skrobakova_project_sql_primary_final taspspf 
WHERE payroll_year IN ('2006', '2018')
 AND category_code IN ('111301','114201')
GROUP BY payroll_year, name; 

-- Z dostupných dat jsem zjistila, že průměrná mzda ze všech odvětví byla v roce 2006 20 754 Kč a v roce 2018 32 536 Kč.





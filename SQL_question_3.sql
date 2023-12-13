-- 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

-- Zjistím meziroční změny cen u potravin a průměrnou změnu cen za všechna období.


CREATE OR REPLACE TABLE question_3 as
SELECT taspspf.name,
       taspspf.category_code,
       taspspf.`year`, 
       taspspf.average_price,
       taspspf2.`year`  AS next_year,
       taspspf2.average_price AS price_of_the_next_year,
       round(((taspspf2.average_price-taspspf.average_price)/taspspf.average_price)*100,2) AS avg_price_diff 
FROM t_alena_skrobakova_project_sql_primary_final taspspf
JOIN t_alena_skrobakova_project_sql_primary_final taspspf2 
ON taspspf.name = taspspf2.name AND taspspf.year = taspspf2.year -1
GROUP BY name, `year`; 

CREATE OR REPLACE TABLE question_3_final as
SELECT *,
       round(avg(avg_price_diff),2) avg_price_total
FROM question_3 q 
GROUP BY name;

SELECT *
FROM question_3_final qf 
ORDER BY avg_price_total 



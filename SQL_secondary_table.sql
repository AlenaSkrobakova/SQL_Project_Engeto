-- Vytvořím si tabulku s HDP pro Českou republiku v letech 2006 až 2018.

CREATE OR REPLACE TABLE t_alena_skrobakova_project_sql_secondary_final as
SELECT c.country,
       e.`year`,
       e.GDP 
FROM economies e
JOIN countries c 
ON e.country = c.country 
WHERE e.country like 'Cz%' AND e.year > 2005 AND e.YEAR < 2019
ORDER BY e.`year`;


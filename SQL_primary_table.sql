--Připravím si mzdovou a cenovou tabulku.

--Zjistím průměrnou mzdu za jednotlivá odvětví. Nejdříve spojím tabulky czechia_payroll a czechia_payroll_industry_branch, abych zjistila názvy daných odvětví.

CREATE OR REPLACE TABLE Payroll_table AS
SELECT cpib.code, 
       cpib.name AS industry_branch,
       cp.payroll_year, 
       round(avg(cp.value),0) AS average_wage
FROM czechia_payroll cp 
JOIN czechia_payroll_industry_branch cpib 
  ON cp.industry_branch_code = cpib.code 
WHERE value_type_code = 5958
GROUP BY industry_branch, payroll_year 
<<<<<<<< HEAD:SQL_primary_table.sql
ORDER BY cpib.code, cp.payroll_year; 
========
ORDER BY cpib.code, cp.payroll_year 
>>>>>>>> 75bbb98b867bd2a67d3526a24c1f42d8396e5e38:SQL_primary_table

--Zjistím průměrné ceny jednotlivých potravin. Spojím tabulky czechia_price a czechia_price_category, abych zjistila názvy potravin.

CREATE OR REPLACE TABLE Price_table as
SELECT cpc.name,
       year(cp.date_from) AS year,
       cp.category_code,
       round(avg(cp.value),2) AS average_price,
       cpc.price_value,
       cpc.price_unit 
FROM czechia_price cp 
JOIN czechia_price_category cpc 
  ON cp.category_code = cpc.code 
GROUP BY name, year;

--Spojím tabulky průměrných mezd a cen do jedné.

CREATE OR REPLACE TABLE t_Alena_Skrobakova_project_SQL_primary_final AS
SELECT *
FROM payroll_table pt
JOIN price_table pt2 
  ON pt.payroll_year = pt2.`year` 



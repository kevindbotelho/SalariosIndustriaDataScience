SELECT job_title, 
       COUNT(*) AS job_count,
       (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM `BaseSalaries.TbSalaries`) AS percentage_of_total,
       AVG(salary_in_usd) AS average_salary,
       APPROX_QUANTILES(salary_in_usd, 100)[OFFSET(50)] AS median_salary
FROM `BaseSalaries.TbSalaries`
GROUP BY job_title
ORDER BY job_count DESC;
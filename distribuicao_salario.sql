SELECT
  ROUND(SUM(salary_in_usd)/COUNT(id), 2) AS average,
  work_year,
  experience_level,
  employee_residence
FROM
  `BaseSalaries.TbSalaries`
GROUP BY
  work_year,
  experience_level,
  employee_residence
ORDER BY
  employee_residence
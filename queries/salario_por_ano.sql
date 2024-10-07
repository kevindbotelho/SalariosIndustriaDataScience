SELECT
  ROUND(SUM(salary_in_usd)/COUNT(id), 2) AS average,
  work_year
FROM
  `BaseSalaries.TbSalaries`
GROUP BY
  work_year

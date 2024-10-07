SELECT
  ROUND(SUM(salary_in_usd)/COUNT(id), 2) AS average,
  company_size
FROM
  `BaseSalaries.TbSalaries`
GROUP BY
  company_size
ORDER BY
  company_size

SELECT
  ROUND(SUM(salary_in_usd)/COUNT(id), 2) AS average,
  remote_ratio
FROM
  `BaseSalaries.TbSalaries`
GROUP BY
  remote_ratio
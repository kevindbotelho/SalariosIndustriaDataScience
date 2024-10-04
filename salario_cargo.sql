SELECT
  ROUND(SUM(salary_in_usd)/COUNT(id), 2) AS average,
  employment_type,
  job_title
FROM
  `BaseSalaries.TbSalaries`
GROUP BY
  employment_type,
  job_title
ORDER BY
  job_title
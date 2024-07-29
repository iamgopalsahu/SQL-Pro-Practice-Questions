-- Approach 1

SELECT
	Id,
	Company,
	Salary
FROM
	(
		SELECT
			*,
			ROW_NUMBER() OVER(
				PARTITION BY COMPANY
			ORDER BY
				Salary ASC,
				Id ASC
			) AS RN_ASC,
			ROW_NUMBER() OVER(
				PARTITION BY COMPANY
			ORDER BY
				Salary DESC,
				Id DESC
			) AS RN_DESC
		FROM
			postgres.leetcode."Employee"
	) AS TEMP
WHERE
	RN_ASC BETWEEN RN_DESC - 1 AND RN_DESC + 1
ORDER BY
	Company,
	Salary;

-- Approach 2

SELECT
	id,
	company,
	salary
FROM
	(
		SELECT
			id,
			company,
			salary,
			ROW_NUMBER() OVER(
				PARTITION BY company
			ORDER BY
				salary,
				id
			) AS rank_order,
			COUNT(1) OVER(
				PARTITION BY company
			) AS total_rows
		FROM
			postgres.leetcode."Employee"
		ORDER BY
			2,
			4
	) AS tbl
WHERE
	(
		rank_order = (
			total_rows / 2
		)+ 1
	)
	OR (
		rank_order = CEIL(
			total_rows*1.0 / 2
		)
	);

-- Approach 3

SELECT id,
	Company,
	Salary
FROM (
SELECT
	id,
	Company,
	Salary,
	ROW_NUMBER() OVER(PARTITION BY company,salary ORDER BY id) AS rnk
FROM
	postgres.leetcode."Employee" e
WHERE
	1 >= ABS(
		(
			SELECT
				COUNT(*)
			FROM
				postgres.leetcode."Employee" e1
			WHERE
				e.company = e1.company
				AND e.Salary >= e1.Salary
		) -
           (
			SELECT
				COUNT(*)
			FROM
				postgres.leetcode."Employee" e2
			WHERE
				e.company = e2.company
				AND e.Salary <= e2.Salary
		)
	)) outer_query
	WHERE rnk=1;

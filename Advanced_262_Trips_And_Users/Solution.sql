-- Approach 1

SELECT
	trips.request_at AS "Day",
	round(
		1.0 * sum(CASE WHEN status != 'completed' THEN 1 ELSE 0 END)/ count(1),
		2
	) AS "Cancellation Rate"
FROM
	postgres.leetcode."Trips" trips
INNER JOIN 
	postgres.leetcode."Users" AS clients ON trips.client_id = clients.users_id AND clients.banned = 'No'
INNER JOIN 
	postgres.leetcode."Users" AS drivers ON trips.driver_id = drivers.users_id AND drivers.banned = 'No'
WHERE 
	trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 
	request_at
	
-- Approach 2
	
SELECT
	trips.request_at AS "Day",
	round(
		1.0*sum(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)/ count(1),
		2
	) AS "Cancellation Rate"
FROM
	postgres.leetcode."Trips" trips
INNER JOIN 
	postgres.leetcode."Users" AS clients ON trips.client_id = clients.users_id AND clients.banned = 'No'
INNER JOIN 
	postgres.leetcode."Users" AS drivers ON trips.driver_id = drivers.users_id AND drivers.banned = 'No'
WHERE
	trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
	request_at

-- Approach 3
	
WITH active_users AS (
		SELECT
			*
		FROM
			postgres.leetcode."Users"
		WHERE
			banned = 'No'
	)
SELECT
	trips.request_at AS "Day",
	round(
		1.0*sum(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)/ count(1),
		2
	) AS "Cancellation Rate"
FROM
	postgres.leetcode."Trips" trips
WHERE
	trips.client_id IN (
		SELECT 
			users_id
		FROM
			active_users
	)
	AND trips.driver_id IN (
		SELECT
			users_id
		FROM
			active_users
	)
	AND
	trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
	request_at


-- Approach 4
	
WITH active_users AS (
		SELECT
			*
		FROM
			postgres.leetcode."Users"
		WHERE
			banned = 'No'
	)
SELECT
	trips.request_at AS "Day",
	round(
		1.0*sum(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END)/ count(1),
		2
	) AS "Cancellation Rate"
FROM
	postgres.leetcode."Trips" trips
WHERE
	EXISTS (
		SELECT 
			users_id
		FROM
			active_users
		WHERE
			trips.client_id = users_id 
	)
	AND EXISTS (
		SELECT
			users_id
		FROM
			active_users
		WHERE trips.driver_id = users_id 
	)
	AND
	trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
	request_at;

SELECT
    n.director_name,
    COUNT(*) AS total_counts
FROM
    netflix_server_table
CROSS JOIN LATERAL
    unnest(string_to_array(director, ', ')) AS n(director_name)
GROUP BY
    n.director_name
ORDER BY
    total_counts DESC
LIMIT 10
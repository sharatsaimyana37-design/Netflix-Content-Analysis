SELECT
    rating,
    COUNT(*) AS total_counts
FROM 
    netflix_server_table
WHERE
    rating IS NOT NULL
GROUP BY
    rating
ORDER BY
    total_counts DESC
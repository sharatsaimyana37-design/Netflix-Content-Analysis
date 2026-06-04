SELECT 
    type AS movie_type,
    COUNT(*) AS total_counts
FROM 
    netflix_server_table
GROUP BY
    type
ORDER BY
    total_counts DESC
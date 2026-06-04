SELECT 
    COUNT(*) AS total_count,
    TRIM(g.genre_name) AS Genre
FROM netflix_server_table
CROSS JOIN LATERAL
    unnest(string_to_array(listed_in, ', ')) AS g(genre_name)
GROUP BY g.genre_name
ORDER BY total_count DESC
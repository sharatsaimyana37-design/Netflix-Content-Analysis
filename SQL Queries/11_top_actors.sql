SELECT
    n.actor_name,
    COUNT(*) AS total_count
FROM
    netflix_server_table
CROSS JOIN LATERAL
    unnest(string_to_array(actors, ', ')) n(actor_name)
GROUP BY
    n.actor_name
ORDER BY
    total_count DESC
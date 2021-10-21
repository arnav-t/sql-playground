SELECT ROUND((SELECT COUNT(*) as cnt FROM activity a INNER JOIN (SELECT player_id, MIN(event_date)+1 as second_day FROM activity GROUP BY player_id) b ON a.player_id = b.player_id AND a.event_date = b.second_day)*1.0/(SELECT COUNT(DISTINCT player_id) FROM activity), 2) as fraction;

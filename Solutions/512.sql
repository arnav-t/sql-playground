SELECT DISTINCT player_id, (SELECT b.device_id FROM activity b WHERE b.player_id = a.player_id ORDER BY b.event_date LIMIT 1) FROM activity a ORDER BY player_id;

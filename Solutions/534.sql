-- Subquery version
SELECT player_id, event_date, (SELECT SUM(games_played) FROM activity b WHERE player_id = a.player_id AND event_date <= a.event_date) AS games_played_so_far FROM activity a;

-- Join version
SELECT a.player_id, a.event_date, SUM(b.games_played) AS games_played_so_far FROM activity a JOIN activity b ON a.player_id = b.player_id AND a.event_date >= b.event_date GROUP BY a.player_id, a.event_date ORDER BY player_id, event_date;

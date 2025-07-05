-- Сколько прошло дней с момента публикации поста
SELECT post_id, content, created_at,
       ROUND(EXTRACT(EPOCH FROM (NOW() - created_at))/86400) AS days_ago
FROM SocialNetwork.posts
ORDER BY days_ago DESC;

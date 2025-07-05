-- Ранжирование постов по дате публикации
SELECT post_id, user_id, content, created_at,
       RANK() OVER (ORDER BY created_at DESC) AS post_rank
FROM SocialNetwork.posts
LIMIT 10;

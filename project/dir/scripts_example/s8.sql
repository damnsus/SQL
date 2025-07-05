-- Последний комментарий каждого пользователя
SELECT *
FROM (
    SELECT c.comment_id, u.username, c.content, c.created_at,
           ROW_NUMBER() OVER (PARTITION BY c.user_id ORDER BY c.created_at DESC) AS rn
    FROM SocialNetwork.comments c
    JOIN SocialNetwork.users u ON c.user_id = u.user_id
) ranked
WHERE rn = 1;

-- Коментарии к самому популярному по лайкам посту
SELECT c.comment_id, u.username, c.content
FROM SocialNetwork.comments c
JOIN SocialNetwork.users u ON c.user_id = u.user_id
WHERE c.post_id = (
    SELECT post_id
    FROM SocialNetwork.likes
    GROUP BY post_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Посты с числом комментариев > 2
SELECT p.post_id, p.content, COUNT(c.comment_id) AS comment_count
FROM SocialNetwork.posts p
JOIN SocialNetwork.comments c ON p.post_id = c.post_id
GROUP BY p.post_id, p.content
HAVING COUNT(c.comment_id) > 2
ORDER BY comment_count DESC;

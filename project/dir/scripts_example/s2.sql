-- Самые популярные посты по лайкам
SELECT p.post_id, p.content, COUNT(l.like_id) AS like_count
FROM SocialNetwork.posts p
LEFT JOIN SocialNetwork.likes l ON p.post_id = l.post_id
GROUP BY p.post_id, p.content
ORDER BY like_count DESC
LIMIT 5;

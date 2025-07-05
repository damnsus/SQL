-- Пользователи без подписчиков
SELECT u.user_id, u.username
FROM SocialNetwork.users u
LEFT JOIN SocialNetwork.follows f ON u.user_id = f.following_id
WHERE f.follower_id IS NULL;

CREATE OR REPLACE VIEW SocialNetwork.user_followers AS
SELECT 
    u.user_id,
    u.username,
    COUNT(f.follower_id) AS follower_count
FROM SocialNetwork.users u
LEFT JOIN SocialNetwork.follows f ON u.user_id = f.following_id
GROUP BY u.user_id;

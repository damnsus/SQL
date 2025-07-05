CREATE OR REPLACE FUNCTION SocialNetwork.is_following(follower INT, following INT)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN EXISTS (
        SELECT 1 
        FROM SocialNetwork.follows 
        WHERE follower_id = follower AND following_id = following
    );
END;
$$ LANGUAGE plpgsql;

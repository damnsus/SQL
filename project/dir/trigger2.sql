CREATE TABLE IF NOT EXISTS SocialNetwork.likes_log (
    log_id SERIAL PRIMARY KEY,
    user_id INT,
    post_id INT,
    action_time TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION SocialNetwork.log_like()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO SocialNetwork.likes_log(user_id, post_id)
    VALUES (NEW.user_id, NEW.post_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_log_like
AFTER INSERT ON SocialNetwork.likes
FOR EACH ROW
EXECUTE FUNCTION SocialNetwork.log_like();

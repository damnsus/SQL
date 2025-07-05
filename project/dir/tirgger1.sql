CREATE OR REPLACE FUNCTION SocialNetwork.set_default_bio()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.bio IS NULL THEN
        NEW.bio := 'Привет! Я только что присоединился!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_default_bio
BEFORE INSERT ON SocialNetwork.users
FOR EACH ROW
EXECUTE FUNCTION SocialNetwork.set_default_bio();

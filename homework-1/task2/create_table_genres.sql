-- Таблица с жанрами книг

CREATE TABLE IF NOT EXISTS student08.tb_genres();

ALTER TABLE IF EXISTS student08.tb_genres
    ADD COLUMN IF NOT EXISTS genre_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS description                TEXT
;

COMMENT ON TABLE  student08.tb_genres                               IS 'Таблица с жанрами книг';
COMMENT ON COLUMN student08.tb_genres.genre_id                      IS 'Идентификатор жанра';
COMMENT ON COLUMN student08.tb_genres.name                          IS 'Название жанра';
COMMENT ON COLUMN student08.tb_genres.description                   IS 'Описание жанра';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_genres''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student08.tb_genres ADD primary key (genre_id);
    END IF;
END ';
-- Таблица с исполнителями

CREATE TABLE IF NOT EXISTS student08.tb_artists();

ALTER TABLE IF EXISTS student08.tb_artists
    ADD COLUMN IF NOT EXISTS artist_id                  BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS country                    VARCHAR,
    ADD COLUMN IF NOT EXISTS formed_year                SMALLINT
;

COMMENT ON TABLE  student08.tb_artists                             IS 'Таблица с музыкальными исполнителями';
COMMENT ON COLUMN student08.tb_artists.artist_id                   IS 'Идентификатор исполнителя';
COMMENT ON COLUMN student08.tb_artists.name                        IS 'Имя исполнителя/группы';
COMMENT ON COLUMN student08.tb_artists.country                     IS 'Страна исполнителя';
COMMENT ON COLUMN student08.tb_artists.formed_year                 IS 'Год основания группы';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_artists''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student08.tb_artists ADD primary key (artist_id);
    END IF;
END ';
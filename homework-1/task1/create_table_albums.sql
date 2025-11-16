-- Таблица с альбомами

CREATE TABLE IF NOT EXISTS student08.tb_albums();

ALTER TABLE IF EXISTS student08.tb_albums
    ADD COLUMN IF NOT EXISTS album_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS title                      VARCHAR,
    ADD COLUMN IF NOT EXISTS artist_id                  BIGINT,
    ADD COLUMN IF NOT EXISTS release_year               SMALLINT,
    ADD COLUMN IF NOT EXISTS genre_id                   BIGINT
;

COMMENT ON TABLE  student08.tb_albums                              IS 'Таблица с музыкальными альбомами';
COMMENT ON COLUMN student08.tb_albums.album_id                    IS 'Идентификатор альбома';
COMMENT ON COLUMN student08.tb_albums.title                       IS 'Название альбома';
COMMENT ON COLUMN student08.tb_albums.artist_id                   IS 'Идентификатор исполнителя';
COMMENT ON COLUMN student08.tb_albums.release_year                IS 'Год выпуска альбома';
COMMENT ON COLUMN student08.tb_albums.genre_id                    IS 'Идентификатор жанра альбома';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_albums''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student08.tb_albums ADD primary key (album_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_albums''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_albums ADD FOREIGN KEY (artist_id) REFERENCES student08.tb_artists(artist_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_albums''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_albums ADD FOREIGN KEY (genre_id) REFERENCES student08.tb_genres(genre_id);
    END IF;
END ';
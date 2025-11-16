-- Таблица с музыкальными треками

CREATE TABLE IF NOT EXISTS student08.tb_tracks();

ALTER TABLE IF EXISTS student08.tb_tracks
    ADD COLUMN IF NOT EXISTS track_id                   BIGSERIAL,
    ADD COLUMN IF NOT EXISTS title                      VARCHAR,
    ADD COLUMN IF NOT EXISTS artist_id                  BIGINT,
    ADD COLUMN IF NOT EXISTS album_id                   BIGINT,
    ADD COLUMN IF NOT EXISTS duration                   INTEGER,
    ADD COLUMN IF NOT EXISTS release_year               SMALLINT,
    ADD COLUMN IF NOT EXISTS genre_id                   BIGINT,
    ADD COLUMN IF NOT EXISTS play_count                 BIGINT DEFAULT 0
;

COMMENT ON TABLE  student08.tb_tracks                              IS 'Таблица с музыкальными треками';
COMMENT ON COLUMN student08.tb_tracks.track_id                    IS 'Идентификатор трека';
COMMENT ON COLUMN student08.tb_tracks.title                       IS 'Название трека';
COMMENT ON COLUMN student08.tb_tracks.artist_id                   IS 'Идентификатор исполнителя';
COMMENT ON COLUMN student08.tb_tracks.album_id                    IS 'Идентификатор альбома';
COMMENT ON COLUMN student08.tb_tracks.duration                    IS 'Длительность трека в секундах';
COMMENT ON COLUMN student08.tb_tracks.release_year                IS 'Год выпуска трека';
COMMENT ON COLUMN student08.tb_tracks.genre_id                    IS 'Идентификатор жанра';
COMMENT ON COLUMN student08.tb_tracks.play_count                  IS 'Количество прослушиваний';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_tracks''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student08.tb_tracks ADD primary key (track_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_tracks''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_tracks ADD FOREIGN KEY (artist_id) REFERENCES student08.tb_artists(artist_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_tracks''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_tracks ADD FOREIGN KEY (album_id) REFERENCES student08.tb_albums(album_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_tracks''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_tracks ADD FOREIGN KEY (genre_id) REFERENCES student08.tb_genres(genre_id);
    END IF;
END ';
    -- Таблица с авторами книг

    CREATE TABLE IF NOT EXISTS student08.tb_authors();

    ALTER TABLE IF EXISTS student08.tb_authors
        ADD COLUMN IF NOT EXISTS author_id                  BIGSERIAL,
        ADD COLUMN IF NOT EXISTS first_name                 VARCHAR,
        ADD COLUMN IF NOT EXISTS last_name                  VARCHAR,
        ADD COLUMN IF NOT EXISTS country                    VARCHAR,
        ADD COLUMN IF NOT EXISTS birth_date                 DATE
    ;

    COMMENT ON TABLE  student08.tb_authors                              IS 'Таблица с авторами книг';
    COMMENT ON COLUMN student08.tb_authors.author_id                   IS 'Идентификатор автора';
    COMMENT ON COLUMN student08.tb_authors.first_name                  IS 'Имя автора';
    COMMENT ON COLUMN student08.tb_authors.last_name                   IS 'Фамилия автора';
    COMMENT ON COLUMN student08.tb_authors.country                     IS 'Страна автора';
    COMMENT ON COLUMN student08.tb_authors.birth_date                  IS 'Дата рождения автора';

    DO '
    BEGIN
        IF NOT EXISTS (
                SELECT 1
                FROM information_schema.table_constraints
                WHERE lower(table_name) = ''tb_authors''
                and lower(table_schema) = ''student08''
                and lower(constraint_type) = ''primary key''
            )
        THEN
            ALTER TABLE student08.tb_authors ADD primary key (author_id);
        END IF;
    END ';
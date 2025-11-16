-- Таблица с издательствами

CREATE TABLE IF NOT EXISTS student08.tb_publishers();

ALTER TABLE IF EXISTS student08.tb_publishers
    ADD COLUMN IF NOT EXISTS publisher_id               BIGSERIAL,
    ADD COLUMN IF NOT EXISTS name                       VARCHAR,
    ADD COLUMN IF NOT EXISTS country                    VARCHAR,
    ADD COLUMN IF NOT EXISTS founded_year               INTEGER
;

COMMENT ON TABLE  student08.tb_publishers                           IS 'Таблица с издательствами';
COMMENT ON COLUMN student08.tb_publishers.publisher_id             IS 'Идентификатор издательства';
COMMENT ON COLUMN student08.tb_publishers.name                      IS 'Название издательства';
COMMENT ON COLUMN student08.tb_publishers.country                   IS 'Страна издательства';
COMMENT ON COLUMN student08.tb_publishers.founded_year              IS 'Год основания издательства';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_publishers''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student08.tb_publishers ADD primary key (publisher_id);
    END IF;
END ';
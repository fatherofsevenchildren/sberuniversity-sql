-- Таблица с книгами

CREATE TABLE IF NOT EXISTS student08.tb_books();

ALTER TABLE IF EXISTS student08.tb_books
    ADD COLUMN IF NOT EXISTS book_id                    BIGSERIAL,
    ADD COLUMN IF NOT EXISTS title                      VARCHAR,
    ADD COLUMN IF NOT EXISTS author_id                  BIGINT,
    ADD COLUMN IF NOT EXISTS publisher_id               BIGINT,
    ADD COLUMN IF NOT EXISTS genre_id                   BIGINT,
    ADD COLUMN IF NOT EXISTS isbn                       VARCHAR,
    ADD COLUMN IF NOT EXISTS publication_year           INTEGER,
    ADD COLUMN IF NOT EXISTS pages                      INTEGER,
    ADD COLUMN IF NOT EXISTS price                      DECIMAL(10,2),
    ADD COLUMN IF NOT EXISTS file_size                  INTEGER,
    ADD COLUMN IF NOT EXISTS file_format                VARCHAR
;

COMMENT ON TABLE  student08.tb_books                                IS 'Таблица с электронными книгами';
COMMENT ON COLUMN student08.tb_books.book_id                       IS 'Идентификатор книги';
COMMENT ON COLUMN student08.tb_books.title                         IS 'Название книги';
COMMENT ON COLUMN student08.tb_books.author_id                     IS 'Идентификатор автора';
COMMENT ON COLUMN student08.tb_books.publisher_id                  IS 'Идентификатор издательства';
COMMENT ON COLUMN student08.tb_books.genre_id                      IS 'Идентификатор жанра';
COMMENT ON COLUMN student08.tb_books.isbn                          IS 'ISBN книги';
COMMENT ON COLUMN student08.tb_books.publication_year              IS 'Год публикации';
COMMENT ON COLUMN student08.tb_books.pages                         IS 'Количество страниц';
COMMENT ON COLUMN student08.tb_books.price                         IS 'Цена книги';
COMMENT ON COLUMN student08.tb_books.file_size                     IS 'Размер файла в KB';
COMMENT ON COLUMN student08.tb_books.file_format                   IS 'Формат файла (PDF, EPUB, MOBI)';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_books''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''primary key''
        )
    THEN
        ALTER TABLE student08.tb_books ADD primary key (book_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_books''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_books ADD FOREIGN KEY (author_id) REFERENCES student08.tb_authors(author_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_books''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_books ADD FOREIGN KEY (publisher_id) REFERENCES student08.tb_publishers(publisher_id);
    END IF;
END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_books''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
        )
    THEN
        ALTER TABLE student08.tb_books ADD FOREIGN KEY (genre_id) REFERENCES student08.tb_genres(genre_id);
    END IF;
END ';
-- Таблица с книгами

CREATE TABLE student08.tb_books (
    book_id BIGSERIAL,
    title VARCHAR,
    author_id BIGINT,
    publisher_id BIGINT,
    genre_id BIGINT,
    isbn VARCHAR,
    publication_year INTEGER,
    pages INTEGER,
    price DECIMAL(10,2),
    file_size INTEGER,
    file_format VARCHAR,
	downloads_count INTEGER
) PARTITION BY RANGE (downloads_count);

CREATE TABLE tb_books_1000 PARTITION OF student08.tb_books
    FOR VALUES FROM (0) TO (1000);

CREATE TABLE tb_books_10000 PARTITION OF student08.tb_books
    FOR VALUES FROM (1000) TO (10000);

CREATE TABLE tb_books_other PARTITION OF student08.tb_books
    FOR VALUES FROM (10000) TO (MAXVALUE);
	
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

-- DO '
-- BEGIN
--     IF NOT EXISTS (
--             SELECT 1
--             FROM information_schema.table_constraints
--             WHERE lower(table_name) = ''tb_books''
--               and lower(table_schema) = ''student08''
--               and lower(constraint_type) = ''primary key''
--         )
--     THEN
--         ALTER TABLE student08.tb_books ADD primary key (book_id);
--     END IF;
-- END ';

DO '
BEGIN
    IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE lower(table_name) = ''tb_books''
              and lower(table_schema) = ''student08''
              and lower(constraint_type) = ''foreign key''
              and lower(constraint_name) like ''%author_id%''
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
              and lower(constraint_name) like ''%publisher_id%''
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
              and lower(constraint_name) like ''%genre_id%''
        )
    THEN
        ALTER TABLE student08.tb_books ADD FOREIGN KEY (genre_id) REFERENCES student08.tb_genres(genre_id);
    END IF;
END ';
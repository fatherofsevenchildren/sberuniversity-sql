-- Наполнение таблиц БД электронных книг

-- Таблица с жанрами
INSERT INTO student08.tb_genres (name, description) VALUES ('Фантастика', 'Научная фантастика и фэнтези');
INSERT INTO student08.tb_genres (name, description) VALUES ('Детектив', 'Детективные романы и триллеры');
INSERT INTO student08.tb_genres (name, description) VALUES ('Роман', 'Художественная литература');
INSERT INTO student08.tb_genres (name, description) VALUES ('Научная литература', 'Научно-популярные книги');
INSERT INTO student08.tb_genres (name, description) VALUES ('Программирование', 'Книги по программированию и IT');

-- Таблица с издательствами
INSERT INTO student08.tb_publishers (name, country, founded_year) VALUES ('Эксмо', 'Россия', 1991);
INSERT INTO student08.tb_publishers (name, country, founded_year) VALUES ('АСТ', 'Россия', 1990);
INSERT INTO student08.tb_publishers (name, country, founded_year) VALUES ('O''Reilly Media', 'США', 1978);
INSERT INTO student08.tb_publishers (name, country, founded_year) VALUES ('Penguin Random House', 'США', 2013);

-- Таблица с авторами
INSERT INTO student08.tb_authors (first_name, last_name, country, birth_date) VALUES ('Джордж', 'Оруэлл', 'Великобритания', '1903-06-25');
INSERT INTO student08.tb_authors (first_name, last_name, country, birth_date) VALUES ('Агата', 'Кристи', 'Великобритания', '1890-09-15');
INSERT INTO student08.tb_authors (first_name, last_name, country, birth_date) VALUES ('Рэй', 'Брэдбери', 'США', '1920-08-22');
INSERT INTO student08.tb_authors (first_name, last_name, country, birth_date) VALUES ('Роберт', 'Мартин', 'США', '1952-12-05');
INSERT INTO student08.tb_authors (first_name, last_name, country, birth_date) VALUES ('Федор', 'Достоевский', 'Россия', '1821-11-11');

-- Таблица с книгами
INSERT INTO student08.tb_books (title, author_id, publisher_id, genre_id, isbn, publication_year, pages, price, file_size, file_format) VALUES (
    '1984',
    (SELECT author_id FROM student08.tb_authors WHERE first_name='Джордж' AND last_name='Оруэлл'),
    (SELECT publisher_id FROM student08.tb_publishers WHERE name='АСТ'),
    (SELECT genre_id FROM student08.tb_genres WHERE name='Фантастика'),
    '978-5-17-099407-7',
    1949,
    328,
    299.00,
    2048,
    'EPUB'
);

INSERT INTO student08.tb_books (title, author_id, publisher_id, genre_id, isbn, publication_year, pages, price, file_size, file_format) VALUES (
    'Убийство в Восточном экспрессе',
    (SELECT author_id FROM student08.tb_authors WHERE first_name='Агата' AND last_name='Кристи'),
    (SELECT publisher_id FROM student08.tb_publishers WHERE name='Эксмо'),
    (SELECT genre_id FROM student08.tb_genres WHERE name='Детектив'),
    '978-5-04-099432-1',
    1934,
    256,
    349.00,
    1876,
    'PDF'
);

INSERT INTO student08.tb_books (title, author_id, publisher_id, genre_id, isbn, publication_year, pages, price, file_size, file_format) VALUES (
    '451° по Фаренгейту',
    (SELECT author_id FROM student08.tb_authors WHERE first_name='Рэй' AND last_name='Брэдбери'),
    (SELECT publisher_id FROM student08.tb_publishers WHERE name='Эксмо'),
    (SELECT genre_id FROM student08.tb_genres WHERE name='Фантастика'),
    '978-5-699-97354-2',
    1953,
    256,
    279.00,
    1920,
    'EPUB'
);

INSERT INTO student08.tb_books (title, author_id, publisher_id, genre_id, isbn, publication_year, pages, price, file_size, file_format) VALUES (
    'Чистый код',
    (SELECT author_id FROM student08.tb_authors WHERE first_name='Роберт' AND last_name='Мартин'),
    (SELECT publisher_id FROM student08.tb_publishers WHERE name='Penguin Random House'),
    (SELECT genre_id FROM student08.tb_genres WHERE name='Программирование'),
    '978-0-13-235088-4',
    2008,
    464,
    1299.00,
    4096,
    'PDF'
);

INSERT INTO student08.tb_books (title, author_id, publisher_id, genre_id, isbn, publication_year, pages, price, file_size, file_format) VALUES (
    'Преступление и наказание',
    (SELECT author_id FROM student08.tb_authors WHERE first_name='Федор' AND last_name='Достоевский'),
    (SELECT publisher_id FROM student08.tb_publishers WHERE name='АСТ'),
    (SELECT genre_id FROM student08.tb_genres WHERE name='Роман'),
    '978-5-17-090650-5',
    1866,
    608,
    199.00,
    3584,
    'EPUB'
);
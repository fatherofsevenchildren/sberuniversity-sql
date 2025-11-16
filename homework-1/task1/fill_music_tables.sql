-- Наполнение таблиц музыкальной БД

-- Таблица с жанрами
INSERT INTO student08.tb_genres (name) VALUES ('рок');
INSERT INTO student08.tb_genres (name) VALUES ('поп');
INSERT INTO student08.tb_genres (name) VALUES ('хип-хоп');
INSERT INTO student08.tb_genres (name) VALUES ('электроника');
INSERT INTO student08.tb_genres (name) VALUES ('джаз');
INSERT INTO student08.tb_genres (name) VALUES ('классика');

-- Таблица с исполнителями
INSERT INTO student08.tb_artists (name, country, formed_year) VALUES ('The Beatles', 'Великобритания', 1960);
INSERT INTO student08.tb_artists (name, country, formed_year) VALUES ('Queen', 'Великобритания', 1970);
INSERT INTO student08.tb_artists (name, country, formed_year) VALUES ('Daft Punk', 'Франция', 1993);
INSERT INTO student08.tb_artists (name, country, formed_year) VALUES ('Кино', 'СССР', 1981);
INSERT INTO student08.tb_artists (name, country, formed_year) VALUES ('Miles Davis', 'США', 1944);

-- Таблица с альбомами
INSERT INTO student08.tb_albums (title, artist_id, release_year, genre_id) VALUES (
    'Abbey Road',
    (SELECT artist_id FROM student08.tb_artists WHERE name='The Beatles'),
    1969,
    (SELECT genre_id FROM student08.tb_genres WHERE name='рок')
);

INSERT INTO student08.tb_albums (title, artist_id, release_year, genre_id) VALUES (
    'A Night at the Opera',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Queen'),
    1975,
    (SELECT genre_id FROM student08.tb_genres WHERE name='рок')
);

INSERT INTO student08.tb_albums (title, artist_id, release_year, genre_id) VALUES (
    'Random Access Memories',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Daft Punk'),
    2013,
    (SELECT genre_id FROM student08.tb_genres WHERE name='электроника')
);

INSERT INTO student08.tb_albums (title, artist_id, release_year, genre_id) VALUES (
    'Группа крови',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Кино'),
    1988,
    (SELECT genre_id FROM student08.tb_genres WHERE name='рок')
);

INSERT INTO student08.tb_albums (title, artist_id, release_year, genre_id) VALUES (
    'Kind of Blue',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Miles Davis'),
    1959,
    (SELECT genre_id FROM student08.tb_genres WHERE name='джаз')
);

-- Таблица с треками
INSERT INTO student08.tb_tracks (title, artist_id, album_id, duration, release_year, genre_id, play_count) VALUES (
    'Come Together',
    (SELECT artist_id FROM student08.tb_artists WHERE name='The Beatles'),
    (SELECT album_id FROM student08.tb_albums WHERE title='Abbey Road'),
    259,
    1969,
    (SELECT genre_id FROM student08.tb_genres WHERE name='рок'),
    15000000
);

INSERT INTO student08.tb_tracks (title, artist_id, album_id, duration, release_year, genre_id, play_count) VALUES (
    'Bohemian Rhapsody',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Queen'),
    (SELECT album_id FROM student08.tb_albums WHERE title='A Night at the Opera'),
    354,
    1975,
    (SELECT genre_id FROM student08.tb_genres WHERE name='рок'),
    25000000
);

INSERT INTO student08.tb_tracks (title, artist_id, album_id, duration, release_year, genre_id, play_count) VALUES (
    'Get Lucky',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Daft Punk'),
    (SELECT album_id FROM student08.tb_albums WHERE title='Random Access Memories'),
    248,
    2013,
    (SELECT genre_id FROM student08.tb_genres WHERE name='электроника'),
    18000000
);

INSERT INTO student08.tb_tracks (title, artist_id, album_id, duration, release_year, genre_id, play_count) VALUES (
    'Группа крови',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Кино'),
    (SELECT album_id FROM student08.tb_albums WHERE title='Группа крови'),
    287,
    1988,
    (SELECT genre_id FROM student08.tb_genres WHERE name='рок'),
    12000000
);

INSERT INTO student08.tb_tracks (title, artist_id, album_id, duration, release_year, genre_id, play_count) VALUES (
    'So What',
    (SELECT artist_id FROM student08.tb_artists WHERE name='Miles Davis'),
    (SELECT album_id FROM student08.tb_albums WHERE title='Kind of Blue'),
    562,
    1959,
    (SELECT genre_id FROM student08.tb_genres WHERE name='джаз'),
    8000000
);
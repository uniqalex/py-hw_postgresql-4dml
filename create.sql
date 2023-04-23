create table if not exists author (
	author_id 	SERIAL not NULL,
	name 		varchar(60) not NULL,
	constraint PK_author primary key (author_id)
);

create table if not exists genre (
	genre_id 	SERIAL not null,
	name 		varchar(60) not null,
	constraint PK_style primary key (genre_id)
);

create table if not exists genres (
	genres_id 	SERIAL not null,
	author_id 	int not null constraint FK_author references author(author_id),
	genre_id 	int not null constraint FK_genre references genre(genre_id),
	constraint PK_genres primary key (genres_id)
);

create table if not exists album (
	album_id 		SERIAL not null,
	name 			varchar(60) not null,
	year_public 	smallint not null,
	constraint PK_album primary key (album_id)
);

create table if not exists albums (
	albums_id 	SERIAL not null,
	album_id 	int not null references album(album_id),
	author_id 	int not null references author(author_id),
	constraint PK_albums primary key (albums_id)
);

create table if not exists song (
	song_id 	SERIAL not null,
	duration	int not null,
	name 		varchar(60) not null,
	genre_id 	int not null references genre(genre_id),
	album_id 	int not null references album(album_id),
	constraint PK_song primary key (song_id)
); 

create table if not exists collection (
	collection_id 	SERIAL not null,
	name 			varchar(60) not null,
	year_public 	smallint not null,
	constraint PK_collection primary key (collection_id)
);

create table if not exists collections (
	collections_id 	SERIAL not null,
	collection_id 	int not null references collection(collection_id),
	song_id 		int not null references song(song_id),
	constraint UNIQ_collec_song unique (collection_id, song_id),
	constraint PK_collections primary key (collections_id)	
);
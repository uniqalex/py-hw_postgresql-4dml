insert into author (name)
		  select 'Автор1'
union all select 'Big Head'
union all select 'Автор3'
union all select 'Автор4 и Ко'
union all select 'Автор5'
union all select 'Erlih Bakhman'
union all select 'Дует Автор7'
union all select 'Автор8';


insert into genre (name)
		  select 'Рок'
union all select 'Поп'
union all select 'Фанк'
union all select 'Транс'
union all select 'Электро'
union all select 'Drum';

insert into genres (genre_id, author_id)
		  select 1, 6
union all select 2, 5
union all select 3, 4
union all select 4, 3
union all select 1, 2
union all select 1, 3
union all select 6, 6
union all select 2, 5
union all select 3, 8;


insert into album (name, year_public)
		  select 'Албом1', 2015
union all select 'Албом2', 2016
union all select 'Албом3', 2017
union all select 'Албом4', 2018
union all select 'Албом5', 2019
union all select 'Албом6', 2020
union all select 'Албом7', 2021
union all select 'Албом8', 2022;

insert into albums (album_id, author_id)
		  select 1, 8
union all select 2, 8
union all select 3, 8
union all select 4, 1
union all select 4, 2
union all select 4, 4
union all select 5, 5
union all select 5, 6
union all select 5, 7
union all select 5, 6
union all select 5, 6
union all select 6, 4
union all select 6, 5
union all select 6, 8
union all select 6, 7;


insert into song (name, duration, genre_id, album_id)
		  select 'Дзанг Янг мой лучший друг', 180, 1, 1
union all select 'Flamingo данс', 190, 2, 2
union all select 'Bankok', 200, 3, 3
union all select 'Джеска данс', 280, 4, 4
union all select 'Старая лиса', 280, 5, 5
union all select 'Down grade', 280, 1, 6
union all select 'Амиго шанс', 290, 2, 7
union all select 'Мучачо велкам', 270, 3, 8
union all select 'Амиго 1', 280, 4, 1
union all select 'Амиго 2', 280, 5, 2
union all select 'Амиго 4', 250, 1, 3
union all select 'Амиго 3', 280, 2, 4
union all select 'Амиго 6', 280, 3, 5
union all select 'My Phillip McCrevis left word', 340, 4, 6
union all select 'Амиго 8', 280, 5, 7
union all select 'Амиго 7', 310, 1, 8
union all select 'Plumb', 320, 2, 1
union all select 'Blumb', 220, 3, 2
union all select 'Clump', 240, 4, 3
union all select 'Bighead', 280, 5, 4
union all select 'Амиго my данс', 370, 1, 5;

insert into collection (name, year_public)
	  	  select 'Scary of 2000', 2010
union all select 'Dzang Yang Dreams', 2019
union all select 'Best of 2017', 2018
union all select 'Best of 2021', 2022
union all select 'Best of 2022', 2023
union all select 'Best of 2016', 2017
union all select 'Best of 2015', 2016
union all select 'Best of 2014', 2015
union all select 'Best of 2012', 2013;

-- how to generate random l-h => SELECT floor(random() * (h-l+1) + l)::int;
insert into collections (collection_id, song_id)
	  	  select 1, 1
union all select 1, 2
union all select 1, 3
union all select 1, 4
union all select 1, 5
union all select 1, 6
union all select 2, 7
union all select 2, 8
union all select 2, 9
union all select 2, 10
union all select 2, 11
union all select 3, 12
union all select 3, 13
union all select 3, 14
union all select 3, 2
union all select 3, 3
union all select 3, 4
union all select 3, 5
union all select 3, 6
union all select 4, 15
union all select 4, 16
union all select 4, 1
union all select 4, 2
union all select 4, 3
union all select 4, 7
union all select 4, 8
union all select 4, 9
union all select 4, 10
union all select 4, 11;

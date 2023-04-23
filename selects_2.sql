--1.Количество исполнителей в каждом жанре.
select gs.genre_id, count(*) as amount
from genres gs
--inner join genre g on gs.genre_id  = g.genre_id 
group by gs.genre_id;

--2.Количество треков, вошедших в альбомы 2019–2020 годов.
select count(song_id)
from song s 
inner join album a  on s.album_id  = a.album_id 
where a.year_public  between 2019 and 2020;

--3.Средняя продолжительность треков по каждому альбому
select a2.name, avg(s.duration) as avg_duration
from song s 
inner join albums a on s.album_id = a.albums_id 
inner join album a2 on a.album_id = a2.album_id
group by a2.name;

--4.Все исполнители, которые не выпустили альбомы в 2020 году.
select name
from author
where author_id not in (
					select author.author_id
					from author
					inner join albums a2 on author.author_id = a2.author_id 
					inner join album a on a2.album_id = a.album_id
					where a.year_public  = 2020
);

--5.Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct c.name 
from collection c 
inner join collections cs on c.collection_id = cs.collection_id 
inner join song s on s.song_id = cs.song_id 
inner join album a on a.album_id = s.album_id 
inner join albums a2 on a2.album_id = a.album_id  
inner join author au on au.author_id = a2.author_id
where
	au.name = 'Erlih Bakhman';

--6.Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
select distinct a.name 
from album a 
inner join albums a2 on a.album_id = a2.album_id 
where a2.author_id in (
						select author_id
						from genres gs
						group by author_id
						having count(distinct genre_id) > 1
					);
					
--7.Наименования треков, которые не входят в сборники.
select name
from song s
left join collections c ON c.song_id = s.song_id 
where c.song_id is null;

--8.Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
select distinct au.name
from song s
inner join album a on a.album_id = s.album_id 
inner join albums a2 on a2.album_id = a.album_id  
inner join author au on au.author_id = a2.author_id
where 
	s.duration = (select min(duration) from song);
	
--9.Названия альбомов, содержащих наименьшее количество треков.
select distinct name
from (
		select
			a.name,
			count(song_id) as amount_songs,
			rank() over(order by count(song_id) asc) as rnk
		from song s
		inner join album a on a.album_id = s.album_id
		group by a.name
)t
where rnk = 1;

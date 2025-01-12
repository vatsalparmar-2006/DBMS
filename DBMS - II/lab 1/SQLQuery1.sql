
---------- ALTER OPERATION ----------

					-----PART-A-----

--1. Retrieve a unique genre of songs.
	select distinct Genre from Songs

--2. Find top 2 albums released before 2010. 
	select top 2 Album_title from Albums
	where Release_year < 2010

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
	insert into Songs(Song_id,Song_title,Duration,Genre,Album_id) values(1245, 'Zaroor', 2.55, 'Feel good', 1005)
	
--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’ 
	update Songs
	set Song_title = 'Happy'
	where Song_title = 'Zaroor'

--5. Delete an Artist ‘Ed Sheeran’ 
	delete from Artists
	where Artist_name = 'Ed Sheeran'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)] 
	alter table Songs
	add Rating decimal(3,2)

--7. Retrieve songs whose title starts with 'S'. 
	select Song_title from Songs
	where Song_title like 'S%'

--8. Retrieve all songs whose title contains 'Everybody'.
	select Song_title from Songs
	where Song_title like '%Everybody%'

--9. Display Artist Name in Uppercase.
	select upper(Artist_name) as Artists from Artists

--10. Find the Square Root of the Duration of a Song ‘Good Luck’ 
	select sqrt(Duration) as sqrtOfDuration from Songs
	where Song_title = 'Good Luck'

--11. Find Current Date. 
	select GETDATE() as CurrentDate

--12. Find the number of albums for each artist.
	select Artist_name,count(Album_id) as NumberOfAlbums from Albums alb
	full outer join Artists art
	on alb.Artist_id = art.Artist_id
	group by Artist_name

--13. Retrieve the Album_id which has more than 5 songs in it. 
	select a.Album_id from Albums a
	join Songs s
	on a.Album_id = s.Album_id
	group by a.Album_id
	having COUNT(Song_id) > 5
	
--14. Retrieve all songs from the album 'Album1'. (using Subquery)
	select Song_title from Songs
	where Album_id IN (select Album_id from Albums
					   where Album_title = 'Album1')

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery) 
	select Album_title from Albums
	where Artist_id IN (select Artist_id from Artists
						where Artist_name = 'Aparshakti Khurana')

--16. Retrieve all the song titles with its album title.
	select Song_title,Album_title from Songs s
	join Albums a 
	on s.Album_id = a.Album_id

--17. Find all the songs which are released in 2020.
	select Song_title from Songs s
	join Albums a
	on s.Album_id = a.Album_id
	where Release_year = '2020'

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
	create view Fav_Songs
	as select Song_title,Song_id
	from Songs
	where Song_id between 101 and 105

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
	 update Fav_Songs
	 set Song_title = 'Jannat'
	 from Fav_Songs
	 where Song_id = 101

--20. Find all artists who have released an album in 2020. 
	select Artist_name from Artists art
	join Albums alb
	on art.Artist_id = alb.Artist_id
	where Release_year = '2020'

--21. Retrieve all songs by Shreya Ghoshal and order them by duration. 
	select Song_title as SongsByShreyaGhoshal from Songs s
	join Albums alb
	on s.Album_id = alb.Album_id
	join Artists art
	on alb.Artist_id = art.Artist_id
	where art.Artist_id = 3
	order by Duration



					-----PART-B-----

--22. Retrieve all song titles by artists who have more than one album.
	select Song_title from Songs s
	join Albums alb
	on s.Album_id = alb.Album_id
	join Artists art
	on art.Artist_id = alb.Artist_id
	where art.Artist_id IN (select Artist_id from Albums
							group by Artist_id
							having COUNT(Album_id) > 1)

--23. Retrieve all albums along with the total number of songs.
	select Album_title,count(Song_id) as TotalNumberOfSongs from Albums a
	join Songs s
	on a.Album_id = s.Album_id
	group by Album_title

--24. Retrieve all songs and release year and sort them by release year.
	select Song_title,Release_year from Songs s
	join Albums a
	on s.Album_id = a.Album_id
	order by Release_year

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
	select Genre,COUNT(Song_id) as Totalsongs from Songs
	group by Genre
	having COUNT(Song_id) > 2
	-----Also use count(*), it will counts numbers of rows with contains null values-----
 
--26. List all artists who have albums that contain more than 3 songs.
	select distinct Artist_name from Artists art 
	join Albums alb
	on art.Artist_id = alb.Artist_id
	join Songs s
	on s.Album_id = alb.Album_id
	group by Artist_name
	having COUNT(Song_id) > 3

	--where alb.Album_id IN (select Album_id from Songs
	--					    group by Album_id
	--					    having COUNT(Song_id) > 3)




					-----PART-C-----

--27. Retrieve albums that have been released in the same year as 'Album4'.
	select Album_title from Albums 
	where Release_year IN (select Release_year from Albums
						   where Album_title = 'Album4')

--28. Find the longest song in each genre
	select Song_title,max(Duration) as LongestSongOfGenre from Songs 
	where Duration IN (select max(Duration) from Songs
					   group by Genre)
	group by Song_title

--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
	select Song_title from Songs s
	join Albums a
	on s.Album_id = a.Album_id
	where Album_title like '%Album%'

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.
	select Artist_name,sum(Duration) as TotalDuration from Artists art
	join Albums alb
	on art.Artist_id = alb.Artist_id
	join Songs s
	on s.Album_id = alb.Album_id
	group by Artist_name
	having sum(Duration) > 15
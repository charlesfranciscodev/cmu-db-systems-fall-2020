/* Count the number of distinct names in artist_alias for each artist in the artist table,
and list only the top ten who's from the United Kingdom and started after 1950 (not included).
Print the artist name in the artist table and the number of corresponding dubbed artist names. */

-- There are no duplicates in the "artist_alias" table, so there is no need to filter for that.
SELECT artist.name, COUNT(artist.name) AS count_artist_name
FROM artist
JOIN artist_alias ON artist.id = artist_alias.artist
JOIN area ON artist.area = area.id
GROUP BY artist.name
HAVING artist.begin_date_year > 1950 AND area.name = 'United Kingdom'
ORDER BY count_artist_name DESC
LIMIT 10;

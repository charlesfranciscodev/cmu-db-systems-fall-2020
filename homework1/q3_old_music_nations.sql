/* List top 10 countries with the most classical music artists
(born or started before 1850) along with the number of associated artists.
Details: Print country and number of associated arists before 1850.
For example, Russia|191. Sort by number of artists in descending order. */
SELECT area.name, COUNT(area.name) AS nb_artists
FROM area
JOIN artist ON area.id = artist.area
WHERE artist.begin_date_year < 1850
GROUP by area.name
ORDER BY nb_artists DESC
LIMIT 10;

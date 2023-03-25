/* Concat all dubbed names of The Beatles using comma-separated values.
Details: Find all dubbed names of artist "The Beatles" in artist_alias and order them by id (ascending).
Print a single string containing all the dubbed names separated by commas. */
SELECT GROUP_CONCAT(around_the_world.name)
FROM (
  SELECT artist_alias.name
  FROM artist_alias
  WHERE artist = (
    SELECT artist.id
    FROM artist
    WHERE artist.name = 'The Beatles'
  )
  ORDER BY artist_alias.id
) AS around_the_world;

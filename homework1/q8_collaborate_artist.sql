/* List the number of artists who have collaborated with Ariana Grande.
Details: Print only the total number of artists.
An artist is considered a collaborator if they appear in the same artist_credit with Ariana Grande.
The answer should include Ariana Grande herself. */

SELECT COUNT(DISTINCT artist_credit_name.artist)
FROM artist_credit_name
WHERE artist_credit_name.artist_credit IN
(
  -- Find all "artist_credit" entries for Ariana Grande.
  SELECT artist_credit.id
  FROM artist_credit
  JOIN artist_credit_name ON artist_credit.id = artist_credit_name.artist_credit
  JOIN artist ON artist_credit_name.artist = artist.id
  WHERE artist.name = 'Ariana Grande'
)
;

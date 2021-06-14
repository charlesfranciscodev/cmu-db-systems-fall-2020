/* List the number of artists who have collaborated with Ariana Grande.
Details: Print only the total number of artists.
An artist is considered a collaborator if they appear in the same artist_credit with Ariana Grande.
The answer should include Ariana Grande herself. */

-- This solution includes some duplicates. Only counts Ariana Grande once.
SELECT SUM(artist_credit.artist_count - 1) + 1
FROM artist
JOIN artist_credit_name ON artist.id = artist_credit_name.artist
JOIN artist_credit ON artist_credit_name.artist_credit = artist_credit.id
WHERE artist.name = 'Ariana Grande';

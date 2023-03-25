/* List the distinct names of releases issued in vinyl format by the British band Coldplay.
Details: Vinyl format includes ALL vinyl dimensions excluding VinylDisc.
Sort the release names by release date ascendingly. */
SELECT DISTINCT release.name
FROM artist
JOIN artist_credit_name ON artist.id = artist_credit_name.artist
JOIN artist_credit ON artist_credit_name.artist_credit = artist_credit.id
JOIN release ON artist_credit.id = release.artist_credit
JOIN medium ON release.id = medium.release
JOIN medium_format ON medium.format = medium_format.id
JOIN release_info ON release.id = release_info.release
WHERE artist.name = 'Coldplay' AND medium_format.name LIKE '%Vinyl'
ORDER BY release_info.date_year, release_info.date_month, release_info.date_day;

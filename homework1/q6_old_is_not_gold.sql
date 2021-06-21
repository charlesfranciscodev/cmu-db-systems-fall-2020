/* List the number of official releases in every decade since 1900.
Print all decades and the number of official releases.
Releases with different issue dates or countries are considered different releases.
Print the relevant decade in a fancier format by constructing a string that looks like this: 1970s.
Sort the decades in decreasing order with respect to the number of official releases
and use decade (descending) as tie-breaker. Remember to exclude releases whose dates are NULL. */
SELECT CAST(decade AS TEXT) || 's', COUNT(decade) FROM (
  SELECT (date_year / 10) * 10 AS decade
  FROM release_info
  GROUP BY release, area, date_year
  HAVING date_year IS NOT NULL AND date_year >= 1900
)
GROUP BY decade
ORDER BY COUNT(decade) DESC, decade DESC;

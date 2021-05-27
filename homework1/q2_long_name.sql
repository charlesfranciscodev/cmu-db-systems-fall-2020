/* List works with longest name of each type.
Details: For each work type, find works that have the longest names.
There might be cases where there is a tie for the longest names - in that case, return all of them.
Display work names and corresponding type names,
and order it according to work type (ascending) and use work name (ascending) as tie-breaker. */
SELECT work.name, work_type.name
FROM work
JOIN work_type ON work.type = work_type.id
JOIN (
  SELECT work.type, MAX(LENGTH(work.name)) AS length_name
  FROM work
  JOIN work_type ON work.type = work_type.id -- filter rows with inexisting type
  GROUP BY work.type
) my_alias
ON work.type = my_alias.type AND LENGTH(work.name) = my_alias.length_name
ORDER BY work_type.name, work.name;

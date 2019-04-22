require 'pg'
require 'pry'

# Query a list of CITY names from STATION with even ID numbers only. You may print the results in any order,
# but must exclude duplicates from your answer.
SELECT DISTINCT city
FROM station
WHERE MOD(Id,2) = 0
ORDER BY city;

# Let  be the number of CITY entries in STATION, and let  be the number of distinct CITY names in STATION; query the value of  from STATION.
# In other words, find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT COUNT(city) - COUNT(DISTINCT city) FROM station;

# Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
# If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
SELECT city, LENGTH(city) AS len FROM station
ORDER BY len ASC, city
LIMIT 1;

# Query the list of city names starting with vowels (i.e., a, e, i, o, or u) from station.
# Your result cannot contain duplicates.
SELECT DISTINCT city FROM station
WHERE city RLIKE '^[aeiouAEIOU]';

# Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM   station
WHERE  city RLIKE '.*[aeiouAEIOU]$'

# Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM   station
WHERE  city RLIKE '^[aeiouAEIOU].*[aeiouAEIOU]$'

# Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city FROM station
WHERE city NOT RLIKE '^[aeiouAEIOU]';


# Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM   station
WHERE  city NOT RLIKE '.*[aeiouAEIOU]$'

# Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT city
FROM   station
WHERE  city NOT RLIKE '^[aeiouAEIOU].*[aeiouAEIOU]$'
SELECT DISTINCT city FROM station
WHERE city regexp '^[^aeiouAEIOU].*[^aeiouAEIOU]$';

# Query the Name of any student in STUDENTS who scored higher than 75 Marks.
# Order your output by the last three characters of each name.
# If two or more students both have names ending in the same last three
# characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT name FROM students
WHERE marks > 75
ORDER BY RIGHT(name, 3), ID ASC;

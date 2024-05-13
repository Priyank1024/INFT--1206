--INFT1105
--PRIYANK PAWAR
--100949832
--IN CLASS 10

/* Q1
write a SELECT statement to find all players whose first name starts with an C and ends with an S */

SELECT p.firstname, t.TeamName, p.lastname
FROM Players p
LEFT OUTER JOIN Rosters r ON p.PlayerID = r.PlayerID
LEFT OUTER JOIN Teams t ON r.TeamID = t.TeamID
WHERE p.firstName LIKE 'C%s'
ORDER BY p.firstname;

/* Q2
A player nameed chris Gomes has decided that he would like to use his orginal name of christopher and wishes to change his name in the database!*/
UPDATE players
set firstname = 'christopher'
where playerid = 2184300




select * from players
where playerid = 2184300

/* Q3
write the SQL to display the current league scoring leaders (first and last names ) by adding up all the goals they havbe scored.
- only show the first 15 records
- only show records if the players have scored more than 4 goals 
- sort the data from most goals to least*/
SELECT TOP 15 p. firstname, p.lastname, SUM(gs. numgoals) AS Total_Goals
FROM players p
INNER JOIN goalScorers gs ON p. playerid = gs.playerid
GROUP BY p.playerid, p. firstname, p.lastname
HAVING SUM(gs.numgoals) >
4 ORDER BY total_Goals DESC;
 




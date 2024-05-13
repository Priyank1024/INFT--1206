--Priyank Pawar 100949832
--date - 08-03-2024
--In class assigment


--Question 1
SELECT d.divname, t.teamname
FROM divs d
JOIN teamsInDivs td ON d.divid = td.divid
JOIN teams t ON td.teamid = t.teamid;

--question 2
SELECT d.divname, t.teamname
FROM divs d
 left outer JOIN teamsInDivs td ON d.divid = td.divid
left outer JOIN teams t ON td.teamid = t.teamid;

--question 3
DECLARE @targetMonth INT;
SET @targetMonth = 4;

SELECT a.gameid, a.gamenum, a.gamedatetime, t1.teamname AS hometeam, t2.teamname AS visitteam, l.locationname
FROM games a
JOIN teams t1 ON a.hometeam = t1.teamid
JOIN teams t2 ON a.visitteam = t2.teamid
JOIN locations l ON a.locationid = l.locationid
WHERE MONTH(a.gamedatetime) = 4
ORDER BY a.gamedatetime;
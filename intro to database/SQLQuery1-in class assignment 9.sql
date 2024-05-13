--*************************
--name - priyank pawar
--id = 100949832
--in-class Excerise 9
--april , 2024
--************************
/* Using Sportleague database!*/

/*Q1 Create a function that receives an input parameter of a teamID . The fucntion then returns the next game to be played by that team.*/
go
Create or alter FUNCTION dbo.fncReturngamenumber
        (@teamid INT)
		returns INT
		as 
		Begin
		Declare @gameID INT

		Select @gameID = (select top 1 gameid
		       from games
			   where (@teamid = hometeam or @teamid = visitteam) and gamedatetime > GetDATE())
         return @gameID
		 end
		 go
		 select dbo.fncReturngamenumber(222) As nextgame;

/* using the above function create an SQL Select statment that outouts the game details - including gamename , date,location name , and the name of both teams!*/
DECLARE @teamID INT = 222;

SELECT 
    g.gameNum,
    g.gamedatetime,
    l.locationName,
    h.teamName AS HomeTeamName,
    v.teamName AS VisitTeamName
FROM 
    Games g
JOIN 
    Locations l ON g.locationID = l.locationID
JOIN 
    Teams h ON g.hometeam = h.teamID
JOIN 
    Teams v ON g.visitteam = v.teamID
WHERE 
    g.gameID = dbo.fncReturngamenumber(@teamID);

/* create a stored procedure that receives a team ID, and outputs the teams next game details as provided in the pevious question . you should use the fucntion created above in the SP to determine the gameID.*/
GO
CREATE OR ALTER PROCEDURE spGetNextGameID @teamID INT AS
BEGIN
SELECT 
    g.gameNum,
    g.gamedatetime,
    l.locationName,
    h.teamName AS HomeTeamName,
    v.teamName AS VisitTeamName
FROM 
    Games g
JOIN 
    Locations l ON g.locationID = l.locationID
JOIN 
    Teams h ON g.hometeam = h.teamID
JOIN 
    Teams v ON g.visitteam = v.teamID
WHERE 
    g.gameID = dbo.fncReturngamenumber(@teamID);
END;
    

DECLARE @localTeamID INT = 222;
EXEC dbo.spGetNextGameID @localTeamID;
GO









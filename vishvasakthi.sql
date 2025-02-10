create database sport;
use sport;

-- TEAM TABLE
CREATE TABLE Teams (
    team_id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(100) NOT NULL,
    coach_name VARCHAR(100),
    founded_year INT,
    home_ground VARCHAR(100)
);

INSERT INTO Teams (team_name, coach_name, founded_year, home_ground) VALUES
('Red Warriors', 'John Smith',2001, 'National Stadium'),
('yellow warriors', 'anildiya',2000, 'National Stadium'),
('white warriors', 'jeffery',1999, 'National Stadium');

SELECT * FROM TEAMS;

-- PLAYERS TABLE
CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(100) NOT NULL,
    age INT,
    position VARCHAR(50),
    team_id INT,
    nationality VARCHAR(50),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id) ON DELETE CASCADE
);
INSERT INTO Players (player_name, age, position, team_id, nationality) 
VALUES ('Johnson', 25, 'Striker',1, 'USA'),
('williams', 25, 'defenceman',2, 'india'),
('kevin marx', 25, 'forward',3, 'germany');




-- MATCH TABLE
CREATE TABLE Matches (
    match_id INT PRIMARY KEY AUTO_INCREMENT,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    venue VARCHAR(100),
    result VARCHAR(50),
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);
INSERT INTO Matches(home_team_id,away_team_id, match_date,venue,result) VALUES 
(1,2,'2025-02-07','National Stadium','2-1'),
(2,3,'2025-02-08','National Stadium','2-1');

SELECT * FROM MATCHES;

CREATE TABLE Scores (
    score_id INT PRIMARY KEY AUTO_INCREMENT,
    match_id INT,
    home_team_score INT NOT NULL,
    away_team_score INT NOT NULL,
    winner_team_id INT, -- Foreign Key for the winning team
    FOREIGN KEY (match_id) REFERENCES Matches(match_id) ON DELETE CASCADE,
    FOREIGN KEY (winner_team_id) REFERENCES Teams(team_id) ON DELETE CASCADE
);

INSERT INTO Scores (match_id,home_team_score,away_team_score, winner_team_id)
VALUES (1, 3, 2, null);

SELECT * FROM SCORES;

SELECT * FROM TEAMS;
SELECT * FROM PLAYERS;
SELECT * FROM MATCHES;
SELECT * FROM SCORES;

INSERT INTO Scores (match_id,home_team_score,away_team_score, winner_team_id)
VALUES (1, 3, 2,1);

DELIMITER //
CREATE PROCEDURE AddPlayer(
    IN player_name VARCHAR(100),
    IN team_id INT,
    IN position VARCHAR(50),
    IN age INT
)
BEGIN
    INSERT INTO Players (PlayerName, TeamID, Position, Age)
    VALUES ('williams',2,'defanceman',25);
END //
DELIMITER //  






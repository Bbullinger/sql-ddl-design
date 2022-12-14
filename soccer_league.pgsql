DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    teamname TEXT NOT NULL,
    rank INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams,
    team2 INTEGER REFERENCES teams
);

CREATE TABLE goals (
    match_id INTEGER REFERENCES matches,
    player INTEGER REFERENCES players
);

CREATE TABLE match_refs (
    match_id INTEGER REFERENCES matches,
    ref_name TEXT NOT NULL
);



INSERT INTO teams (teamname, rank)
VALUES
('Ball kickers', 1),('Goal makers',2),('Injury fakers',3);

INSERT INTO players (player_name, team_id)
VALUES 
('Gronk',1),('Lebron',2),('Ryan Reynolds',3);

INSERT INTO matches (team1, team2)
VALUES
(1,2),(2,1),(3,2),(1,3),(2,3);

INSERT INTO goals (match_id, player)
VALUES
(1,2),(2,3),(3,3),(2,2),(3,2),(1,1),(1,1);

INSERT INTO match_refs (match_id, ref_name)
VALUES 
(1,'Ronnie'),(2,'Donnie'),(3,'Bonnie');
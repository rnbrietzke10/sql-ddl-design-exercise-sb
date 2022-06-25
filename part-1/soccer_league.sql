DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    preseason_start_date DATE,
    preseason_end_date DATE,
    season_start_date DATE,
    season_end_date DATE,
    post_season_start_date DATE,
    post_season_end_date DATE
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    home_team INTEGER REFERENCES teams NOT NULL,
    visiting_team INTEGER REFERENCES teams NOT NULL,
    home_score INTEGER,
    vistors_score INTEGER,
    game_date DATE,
    season_id INTEGER REFERENCES seasons
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthday DATE,
    player_number INTEGER
);

CREATE TABLE teams_players
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    player_id INTEGER REFERENCES players
);

CREATE TABLE players_score_per_game
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches,
    goals_scored INTEGER
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    organization VARCHAR(100)
);
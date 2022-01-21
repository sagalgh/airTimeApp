DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS airports CASCADE;
DROP TABLE IF EXISTS flights CASCADE;
DROP TABLE IF EXISTS messages CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  username VARCHAR(255)
)

CREATE TABLE airports (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  latitude DECIMAL NOT NULL,
  longitude DECIMAL NOT NULL
)

CREATE TABLE flights (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  time TIMESTAMP,
  destination INTEGER REFERENCES airports(id) ON DELETE CASCADE,
  origin INTEGER REFERENCES airports(id) ON DELETE CASCADE
)

-- CREATE TABLE messages (
--   id SERIAL PRIMARY KEY NOT NULL,
--   messages VARCHAR(255) NOT NULL,
--   time TIMESTAMP,
--   user_id INTEGER REFERENCES user(id) ON DELETE CASCADE,
--   flight_id INTEGER REFERENCES flight(id) ON DELETE CASCADE
-- )

-- CREATE TABLE chat_rooms(
--   id SERIAL PRIMARY KEY NOT NULL,
-- )

CREATE TABLE favorited_chats(
  id SERIAL PRIMARY KEY NOT NULL,
  room_id INTEGER NOT NULL,
  user_id VARCHAR NOT NULL,
  text VARCHAR(255) NOT NULL
)

CREATE TABLE favorited_chats_categories (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL
);
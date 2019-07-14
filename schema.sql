DROP TABLE IF EXISTS weathers;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS locations;

-- this.search_query = locationName;
-- this.formatted_query = result.body.results[0].formatted_address;
-- this.latitude = result.body.results[0].geometry.location.lat;
-- this.longitude = result.body.results[0].geometry.location.lng;

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  search_query VARCHAR(255),
  formatted_query VARCHAR(255),
  latitude NUMERIC(10, 7),
  longitude NUMERIC(10,7)
);

CREATE TABLE weathers ( 
    id SERIAL PRIMARY KEY, 
    forecast VARCHAR(255), 
    time VARCHAR(255), 
    created_at BIGINT,
    location_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations (id)
  );

  CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  link VARCHAR,
  name VARCHAR(255),
  event_date DATE,
  summary VARCHAR(255),
  location_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations (id)
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  overview VARCHAR(255),
  average_votes NUMERIC(10, 1),
  total_votes INTEGER,
  image_url VARCHAR(255),
  popularity NUMERIC(10, 7),
  released_on DATE,
  location_id INTEGER NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locations (id)
);

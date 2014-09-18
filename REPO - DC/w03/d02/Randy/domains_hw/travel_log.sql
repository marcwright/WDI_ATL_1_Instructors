CREATE TABLE trips(
id serial PRIMARY KEY,
start_date VARCHAR(8) NOT NULL,
end_date VARCHAR(8) NOT NULL,
start_location VARCHAR(42) NOT NULL,
end_location VARCHAR(42) NOT NULL
);

CREATE TABLE entries(
id serial PRIMARY KEY,
tag VARCHAR(42) NOT NULL,
description TEXT NOT NULL,
entry_date VARCHAR(8) NOT NULL,
trip_id REFERENCE trips(id) NOT NULL
);

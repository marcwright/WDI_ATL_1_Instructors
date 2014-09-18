/*
* @Author: stephenstanwood
* @Date:   2014-05-12 15:43:56
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-05-12 15:45:24
*/

DROP TABLE IF EXISTS coasters;
CREATE TABLE coasters(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  min_height INTEGER NOT NULL,
  top_speed INTEGER NOT NULL,
  image_url TEXT NOT NULL
);

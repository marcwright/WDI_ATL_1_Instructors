/*
* @Author: stephenstanwood
* @Date:   2014-05-12 13:44:32
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-05-12 13:46:45
*/

DROP TABLE IF EXISTS clowns;
CREATE TABLE clowns (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  talent VARCHAR(100) NOT NULL,
  is_creepy BOOLEAN DEFAULT false NOT NULL,
  image_url VARCHAR(300) NOT NULL
);

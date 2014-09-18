/*
* @Author: stephenstanwood
* @Date:   2014-05-12 15:43:56
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-05-12 18:58:46
*/

DROP TABLE IF EXISTS koopas;
CREATE TABLE koopas(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL,
  has_shell BOOLEAN DEFAULT TRUE,
  image_url TEXT NOT NULL
);

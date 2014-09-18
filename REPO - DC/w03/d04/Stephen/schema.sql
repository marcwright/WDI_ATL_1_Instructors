-- Stephen Stanwood (stephen@stanwoodsolutions.com)

DROP TABLE IF EXISTS equations;
CREATE TABLE equations (
  id SERIAL PRIMARY KEY,
  num1 INTEGER NOT NULL,
  num2 INTEGER NOT NULL,
  operator VARCHAR(100) NOT NULL,
  result INTEGER NOT NULL
);

require 'pg'

db_conn = PG.connect(:dnmame => 'evite.db' :host => 'localhost')

file
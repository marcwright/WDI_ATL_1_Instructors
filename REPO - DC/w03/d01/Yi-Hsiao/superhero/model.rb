require "pg"

class DBTable
  attr_reader :name, :fields

  def initialize(db_name = "superhero")
    @@db_conn ||= PG.connect(dbname: db_name)
    @table = ""
  end

  def self.add(key_val_pairs)
    # given a hash with keys and values, insert a single row into a db
    field_names = key_val_pairs.keys.join(",")
    field_values = key_val_pairs.values

    # creates postgres placeholders $1, $2, $3, etc, for the same number of values given
    value_placeholders = field_values.each_with_index.map { |value, index| "$#{ index + 1 }" }.join(", ")
    begin
      @@db_conn.exec_params("INSERT INTO #{ @table } (#{ field_names }) VALUES (#{ value_placeholders }) RETURNING id", field_values).values.flatten
    rescue PG::UniqueViolation => e
      # not enough time to do something more than just return nil when there's a unique constraint error
    end
  end

  def get_all(fields_arr, filters = "")
    # given any number of field names, return an array of all the data from the table
    select_statement = "SELECT #{ fields_arr.join(",") } FROM #{ @table }"
    select_statement += " WHERE #{ filters }" unless filters.empty?

    @@db_conn.exec(select_statement).values.flatten
  end

  def close
    @@db_conn.close
  end
end

class SuperHeroesData < DBTable
  def initialize(db_name = "superhero")
    super
    @table = "superheroes"
    @power_data = PowersTable.new(db_name)
    @hero_power_data = PowersSuperheroesTable.new(db_name)
  end

  def add(key_val_pairs)
    # if super hero powers are given, they are added to the 'powers' table
    # and a n:n relationship is created between the superhero and its powers
    if powers = key_val_pairs.delete(:powers) && hero_id = super
      create_hero_power_rel(hero_id[0], powers)
    else
      super
    end
  end

  private
  def create_hero_power_rel(hero_id, powers)
    power_ids = powers.map { |power_name| @power_data.add({ power: power_name }) }.flatten  # list of IDs from newly created powers
    power_ids.each { |power_id| @hero_power_data.add({ power_id: power_id, superhero_id: hero_id }) }
  end
end

class PowersTable < DBTable
  def initialize(db_name = "superhero")
    super
    @table = "powers"
  end
end

class PowersSuperheroesTable < DBTable
  def initialize(db_name = "superhero")
    super
    @table = "powers_superheroes"
  end
end

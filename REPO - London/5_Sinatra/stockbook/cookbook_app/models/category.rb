class Category < DBBase

  attributes name: :string

  def self.table_name
    :categories
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
  end

  def recipes
    return @recipes if @recipes
    results = run_sql("select * from recipes where category_id = #{id}")
    @recipes = results.map { |result| Recipe.new(result) }
  end


end


class Recipe < DBBase

  attributes name: :string,
              description: :text,
              category_id: :integer

  def self.table_name
    :recipes
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
    @description = params['description']
    @category_id = params['category_id']
  end

  def category
    @category ||= Category.find(category_id)
  end

  def ingredients
    return @ingredients if @ingredients
    results = run_sql("select * from ingredients where recipe_id = #{id}")
    @ingredients = results.map { |result| Ingredient.new(result) }
  end


end


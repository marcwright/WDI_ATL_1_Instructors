class Ingredient < DBBase

  attributes name: :string, quantity: :decimal, unit: :string, recipe_id: :integer

  def self.table_name
    :ingredients
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
    @quantity = params['quantity']
    @unit = params['unit']
    @recipe_id = params['recipe_id']
  end

  def recipe
    @recipe ||= Recipe.find(recipe_id)
  end

end


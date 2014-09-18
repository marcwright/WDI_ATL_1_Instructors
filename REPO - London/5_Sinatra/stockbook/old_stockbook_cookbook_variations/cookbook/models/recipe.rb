class Recipe
  attr_accessor :name, :category_id, :description, :instructions, :published_on, :ingredients, :category, :id

  def initialize(params)
    @id = params.fetch('id')
    @category_id = params['category_id']
    @description = params['description']
    @instructions = params['instructions']
    @published_on = params['published_on']
    @name = params.fetch('name')
    @ingredients = []
  end

end

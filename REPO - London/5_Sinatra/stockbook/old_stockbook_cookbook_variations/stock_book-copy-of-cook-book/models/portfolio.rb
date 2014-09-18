class Portfolio < DBBase
  attributes name: :string, category_id: :integer, description: :text, instructions: :text, published_on: :date

  def self.table_name
    :portfolios
  end

  def initialize(params={})
    @id = params['id']
    @category_id = params['category_id']
    @category = Category.find(category_id)
    @description = params['description']
    @instructions = params['instructions']
    @published_on = params['published_on']
    @name = params['name']
    @ingredients = []
  end

end

class Category < DBBase
  attributes name: :string

  def self.table_name
    :categories
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
  end

  def destroy
    super
    run_sql("update portfolios set category_id = null where category_id = #{id}")
  end

end

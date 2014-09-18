module RecipesHelper

include ActsAsTaggableOn::TagsHelper

def total_cost(recipe)
  prices = recipe.ingredients.map(&:cost)
  dollar_total = prices.sum.round(2)

  pound_total = (dollar_total / 1.49).round(2)



  "#{number_to_currency(dollar_total)} or #{number_to_currency(pound_total, unit: '£')}"

 end





  
end

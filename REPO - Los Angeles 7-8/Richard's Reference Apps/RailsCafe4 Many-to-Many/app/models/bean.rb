  class Bean
    include Mongoid::Document
    field :name, type: String
    field :roast, type: String
    field :origin, type: String
    field :quantity, type: Float

    has_many :pairings
    #  has_many :pastries

    def pastries
      Pastry.find pastry_ids
    end
    #accepts_nested_attributes_for :pastries

    def pastry_ids
      pastry_ids_array = []
      self.pairings.each do |one_pairing|
        if one_pairing.pastry_id
          pastry_ids_array.push one_pairing.pastry_id
        end 
      end
      pastry_ids_array 
    end

    def pastry_ids=(list)
      self.pairings.destroy
      list.each do |pastry_id|
        self.pairings.create(pastry_id: pastry_id)
      end
    end

    # some way of showing a list
    def pastry_list
      pastries_string = ""
      pastries.each do |one_pastry|
        pastries_string += ", " + one_pastry.name
      end
      pastries_string.slice(2,pastries_string.length - 1)
      pastries_string
    end

  end






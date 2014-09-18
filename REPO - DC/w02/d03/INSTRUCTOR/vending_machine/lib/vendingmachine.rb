class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases
  
  def initialize(inventory=[])
    @status = ''
    @code = ''
    @credit = 0
    @change = 0
    @purchases = []
    @inventory = inventory
  end

  # Go...!

end
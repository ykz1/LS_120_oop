class InvoiceEntry
  attr_reader :quantity, :product_name
  attr_writer :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

puts "There's no getter method for quantity"

check = InvoiceEntry.new('hmm', 2)
check.update_quantity(3)
puts check.quantity

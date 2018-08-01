class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

puts 'Alyssa is right because @ would be needed if Ben were referring to the instance variable directly'
puts 'Ben is more right because what he did is both valid and standard practice; he is calling the balance getter method instead of directly accessing the instance variable'

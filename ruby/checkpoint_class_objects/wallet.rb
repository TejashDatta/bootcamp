class Wallet
  def initialize(initial_money = 0, cards = [])
    @money = initial_money
    @cards = cards
  end

  def deposit(amount)
    @money += amount
  end

  def withdraw(amount)
    @money -= amount
  end

  def add_card(card_name)
    @cards.push(card_name)
  end

  def remove_card(card_name)
    @cards.delete(card_name)
  end

  def to_s
    "Money: #{@money}, cards: #{@cards.join(', ')}"
  end
end

my_wallet = Wallet.new(200, ['Credit Card', 'ID Card'])
my_wallet.withdraw(20)
my_wallet.deposit(10)
my_wallet.add_card('Debit Card')
my_wallet.remove_card('ID Card')
puts my_wallet

mom_wallet = Wallet.new(4000, ['Shopping Card'])
puts mom_wallet

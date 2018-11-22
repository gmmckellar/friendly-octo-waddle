class Money
  attr_reader :currency

  def self.dollar(amount)
    new amount, "USD"
  end

  def self.franc(amount)
    new amount, "CHF"
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def times(multiplier)
    Money.new amount * multiplier, currency
  end

  def plus(addend)
    Money.new amount + addend.amount, currency
  end

  def ==(other)
    equals?(other)
  end

  protected

  attr_reader :amount

  private

  def equals?(other)
    currency == other.currency &&
      amount == other.amount
  end
end

class Bank
  def self.reduce(source, to)
    Money.dollar 10
  end
end

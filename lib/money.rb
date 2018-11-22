class Money
  attr_reader :currency, :amount

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
    Sum.new self, addend
  end

  def ==(other)
    equals?(other)
  end

  def reduce(_to)
    self
  end

  private

  def equals?(other)
    currency == other.currency &&
      amount == other.amount
  end
end

class Bank
  def self.reduce(source, to)
    source.reduce to
  end
end

class Sum
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(currency)
    amount = augend.amount + addend.amount
    Money.new amount, currency
  end
end

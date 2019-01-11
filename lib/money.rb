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

  def reduce(bank, to)
    rate = bank.rate(currency, to)
    Money.new amount / rate, to
  end

  private

  def equals?(other)
    currency == other.currency &&
      amount == other.amount
  end
end

class Bank
  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce self, to
  end

  def rate(from, to)
    @rates.fetch [from, to], 1
  end

  def add_rate(from, to, rate)
    @rates[[from, to]] = rate
  end
end

class Sum
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank, currency)
    amount = augend.reduce(bank, currency).amount +
             addend.reduce(bank, currency).amount
    Money.new amount, currency
  end

  def plus(addend)
    Sum.new(self, addend)
  end

  def times(multiplier)
    Sum.new(augend.times(multiplier), addend.times(multiplier))
  end
end

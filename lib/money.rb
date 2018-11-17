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

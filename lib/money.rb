class Money
  def self.dollar(amount)
    Dollar.new amount, "USD"
  end

  def self.franc(amount)
    Franc.new amount, "CHF"
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def currency
    @currency
  end

  def times(multiplier)
    Money.new amount * multiplier, currency
  end

  def ==(object)
    equals?(object)
  end

  protected

  def amount
    @amount
  end

  private

  def equals?(object)
    currency == object.currency &&
    amount == object.amount
  end
end

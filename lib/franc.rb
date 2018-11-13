class Franc
  def initialize(value)
    @amount = value
  end

  def times(multiplier)
    Franc.new amount * multiplier
  end

  def ==(object)
    equals?(object.amount)
  end

  def amount
    @amount
  end

  private

  def equals?(value)
    value == amount
  end
end

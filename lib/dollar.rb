class Dollar
  def initialize(value)
    @amount = value
  end

  def times(multiplier)
    Dollar.new amount * multiplier
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

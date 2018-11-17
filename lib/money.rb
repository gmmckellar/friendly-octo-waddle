class Money
  def initialize(value)
    @amount = value
  end

  def self.dollar(value)
    Dollar.new value
  end

  def self.franc(value)
    Franc.new(value)
  end

  def times(_); end

  def ==(object)
    equals?(object)
  end

  protected

  def amount
    @amount
  end

  private

  def equals?(object)
    object.is_a?(self.class) &&
    amount == object.amount
  end
end

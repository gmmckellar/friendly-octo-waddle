class Money
  def initialize(value)
    @amount = value
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
    amount == object.amount
  end
end

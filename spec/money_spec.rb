require "money"

describe Money do
  describe "multiplication" do
    subject { Money.dollar 5 }

    it "multiplies" do
      expect(subject.times(2)).to eq Money.dollar 10
      expect(subject.times(4)).to eq Money.dollar 20
    end
  end

  describe "equality" do
    subject { Money.dollar 5 }

    it "compares money" do
      expect(subject).to eq Money.dollar 5
      expect(subject).to_not eq Money.dollar 6
      expect(subject).to_not eq Money.franc 5
    end
  end

  describe "currency" do
    it "responds with abbreviation" do
      expect(Money.dollar(1).currency).to eq "USD"
      expect(Money.franc(1).currency).to eq "CHF"
    end
  end

  describe "addition" do
    let(:five) { Money.dollar 5 }
    subject { five.plus(five) }

    it "adds" do
      reduced = Bank.new.reduce subject, "USD"
      expect(reduced).to eq Money.dollar 10
    end

    it "returns a sum" do
      expect(subject.addend).to eq five
      expect(subject.augend).to eq five
    end
  end

  describe "Bank" do
    it "reduces a sum" do
      sum = Sum.new(Money.dollar(1), Money.dollar(2))
      expect(Bank.new.reduce(sum, "USD")).to eq Money.dollar 3
    end

    it "reduces money" do
      reduction = Bank.new.reduce Money.dollar(1), "USD"
      expect(reduction).to eq Money.dollar(1)
    end

    it "reduces money to different currency" do
      bank = Bank.new
      bank.add_rate("CHF", "USD", 2)
      reduction = bank.reduce(Money.franc(2), "USD")
      expect(reduction).to eq Money.dollar 1
    end
  end
end

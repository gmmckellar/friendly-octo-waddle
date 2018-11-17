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

    it "compares money objects" do
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
end

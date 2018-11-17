require "money"
require "dollar"
require "franc"

describe Money do

  describe "multiplication" do
    context "with dollars" do
      subject { Money.dollar 5 }

      it "multiplies" do
        expect(subject.times 2).to eq Money.dollar 10
        expect(subject.times 4).to eq Money.dollar 20
      end
    end

    context "with francs" do
      subject { Money.franc 5 }

      it "multiplies" do
        expect(subject.times 2).to eq Money.franc 10
        expect(subject.times 4).to eq Money.franc 20
      end
    end
  end

  describe "equality" do
    it "compares money objects" do
      expect(Money.dollar 5).to eq Money.dollar 5
      expect(Money.dollar 5).to_not eq Money.dollar 6
      expect(Money.franc 5).to eq Money.franc 5
      expect(Money.franc 5).to_not eq Money.franc 6
      expect(Money.franc 5).to_not eq Money.dollar 5
      expect(Money.new(5, "CHF")).to eq Franc.new(5, "CHF")
    end
  end

  describe "currency" do
    it "responds with abbreviation" do
      expect(Money.dollar(1).currency).to eq "USD"
      expect(Money.franc(1).currency).to eq "CHF"
    end
  end
end

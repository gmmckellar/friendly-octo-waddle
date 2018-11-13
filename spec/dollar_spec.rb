require "dollar"

describe Dollar do
  let(:five) { described_class.new 5 }

  describe "#times" do
    let(:multiplier) { 2 }
    subject { five.times multiplier }

    it "multiplies" do
      expect(subject).to eq Dollar.new 10
      expect(five.times(multiplier * 2)).to eq Dollar.new 20
    end
  end

  describe "#==" do
    subject { described_class.new(value) == five  }

    context "with an equal value" do
      let(:value) { 5 }

      it "is true" do
        expect(subject).to be true
      end
    end

    context "with a different value" do
      let(:value) { 1 }

      it "is false" do
        expect(subject).to be false
      end
    end
  end
end

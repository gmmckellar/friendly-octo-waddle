require "dollar"

describe Dollar do
  let(:fiver) { described_class.new 5 }

  describe "#times" do
    let(:multiplier) { 2 }
    subject { fiver.times multiplier }

    it "multiplies" do
      expect(subject).to eq Dollar.new 10
      expect(fiver.times(multiplier * 2)).to eq Dollar.new 20
    end
  end
end

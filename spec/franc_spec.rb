require "franc"

describe Franc do
  let(:deuce) { described_class.new 2 }

  describe "#times" do
    let(:multiplier) { 2 }
    subject { deuce.times multiplier }

    it "multiplies" do
      expect(subject).to eq Franc.new 4
      expect(deuce.times(multiplier * 2)).to eq Franc.new 8
    end
  end
end

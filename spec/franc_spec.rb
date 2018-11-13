require "franc"

describe Franc do
  let(:five) { described_class.new 5 }

  describe "#times" do
    let(:multiplier) { 2 }
    subject { five.times multiplier }

    it "multiplies" do
      expect(subject).to eq Franc.new 10
      expect(five.times(multiplier)).to eq Franc.new 10
    end

    it { is_expected.to_not eq five }
  end
end

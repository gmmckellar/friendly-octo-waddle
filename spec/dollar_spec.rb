require "dollar"

describe Dollar do
  let(:five) { described_class.new 5 }

  describe "#times" do
    let(:multiplier) { 2 }
    subject { five.times multiplier }

    it "multiplies" do
      expect(subject.amount).to eq 10
      expect(five.times(5).amount).to eq 25
    end

    it "does not mutate amount" do
      expect { subject }.to_not change five, :amount
    end
  end
end

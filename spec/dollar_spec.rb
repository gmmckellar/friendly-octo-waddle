require "dollar"

describe Dollar do
  let(:five) { described_class.new 5 }

  it "can multiply" do
    five.times 2

    expect(five.amount).to eq 10
  end
end

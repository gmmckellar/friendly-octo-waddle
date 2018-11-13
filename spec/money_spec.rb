describe Money do
  let(:five) { described_class.new 5 }

  describe "#==" do
    subject { described_class.new(value) == five }

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

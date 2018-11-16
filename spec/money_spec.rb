describe Money do
  describe "equality" do
    it "compares money objects" do
      expect(Dollar.new 5).to eq Dollar.new 5
      expect(Dollar.new 5).to_not eq Dollar.new 6
      expect(Franc.new 5).to eq Franc.new 5
      expect(Franc.new 5).to_not eq Franc.new 6
      expect(Franc.new 5).to_not eq Dollar.new 5
    end
  end
end

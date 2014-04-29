require './fakultaet'

[FakultaetWithForLoop, FakultaetWithEach, FakultaetWithRecursion].each do |type|
	
	describe type do
		it "returns 24 for n = 4" do
			type.new(4).fak.should be_a_kind_of(Integer)
			type.new(4).fak.should eq(24)
		end
		it "returns 120 for n = 5" do
			type.new(5).fak.should eq(120)
		end
		it "returns 1 for n = 0" do
			type.new(0).fak.should eq(1)
		end
	end

end
require 'benchmark'

class AbstractFakultaet

	def initialize(n)
		@n = n
	end

	# def n
	# 	@n
	# end

	attr_reader :n

end

class FakultaetWithForLoop < AbstractFakultaet

	def fak
		result = 1
		for i in 1..n
			result = i * result
		end
		result
	end

end

class FakultaetWithEach < AbstractFakultaet

	def fak
		result = 1
		(1..n).each do |i|
			result = i * result
		end
		result
	end

end

class FakultaetWithRecursion < AbstractFakultaet

	def fak(n = self.n)
		if n <= 0
			1
		else
			fak(n-1) * n
		end
	end

end

[FakultaetWithForLoop, FakultaetWithEach, FakultaetWithRecursion].each do |type|
	nmax = 80
	fakultaet = type.new(nmax)
	measure = Benchmark.measure do
		10000.times { fakultaet.fak }
	end
	puts "#{type.name}.fak(#{nmax}): #{measure}"
end

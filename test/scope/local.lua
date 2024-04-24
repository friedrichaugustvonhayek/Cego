function foo()
	table = {1,2,3,4}
	return {
		test = function(self)
			print(table[3])
		end
	}
end

function bar()
	return {
	fejofj = asdf:test()
	}
end
asdf = foo()
--asdf:test()
bar()

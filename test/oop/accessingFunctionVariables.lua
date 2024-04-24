function foo()
	accessMe = {2,3,4,5,6,7}
	return {
		numberOfElements = function()
			return #accessMe
		end
	}
end

bar = foo()
print(bar.numberOfElements())

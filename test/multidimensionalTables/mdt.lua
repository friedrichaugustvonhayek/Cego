function point(x, y)
	return {
		x = x,
		y = y
	}
end


points = {{}}
points[1][1] = point(3,4)
print(points[1][1].x)

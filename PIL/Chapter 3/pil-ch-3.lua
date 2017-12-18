local tolerance = 10
function isturnback( angle )
  angle = angle % 360
  return (math.abs( angle - 180 ) < tolerance)
end

print(isturnback(-180)) -- true

function cond2int( x )
  return math.tointeger(x) or x
end

print(cond2int(3.01)) -- 3.01
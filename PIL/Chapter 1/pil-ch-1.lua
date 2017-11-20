-- hello world
print("hello world")

-- define a factorial function
function fact (n)
    if n == 0 then
        return 1
    else
        return n * fact(n - 1)
    end
end

print("enter a number:")
a = io.read("*n")   -- reads a number
print(fact(a))

-- lib1.lua
function norm( x, y )
    return math.sqrt(x^2 + y^2)
end

function twice( x )
    return 2.0 * x
end

-- types and values
type(nil)
type(true)
type(10.4 * 3)
type("Hello world.")
type(io.stdin)
type(print)
type({})
type(type(X))

-- booleans
--[[
4 and 5
nil and 13
false and 13
0 or 5
false or "hi"
nil or false
--]]
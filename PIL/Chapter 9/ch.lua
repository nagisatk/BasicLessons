foo = function(x) return 2*x end

-- print(foo(10))

function derivative (f, delta)
    delta = delta or 1e-4
    return  function (x)
                return (f(x + delta) - f(x))/delta
            end
end

print(derivative(math.sin)(1), math.cos(1))
print(derivative(math.cos)(1), -math.sin(1))
--[[
local fact = function (x)
    if x == 0 then return 1 end
    return x * fact(x - 1)      -- buggy, the `fact` will try to call the global
                                -- `fact`, but the global `fact` is nil
end
--]]
local fact
fact =  function (x)
    if x == 0 then return 1 end
    return x * fact(x - 1)  -- this `fact` will try to call the local `fact`
end

print(fact(12))

local function foo(params) return nil end
-- is expanded to
local foo; foo = function(params) return nil end

-- lexical scoping
names = { 'Peter', 'Paul', 'Mary' }
grades = { Mary = 10, Paul = 7, Peter = 8 }
table.sort( names, function (n1, n2)
    return grades[n1] > grades[n2]  -- compare the grades
end )

for _, name in ipairs(names) do
    print(name)
end
-- Mary Peter Paul

function sortbygrades(names, grades)
    table.sort(names, function (n1, n2)
        return grades[n1] > grades[n2]  -- `grades`: non-local variable aka upvalues
    end)
end

function newCounter()
    local count = 0
    return function ()  -- anonymous function
        count = count + 1
        return count
    end
end

c1 = newCounter()
print(c1()) --> 1
print(c1()) --> 2

c2 = newCounter()
print(c2()) --> 1

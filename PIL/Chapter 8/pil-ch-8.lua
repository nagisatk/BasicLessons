x = 10              -- global
local i = 1         -- local to then chunk

while i <= x do
    local x = i * 2 -- local to the `while` body
    print(x)        --> 2, 4, 6, 8, ...
    i = i + 1
end

-- i = 21

if i > 20 then
    local x         -- local to the `then` body
    x = 20
    print(x + 2)    -- (would print 22 if test succeeded)
else
    print(x)        -- 10 (the global one)
end

print(x)            -- 10 the global one

local x1, x2
local a, b, c = 1, 2, 1
do
    local a2 = 2 * a
    local d = (b^2 - 4*a*c)^(1/2)
    x1 = (-b + d)/a2
    x2 = (-b - d)/a2
end             -- scope of `a2` and `d` ends here
print(a2, d)    -- nil, nil
print(x1, x2)   -- `x1` and `x2` still in scope

local a, b = 1, 10
if a < b then
    print(a)    --> 1
    local a     --> `= nil` is implicit
    print(a)    --> nil
end             -- ends the block started at `then`
print(a, b)     --> 1 10

--[[
-- repeat-until
local line = '~'
repeat
    line = io.read()
until line ~= ''
print(line)
-- ]]

-- in Lua the scope of a local variable (declared inside the loop) includes the contidtion
x = 20000
local sqr = x / 2
repeat
    sqr = (sqr + x/sqr) / 2
    local err = math.abs( sqr^2 - x )
until err < x/10000     -- local 'err' still visible here
print(sqr)

for i = 1, math.huge do
    if (0.3*i^3 - 20*i^2 - 500 >= 0) then
        print(i)
        break
    end
end
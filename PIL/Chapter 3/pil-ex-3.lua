-- Exercise 3.1: Which of the following are valid numerals? What are their values?

a = .0e12   -- 0.0
-- .e12 invlaid
-- 0.0e invalid
b = 0x12    -- 18
-- 0xABFG invalid
c = 0xA     -- 10
-- FFFF invalid
d = 0xFFFFFFFF  -- 2^32
-- 0x   invalid
e = 0x1P10  -- 1 * 2^10 = 1024.0
f = 0.1e1   -- 0.1 * 10 ^ 1 = 1.0
g = 0x0.1p1 -- 0.0625 * 2 ^ 1 = 0.125
print('.0e12 = ' .. a, '0x12 = ' .. b, '0xA = ' .. c, '0xFFFFFFFF = ' .. d, '0x1P10 = ' .. e, '0.1e1 = ' .. f, '0x0.1p1 = ' .. g)

-- Exercise 3.2: Explain the following results:
-- > math.maxinteger * 2 --> -2
-- > math.mininteger * 2 --> 0
-- > math.maxinteger * math.maxinteger --> 1
-- > math.mininteger * math.mininteger --> 0
-- (Remember that integer arithmetic always wraps around.)
-- Exercise 3.3: What will the following program print?
for i = -10, 10 do
    print(i, i % 3)
end
-- -10 % 3 == 2

-- Exercise 3.4: What is the result of the expression 2^3^4? What about 2^-3^4?
a = 2^3^4
b = 2^-3^4
print("2^3^4 = " .. a, "2^-3^4 = " .. b) -- 2^(3^4) == 2^81, 2^(-3^4) == 2^-(3^4)

-- Exercise 3.5: The number 12.7 is equal to the fraction 127/10, where the denominator is a power of ten. Can
-- you express it as a common fraction where the denominator is a power of two? What about the number 5.5?
print(string.format( "%a", 12.7 ))
-- 12(10) <--> 1100(2)
-- 0.7(10) <--> 0.101100...(2)
-- 5.5(10) == 101.1(2)

-- Exercise 3.6: Write a function to compute the volume of a right circular cone, given its height and the
-- angle between a generatrix and the axis.

-- v = (1*3) * pi * r^2 * h
-- r = h * tan(arc)
-- arc = angle/180 * pi

function volume( angle, height )
    local arc = angle/180 * math.pi
    print("arc is " .. arc)
    local radius = math.tan(arc) * height
    print("radius is " .. radius)
    return (1/3) * math.pi * (radius^2) * height
end

print(volume(45, 9))

-- Exercise 3.7: Using math.random, write a function to produce a pseudo-random number with a standard
-- normal (Gaussian) distribution.

-- 中心极限定理
-- 大量相互独立的随机变量，其均值的分布以正态分布为极限。
function gaussian_random( max )
    math.randomseed(os.time())
    local ran = math.random( 0, max )
    ran = ran + math.random( 0, max )
    ran = ran + math.random( 0, max )
    return ran/3
end

print(gaussian_random(100))
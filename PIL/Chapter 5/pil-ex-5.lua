-- Exercise 5.1: What will the following script print? Explain.
sunday = "monday"; monday = "sunday"
t = {sunday = "monday", [sunday] = monday}
-- { "sunday": "monday", "monday": "sunday" }
print(t.sunday, t[sunday], t[t.sunday])
-- t.sunday == "monday"
-- t["monday"] == "sunday"
-- t["monday"] == "sunday"

-- Exercise 5.2: Assume the following code:
a = {}; a.a = a
-- What would be the value of a.a.a.a? Is any a in that sequence somehow different from the others?

--[[
    a.a is a table
    a.a.a is a table
    no difference
]]

print(a)        --  table: 02f38798
print(a.a)      --  table: 02f38798
print(a.a.a)    --  table: 02f38798
print(a.a.a.a)  --  table: 02f38798

-- Now, add the next line to the previous code:
-- a.a.a.a = 3
a.a.a.a.a = 3
-- What would be the value of a.a.a.a now?
-- raise an error
print(a.a)  -- 3

-- Exercise 5.3: Suppose that you want to create a table that maps each escape sequence for strings (the
-- section called “Literal strings”) to its meaning. How could you write a constructor for that table?

-- maybe like this?
escseq = {
    ["\""] = "\"",
    ["\'"] = "\'",
    ["\t"] = "\t"
}
-- or like this?
escseq = {
    ["\\\""] = "\"",
    ["\\\'"] = "\'",
    ["\\t"] = "\t"
}
-- Exercise 5.4: We can represent a polynomial an x^n + a(n-1) x^(n-1) + ... + a1 x^1 + a0 in Lua as a list of its coefficients,
-- such as {a0, a1, ..., an}.
-- Write a function that takes a polynomial (represented as a table) and a value for x and returns the polynomial
-- value.

function compute_polynomial( poly, x )
    local val = 0
    for i = 1, #poly do
        val = val + (poly[i] * (x ^ (#poly - i)))
    end
    return val
end

p = { 1, 2, 3, 4 }
x = 2
print(compute_polynomial(p, x)) -- 26.0

-- Exercise 5.5: Can you write the function from the previous item so that it uses at most n additions and n
-- multiplications (and no exponentiations)?

-- ??

-- Exercise 5.6: Write a function to test whether a given table is a valid sequence.

function test_seq( seq )
    for i = 1, #seq do
        if seq[i] == nil then
            return false
        end
    end
    return true
end

print(test_seq({1, 2, 3, 4, nil, 5}))   -- false
print(test_seq({1, 2, 3, nil, nil}))    -- true
print(test_seq({1, 2, 3, 4, 5, 6}))     -- true

-- Exercise 5.7: Write a function that inserts all elements of a given list into a given position of another given
-- list.
function insert_into( given, another )
    table.move(given, 1, #given, #another + 1, another)
end

t1 = {1, 2}
t2 = {"hello", " ", "world"}
insert_into(t1, t2)

for i, v in ipairs(t2) do
    print(i, v)
end

-- Exercise 5.8: The table library offers a function table.concat, which receives a list of strings and
-- returns their concatenation:

--      print(table.concat({"hello", " ", "world"})) --> hello world

-- Write your own version for this function.

-- Compare the performance of your implementation against the built-in version for large lists, with hundreds
-- of thousands of entries. (You can use a for loop to create those large lists.)

-- most simplest way but performance is not good
function simple_concat( t )
    local s = ''
    for  i = 1, #t do
        s = s .. t[i]   -- every .. operation will create a string, but the built-in function can create just one string as result
    end
    return s
end

print(simple_concat({"hello", " ", "world"}))
print(os.time())

t = {}
for i = 1, 100000 do
    t[i] = "part " .. i .. ", "
end

table.insert( t, "part 100001." )

interval1 = os.time()
print(interval1)
s1 = simple_concat(t)
interval2 = os.time()
s2 = table.concat( t )
interval3 = os.time()

print("simple: " .. (interval2 - interval1))
print("built-in: " .. (interval3 - interval2))
print("s1 is equal to s2? ", s1 == s2)

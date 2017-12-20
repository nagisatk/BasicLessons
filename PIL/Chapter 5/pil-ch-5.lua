-- table constructor

t1 = {
    color = "blue",
    thickness = 2,
    npoints = 4,
    { x =   0, y = 0 },
    { x = -10, y = 0 },
    { x = -10, y = 1 },
    { x =   0, y = 1 },
}
print(t1[1].x)
-- print(t1.1.x) bad code

t2 = {
    -- a bit like JavaScript
    func1 = function()
        print(1)
    end
}

t2.func1()

-- incorrect code
-- (function ( a )
--     print(a)
-- end)(1)

-- use semicolon and comma
a = { a = 1, b = 2; c = 3 }
for k,v in pairs(a) do
    print(k,v)
end

-- holes

b = { 1, 2, 3, nil, 4, 5 }
for i = 1, #b do
    print(b[i])
end

-- for i = 1, 10 do
--     a[i] = io.read()
-- end

-- for  i = 1, #a do
--     print(a[i])
-- end

-- code for fuzzy length operator
c = {}
print("length of {}: " .. #c)   -- 0
c[1] = 1
c[10] = 10
c[100] = 100
print("length of table with holes: " .. #c) -- 1

print({ 1, 2, 3 } == { 1, 2, 3, nil, nil }) -- false
a = {1, 2, 3}
b = {1, 2, 3, nil}
print(#a == #b) -- true
print(a == b) -- false

t = {10, print, x = 12, k = "hi"}
for k, v in pairs(t) do
    print(k, v)
end

t = { 10, print, 12, "hi"}
for i, v in ipairs(t) do
    print(i, v)
end

t = {}
for i in io.lines() do
    table.insert( t, i )
end
print(#t)

t = { 1, 2, 3, nil, nil, nil, nil, 2 }
print(#t)
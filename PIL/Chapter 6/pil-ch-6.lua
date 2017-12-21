function add ( a )
    local sum = 0
    for i = 1, #a do
        sum = sum + a[i]
    end
    return sum
end

print(add {1, 2, 3})    -- 6

function f( a, b ) print(a, b) end
f()         -- nil  nil
f(3)        -- 3    nil
f(3, 4)     -- 3    4
f(3, 4, 5)  -- 3    4

globalCounter = 1
function incCounter( n )
    n = n or 1
    globalCounter = globalCounter + n
end

incCounter()
print(globalCounter) -- 2
incCounter(2)
print(globalCounter) -- 4

function maximum( a )
    local mi = 1
    local m = a[mi]
    for i = 1, #a do
        if a[i] > m then
            mi = i; m = a[mi]
        end
    end
    return m, mi
end

a = { 0, 3, 2, 6, 1, 0 }
print(maximum(a))

function foo0 () end                    -- returns no results
function foo1 () return "a" end         -- returns 1 result
function foo2 () return "a", "b" end    -- returns 2 results

print(foo0(), foo1(), foo2())

x, y, z = foo2(), 10
print(x, y, z)  -- a    10  nil
t = {foo2(), 10}
print(t[1], t[2], t[3]) --a     10   nil
t = {10, foo2()}
print(t[1], t[2], t[3]) --10 a b

function add( ... )
    local s = 0
    for i, v in ipairs {...} do
        s = s + v
    end
    return s
end

print(add(1, 2, 3, 4, 5, 6))    -- 21

function nonils( ... )
    local arg = table.pack(...)
    for i = 1, arg.n do
        if arg[i] == nil then return false end
    end
    return true
end

print(nonils(2, 3, nil))    -- false
print(nonils(2, 3))         -- true
print(nonils())             -- true
print(nonils(nil))          -- false

print(select(1, "a", "b", "c"))     -- a b c
print(select(2, "a", "b", "c"))     -- b c
print(select(3, "a", "b", "c"))     -- c
print(select("#", "a", "b", "c"))   -- 3

function add( ... )
    local sum = 0
    for i = 1, select("#", ...) do
        sum = sum + select(i, ...)
    end
    return sum
end

print(add(1, 2, 3, 4, 5, 6))     -- 21

print(table.unpack({nil, nil, nil}))    -- nothing
print(table.unpack({2, nil, 1}))        -- 2 nil 1

function unpack( t, i, n )
    i = i or 1
    n = n or #t
    if i <= n then
        return t[i] , unpack(t, i + 1, n)
    end
end

t = { 1, 2, 3, nil, nil, 4 }

print(unpack(t, 1, #t))

-- tail call

function f( x )
    g(x)    -- this is not a tail call for f still has to discard any results from g before returning
end
-- Exercise 6.1: Write a function that takes an array and prints all its elements.

function print_array( arr )
    for k, v in pairs(arr) do
        print(k, v)
    end
end

arr = { "a", "b", "c" }
print_array(arr)
print()

arr[6] = "d"
arr[70] = "e"
print_array(arr)
print()
-- Exercise 6.2: Write a function that takes an arbitrary number of values and returns all of them, except
-- the first one.
function return_rest( head, ... )
    return ...
end

print(return_rest())

print(return_rest(1))

print(return_rest(1, 2, 3))

-- Exercise 6.3: Write a function that takes an arbitrary number of values and returns all of them, except
-- the last one.
function return_head( ... )
    local t = table.pack(...)
    return table.unpack(t, 1, #t - 1)
end
print(return_head())
print(return_head(1, 2, 3, 4))

-- Exercise 6.4: Write a function to shuffle a given list. Make sure that all permutations are equally probable.
math.randomseed(os.time())
function shuffle_list( lst )
    local indices = {}
    for i = 1, #lst do
        indices[i] = i
    end
    -- print("indices: ", table.unpack(indices))
    local shuffled = {}
    for i = 1, #lst do
        local index = math.random( #indices )
        shuffled[indices[index]] = lst[i]
        table.remove( indices, index )
    end
    return shuffled
end
s = shuffle_list {1, 2, 3, 4, 5, 6, 7, 8, 9}
print(table.unpack(s))

-- Exercise 6.5: Write a function that takes an array and prints all combinations of the elements in the array.
-- (Hint: you can use the recursive formula for combination: C(n,m) = C(n -1, m -1) + C(n - 1, m). To generate
-- all C(n,m) combinations of n elements in groups of size m, you first add the first element to the result and
-- then generate all C(n - 1, m - 1) combinations of the remaining elements in the remaining slots; then you
-- remove the first element from the result and then generate all C(n - 1, m) combinations of the remaining
-- elements in the free slots. When n is smaller than m, there are no combinations. When m is zero, there is
-- only one combination, which uses no elements.)

-- combination 组合
function all_combination( array )
    local cmbs = {}
    for i = 1, #array do
        local icmbs = show_combination(array, i)
        -- print('icmbs: ')
        -- for i, v in ipairs(icmbs) do
        --     print(table.unpack(v))
        -- end
        table.move(icmbs, 1, #icmbs, #cmbs + 1, cmbs)
    end
    return cmbs
end

function show_combination( array, m )
    -- print("array:", table.unpack(array))
    -- print("m: ", m)
    if m == 0 then
        return {}
    end
    if m == #array then
        return { array }
    end
    local combs = {}
    if m == 1 then
        for i = 1, #array do
            table.insert(combs, #combs + 1, { array[i] })
        end
        return combs
    end
    local head = nil
    if 1 < m and m < #array then
        for i = 1, #array - m + 1 do
            head = array[i]
            local tail = {}
            table.move(array, i + 1, #array, 1, tail)
            -- print("tail: ", table.unpack(tail))
            tailcombs = show_combination(tail, m - 1)
            for i = 1, #tailcombs do
                table.insert( tailcombs[i], 1, head )
                table.insert( combs, tailcombs[i] )
            end
        end
    end
    return combs
end
print("test")
array = {1, 2, 3, 4}
combs = all_combination(array)
-- combs = show_combination(array, 2)
for i, v in ipairs(combs) do
    print(table.unpack(v))
end
-- print(table.unpack(cmbs))
-- Exercise 6.6: Sometimes, a language with proper-tail calls is called properly tail recursive, with the argument
-- that this property is relevant only when we have recursive calls. (Without recursive calls, the maximum
-- call depth of a program would be statically fixed.)
-- Show that this argument does not hold in a dynamic language like Lua: write a program that performs an
-- unbounded call chain without recursion. (Hint: see the section called “Compilation”.)

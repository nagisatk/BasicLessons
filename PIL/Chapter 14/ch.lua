-- arrays
local a = {} -- new array
for i = 0, 1000 do
    a[i] = 0
end

print(#a) -- 1000

-- create an array with indeices from -5 to 5
a = {}
for i  = -5, 5 do
    a[i] = 0 -- not 11 but 5, 'cause index from 1
end

print(#a)

-- Matrices and Multi-Dimensional Arrays
N = 3; M = 4
local mt = {}
for i = 1, N do
    local row = {}
    mt[i] = row
    for j = 1, M do
        row[j] = (i-1)*M+j
    end
end

function display_mt( mt )
    for i = 1, #mt do
        local row = mt[i]
        print(table.concat( row, ",\t" ))
    end
end

display_mt(mt)
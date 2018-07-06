io.write("sin(3) = ", math.sin(3), "\n")
io.write(string.format("sin(3) = %.4f\n", math.sin(3)))

-- for count = 1, math.huge do
--     local line = io.read('L')
--     if line == nil then break end
--     io.write(string.format('%.6d  ', count), line)
-- end

--[[
local lines = {}
-- read the lines in table ;lines;
for line in io.lines() do
    lines[#lines + 1] = line
end

-- sort
table.sort(lines)

-- write all the lines
for _, l in ipairs(lines) do
    io.write(l, '\n')
end
--]]

--[[
while true do
    local block = io.read(2^13)
    if not block then break end
    io.write(block)
end
--]]

--[[
while true do
    local n1, n2, n3 = io.read('n', 'n', 'n')
    if not n1 then break end
    print(math.max( n1, n2, n3 ))
end
--]]

io.stderr:write("hello byebye\n")

function fsize( file )
    local current = file:seek()
    local size = file:seek('end')
    file:seek('set', current)
    return size
end

print(fsize(io.open('pil-ch-7.lua')))
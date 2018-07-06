-- exercise 7.1

function rewrite( name1, name2 )
    name1 = name1 or ''
    name2 = name2 or ''
    local fin = io.open(name1, 'r') or io.stdin
    local fout = io.open(name2, 'w') or io.stdout
    local lines = {}
    while true do
        local line = fin:read()
        if line == nil then break end
        lines[#lines + 1] = line
    end
    table.sort( lines )
    for _, line in ipairs(lines) do
        fout:write(line .. '\n')
    end
    fin:close()
    fout:close()
end

-- rewrite()
-- rewrite('a')
-- rewrite('a', 'b')

-- exercise 7.2

function rewrite2( name1, name2 )
    name1 = name1 or ''
    local fin = io.open(name1, 'r') or io.stdin
    local fout, err = nil, ''
    if name2 == nil then fout = io.stdout
    else fout, err = io.open(name2) end
    if fout ~= nil then
        print (name2 .. ' already exists, continue? y/n')
        local ans
        while true do
            ans = io.read('l')
            if ans == 'y' then
                fout = io.open(name2, 'w')
                break
            elseif ans == 'n' then
                os.exit()
            end
        end
    else
        fout = io.open(name2, 'w')
    end
    local lines = {}
    while true do
        local line = fin:read()
        if line == nil then break end
        lines[#lines + 1] = line
    end
    table.sort( lines )
    for _, line in ipairs(lines) do
        fout:write(line .. '\n')
    end
    fin:close()
    fout:close()
end

-- rewrite2('a', 'b')

-- exercise 7.4
function last_line(toread)
    local count = toread:seek('end')
    local line
    for i = 1, count do
        count = count - 1
        toread:seek('set', count)
        line = toread:read()
        if line == '' then break end
    end
    toread:seek('set', count + 1)
    line = toread:read()
    print(line)
    return line
end

-- last_line(io.open('a', 'r'))
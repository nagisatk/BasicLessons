-- exercide 10.1

function split( s, sep )
    if sep ~= '' then
        pattern = '[^' .. sep .. ']+'
    else
        pattern = '.'
    end
    local t = {}
    print(string.gsub( s, pattern, function (a)
        t[#t + 1] = a
        return a
    end))
    return t
end

t = split('hello world', '')

for k,v in ipairs(t) do
    print(k, v)
end

-- exercise 10.2

-- match the charactor which is matched by %D OR  %U
print(string.gsub( '1234abcdABCD', '[%D%U]', '#' ))     -- ############
-- match the charactor which is matched by %D AND %U
print(string.gsub( '1234abcdABCD', '[^%d%u]', '#' ))    -- 1234####ABCD

-- exercise 10.3

function transliterate (s, t)
    for k, v in pairs(t) do
        s = string.gsub(s, k, function (c)
            if v == false then
                return ''
            else
                return v
            end
        end)
    end
    return s
end

print(transliterate('hello, world!', { l = '1', d = false }))


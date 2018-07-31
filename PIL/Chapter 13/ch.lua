print(string.format( "%x", 0xff & 0xabcd ))
print(string.format( "%x", 0xff | 0xabcd ))
print(string.format( "%x", 0xaaaa ~ -1 ))
print(string.format( "%x", ~0 ))
print(string.format( "%x", 0xff << 12 ))
print(string.format( "%x", 0xff >> -12 ))

-- unsigned division
function udiv( n, d )
    if d < 0 then
        if math.ult(n, d) then return 0
        else return 1
        end
    end
    local q = ((n >> 1) // d) << 1
    local r = n - q * d
    if not math.ult(r, d) then q = q + 1 end
    return q
end

-- packing and unpacking binary data
s = string.pack('iii', 3, -27, 450)
print(#s)
print(string.unpack('iii', s))

s = 'hello\0Lua\0world\0'
local i = 1
while i < #s do
    local res
    res, i = string.unpack('z', s, i)
    print(res)
end

s = 'hello world'
i, j = string.find( s, 'hello' )
print(i, j)
print(string.sub( s, i, j ))
print(string.find(s, 'world'))
i, j = string.find(s, 'l')
print(i, j)
print(string.find( s, 'lll' ))

-- string.find( 'a [word]', '[' )  -- error
i, j = string.find( 'a [word]', '[', 1, true )
print(i, j) -- 3  3

-- string.match
print(string.match( 'hello world', 'hello' ))   -- hello

date = 'Today is 17/7/1990'
d = string.match( date, '%d+/%d+/%d+' )
print(d)    -- 17/7/1990

-- string.gsub
s = string.gsub('Lua is cute', 'cute', 'great')
print(s)    -- Lua is great
s = string.gsub( 'all lii', 'l', 'x' )
print(s)    -- axx xii
s = string.gsub( 'Lua is great', 'Sol', 'Sun' )
print(s)

s = string.gsub( 'all lli', 'l', 'x', 1 )
print(s)    -- axl lli

-- the function string.gmatch
s = 'some thing'
words = {}
for w in string.gmatch( s, '%a+' ) do
    words[#words + 1] = w
    -- print(w)
end

print((string.gsub( 'hello, up-down!', '%A', '.' )))

-- count the number of vowels
_, nvow = string.gsub( 'hello, everyone', '[AEIOUaeiou]', '' )
print(nvow)     -- 6

-- modifiers

print((string.gsub( 'one, two, three, four', '%a+', 'word' )))

-- lazy match
test = 'int x; /* x */ int y; /* y */'
print((string.gsub( test, '/%*.*%*/', '' )))    -- int x;
print((string.gsub( test, '/%*.-%*/', '' )))    -- int x;  int y;

-- frontier pattern
s = 'the anthem is the theme'
print((string.gsub( s, '%f[%w]the%f[%W]', 'one' )))

-- capture
pair = 'name = Anna'
key, value = string.match(pair, '(%a+)%s=%s(%a+)')
print(key, value)

date = 'Today is 17/7/1990'
d, m, y = string.match( date,'(%d+)/(%d+)/(%d+)' )
print(d, m, y)

s = [[then he said : "it's all right!"]]
q, quotedPart = string.match(s, '(["\'])(.-)%1')
print(quotedPart)
print(q)

p = '%[(=*)%[(.-)%]%1%]'
s = 'a = [=[[[ something ]] ]==] ]=]; print(a)'
print(string.match(s, p))

-- replacement with %n
print(string.gsub( 'hello Lua!', '%a', '%0-%0' ))

print(string.gsub( 'hello Lua!', '(.)(.)', '%2%1' ))

-- \command{some text} --> <command>some text</command>

-- pattern = '\\(%a+){(%a+)}'
pattern = '\\(%a+){(.-)}'
replace = '<%1>%2</%1>'
cmd = [[the \quote{task} is to \em{change} that.]]

print(string.gsub(cmd, pattern, replace))

-- trim
function trim(s)
    s = string.gsub(s, '^%s*(.-)%s*$', '%1')
    return s
end

print(trim('  dead man  '))
print(trim('a dead man !'))

-- Replacement
function expand(s)
    return (string.gsub( s, '$(%w+)', _G ))
end

name = 'Lua'; status = 'great'
print(expand("$name is $status, isn't it?"))

function toxml(s)
    s = string.gsub(s, '\\(%a+)(%b{})', function (tag, body)
            body = string.sub(body, 2, -2)  -- remove the brackets
            body = toxml(body)              -- handle nested commands
            return string.format('<%s>%s</%s>', tag, body, tag)
    end)
    return s
end

print(toxml("\\title{The \\bold{big} example}"))

-- URL encoding
name = 'al'; query = 'a+b = c'; q = 'yes or no'

function unescape( s )
    s = string.gsub( s, '+', ' ' )
    s = string.gsub( s, '%%(%x%x)', function (h)
            return string.char(tonumber(h, 16))
    end)
    return s
end

print(unescape('a%2Bb+%3D+c'))

cgi = {}
function decode (s)
    for name, value in string.gmatch(s, '([^&=]+)=([^&=]+)') do
        name = unescape(name)
        value = unescape(value)
        cgi[name] = value
    end
end

function escape(s)
    s = string.gsub( s, '[&=+%%%c]', function (c)
            return string.format('%%%02X', string.byte( c ))
    end)
    s = string.gsub( s, ' ', '+' )
    return s
end

function encode(t)
    local b = {}
    for k, v in pairs(t) do
        b[#b + 1] = escape(k) .. '=' .. escape(v)
    end
    -- concatenates all entries in 'b', separated by '&'
    return table.concat( b, '&' )
end

t = { name = 'al', query = 'a+b = c', q = 'yes or no' }
print(encode(t))

-- tab expansion
print(string.match( 'hello', '()ll()' ))

function expandTabs(s, tab)
    tab = tab or 4
    local corr = 0
    s = string.gsub(s, '()\t', function (p)
            local sp = tab - (p - 1 + corr)%tab
            corr = corr - 1 + sp
            return string.rep(' ', sp)  -- repeat
    end)
    return s
end

s = 'this\tis\ttest\tfor\ttabs.'
print(s)
s = expandTabs(s)
print(s)
function unexpandTabs(s, tab)
    tab = tab or 4
    s = expand(s, tab)
    local pat = string.rep( '.', tab )
    s = string.gsub( s, pat, '%0\1' )
    s = string.gsub( s, ' +\1', '\t' )
    s = string.gsub(s, '\1', '')
    return s
end

s = unexpandTabs(s)
print(s)

function nocase(s)
    s = string.gsub( s, '%a', function (a)
            return '[' .. string.lower( a ) .. string.upper( a ) .. ']'
    end)
    return s
end

print(nocase('hello'))

function code (s)
    return (string.gsub( s, '\\(.)', function (x)
         return string.format( "\\%03d", string.byte( x ) )
    end))
end

function decode(s)
    return (string.gsub( s, '\\(%d%d%d)', function(d)
        return '\\' .. string.char(tonumber(d))
    end))
end

s = [[follows a typical string: "This is \"great\"!".]]
s = code(s)
print(s)
s = string.gsub(s, '".-"', string.upper)
s = decode(s)
print(s) 
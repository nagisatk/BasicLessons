-- String

a = "one string"
b = string.gsub( a, "one", "another" )
print(a)
print(b)

a = "hello"
print(#a)
print(#"good bye")

print( string.format( "x = %d, y = %d", 10, 20 ))
print( string.format( "x = %x", 200 ))
print( string.format( "x = 0x%X", 200 ))
print( string.format( "x = %f", 200 ))
tag, title = "h1", "a title"
print( string.format( "<%s>%s</%s>", tag, title, tag ))

print(string.format( "pi = %.4f", math.pi ))
d = 5; m = 11; y = 1990
print(string.format( "%02d/%02d/%04d", d, m, y ))
-- print("我")  -- can not be printed correctly because of the ANSI encoding GBK (the encoding of this file is UTF-8)
s = "我不高兴"
l = utf8.len(s)
print(l)    -- 4 (which counts code point)
print(string.len(s))    -- 12 (which counts char)
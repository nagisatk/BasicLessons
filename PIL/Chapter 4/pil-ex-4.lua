-- Exercise 4.1: How can you embed the following fragment of XML as a string in a Lua program?
s1 = [=[
<![CDATA[
    Hello world
]]>
]=]
print(s1)
s2 = "<![CDATA[\n    \z
    Hello world\n\z
]]>"
print(s2)
-- Show at least two different ways.

-- Exercise 4.2: Suppose you need to write a long sequence of arbitrary bytes as a literal string in Lua. What
-- format would you use? Consider issues like readability, maximum line length, and size.
s3 = 
[[
    like this
]]
-- Exercise 4.3: Write a function to insert a string into a given position of another one:
-- > insert("hello world", 1, "start: ") --> start: hello world
-- > insert("hello world", 7, "small ") --> hello small world

function insert( s, p, i )
    local left = string.sub( s, 1, p-1 )    -- string.sub() will contain both the head and the tail of the indices
    local right = string.sub( s, p, -1 )
    return left .. i .. right
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", 7, "small ") )
-- Exercise 4.4: Redo the previous exercise for UTF-8 strings:
-- > insert("ação", 5, "!") --> ação!

-- (Note that the position now is counted in codepoints.)

-- but how to test?
function insert_utf8( s, p, i )
    local left = string.sub( s, 1, utf8.offset(s, p-1) )
    local right = string.sub( s,  utf8.offset(s, p), -1 )
    return left .. i .. right
end

-- Exercise 4.5: Write a function to remove a slice from a string; the slice should be given by its initial
-- position and its length:
-- > remove("hello world", 7, 4) --> hello d
function remove_slice( s, i, l )
    return string.sub( s, 1, i - 1 ) .. string.sub( s, i + l, -1 )
end

print(remove_slice("hello world", 7, 4))
-- Exercise 4.6: Redo the previous exercise for UTF-8 strings:
-- > remove("ação", 2, 2) --> ao
-- (Here, both the initial position and the length should be counted in codepoints.)

function remove_slice( s, i, l )
    return string.sub( s, 1, utf8.offset(s, i - 1) ) .. string.sub( s, utf8.offset(s, i + l), -1 )
end

-- Exercise 4.7: Write a function to check whether a given string is a palindrome:
-- > ispali("step on no pets") --> true
-- > ispali("banana") --> false
function ispali( s )
    return string.reverse( s ) == s
end

print(ispali("step on no pets"))
print(ispali("banana"))
-- Exercise 4.8: Redo the previous exercise so that it ignores differences in spaces and punctuation.

-- how to confirm that a char is a punctuation?

-- Exercise 4.9: Redo the previous exercise for UTF-8 strings.
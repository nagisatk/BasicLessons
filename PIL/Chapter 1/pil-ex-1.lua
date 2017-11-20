-- Exercise 1.1: Run the factorial example. What happens to your program if you enter a negative number?
-- Modify the example to avoid this problem.
function factorial( n )
    if n < 0 then
        print("Ivalid input.")
        return nil
    elseif n == 0 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

-- Exercise 1.2: Run the twice example, both by loading the file with the -l option and with dofile.
-- Which way do you prefer?
-- emmm, how about you trying to guess it?

-- Exercise 1.3: Can you name other languages that use "--" for comments?
-- SQL

-- Exercise 1.4: Which of the following strings are valid identifiers?
--[[
    ___         (true)
    _end        (true)
    End         (true)
    end         (false)
    until?      (false)
    nil         (false)
    NULL        (true)
    one-step    (false)
--]]

-- Exercise 1.5: What is the value of the expression type(nil) == nil? (You can use Lua to check
-- your answer.) Can you explain this result?
-- false
-- value of type(nil) is a string "nil" which is not a non-value
-- "nil" != nil

-- Exercise 1.6: How can you check whether a value is a Boolean without using the function type?
-- Lua will not convert non-boolean value to boolean value for == operator
function isbool(value)
    return value == false or value == true
end

-- Exercise 1.7: Consider the following expression:
-- (x and y and (not z)) or ((not y) and x)
-- Are the parentheses necessary? Would you recommend their use in that expression?
-- The parentheses are not necessary but recommended for the readability

-- Exercise 1.8: Write a simple script that prints its own name without knowing it in advance.
print(arg[0])
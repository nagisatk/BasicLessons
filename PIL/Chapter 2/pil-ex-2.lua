-- Exercise 2.1: Modify the eight-queen program so that it stops after printing the first solution.

N = 8

-- check whether position (n, c) is free from attacks
function isplaceok( a, n, c )
  for i = 1, n - 1 do   -- for each queen already placed
    if (a[i] == c) or        -- same column?
       (a[i] - i == c - n) or      -- same diagnal?
       (a[i] + i == c + n) then  -- same diagnal?
      return false  -- place can be attacked
    end
  end
  return true
end

-- print a board
function printsolution( a )
  for i = 1, N do
    for j = 1, N do
      -- write "X" or "-" plus a space
      io.write(a[i] == j and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end
-- place (a, r, c)
function eightqueen( a, r, c )
  
end

-- Exercise 2.2: An alternative implementation for the eight-queen problem would be to generate all possible
-- permutations of 1 to 8 and, for each permutation, to check whether it is valid. Change the program to use
-- this approach. How does the performance of the new program compare with the old one? (Hint: compare
-- the total number of permutations with the number of times that the original program calls the function
-- isplaceok.)
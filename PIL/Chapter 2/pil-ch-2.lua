-- The eight-queen program

N = 8
times = 0
board = 0
-- check whether position (n, c) is free from attacks
function isplaceok( a, n, c )
    times = times + 1
    for i = 1, n - 1 do     -- for each queen already placed
        if (a[i] == c) or              -- same column?
           (a[i] - i == c - n) or      -- same diagnal?
           (a[i] + i == c + n) then    -- same diagnal?
            return false    -- place can be attacked
        end
    end
    return true
end

-- print a board
function printsolution( a )
    board = board + 1
    for i = 1, N do
        for j = 1, N do
            -- write "X" or "-" plus a space
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

-- add to board 'a' all queens from 'n' to 'N'
function addqueen( a, n )
    if n > N then   -- all queens have been placed?
        printsolution(a)
    else
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c    -- place n-th queen at column 'c'
                addqueen(a, n + 1)
            end
        end
    end
end

-- run the program
addqueen({}, 1)

-- statistics data
io.write(times, "\n")
io.write(board)

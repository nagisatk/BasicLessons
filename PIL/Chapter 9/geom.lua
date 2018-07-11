-- a circle with center (1.0, 3.0) and radius 4.5
function disk1 (x, y)
    return (x - 1.0)^2 + (y - 3.0)^2 <= 4.5^2
end

-- disk factory
function disk (cx, cy, r)
    return function ( x, y )
        return (x - cx)^2 + (y - cy)^2 <= r^2
    end
end


-- axis-aligned rectangle
function rect (left, right, bottom, up)
    return function ( x, y )
        return left <= x and x <= right and
                bottom <= y and y <= up
    end
end

-- completement of any region
function completement (r)
    return function (x, y)
        return not r(x, y)
    end
end

-- union, intersection, and difference of regions
function union (r1, r2)
    return function (x, y)
        return r1(x, y) or r2(x, y)
    end
end

function intersection (r1, r2)
    return function (x, y)
        return r1(x, y) and r2(x, y)
    end
end

function difference (r1, r2)
    return function (x, y)
        return r1(x, y) and not r2(x, y)
    end
end

function translate (r, dx, dy)
    return function (x, y)
        return r(x - dx, y - dy)
    end
end

-- figure 9.2 drawing a region in a PBM file

function plot (r, M, N)
    io.write('P1\n', M, ' ', N, '\n')  -- header
    for i = 1, N do     -- for each line
        local y = (N - i*2)/N
        -- io.write('---------------', i)
        for j = 1, M do -- for each column
            local x = (j*2 - M)/M
            io.write(r(x, y) and '# ' or '- ')
            -- io.write('('..x..','..y..')')
        end
        io.write('\n')
    end
end

c1 = disk(0, 0, 1)
plot(difference(c1, translate(c1, 0.6, 0)), 100, 100)
-- exercise 12.1

function isleap(y)
    return (y % 100 == 0 and y % 400 == 0) or
        (y % 4 == 0)
end

function aftermonth( d )
    local monthmap = {
        31, 28 + (isleap(d.year) and 1 or 0), 31, 30, 31, 30,
        31, 31, 30, 31, 30, 31
    }
    local nmonth = d.month == 12 and 1 or (d.month + 1)
    if monthmap[nmonth] < d.day then
        d.day = monthmap[nmonth]
    end
    d.month = nmonth
    return d
end

d = os.date('*t')
d.month = 3
d.day   = 31
print(os.date('%c', os.time(d)))


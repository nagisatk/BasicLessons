local t1 = os.time()

local date = 1439653520
local day2year = 365.242
local sec2hour = 60 * 60
local sec2day = sec2hour * 24
local sec2year = sec2day * day2year

print(date // sec2year + 1970)  --> 2015.0
print(date % sec2day // sec2hour) --> 15
print(date % sec2hour)  -- > 45
print(date % 60)    --> 20

print(os.date('a %A in %B'))
print(os.date('%d/%m/%Y', 906000490))
print(os.date('%z: %Y-%m-%d %H:%M:%S %A %B'))
print(os.date('!%c', os.time()))

-- date-time manipulation
t = os.date('*t')
print(os.date('%Y/%m/%d', os.time(t)))

t.day = t.day + 40
print(os.date('%Y/%m/%d', os.time(t)))

t = os.date('*t')
print(t.day, t.month)
t.day = t.day - 40
print(t.day, t.month)
t = os.date('*t', os.time(t))
print(t.day, t.month)

t = os.date('*t')
t.month = 3
t.day = 31
print(os.date('%Y/%m/%d', os.time(t)))
t.month = t.month + 1
print(os.date('%Y/%m/%d', os.time(t)))
t.month = t.month - 1


local x = os.clock()
local s = 0
for i = 1, 2^32 do s = s + i end
print(string.format( "elapsed time: %.2f\n", os.clock() - x ))
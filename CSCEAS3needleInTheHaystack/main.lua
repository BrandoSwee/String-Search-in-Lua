--------------------------------------------
--
-- Brandon Sweeney
-- 11 - 24 - 21
-- Assignment 3
-- String Searching Algorithms 
--
--------------------------------------------
naiveSearch = require "CSCEAS3needleInTheHaystack/naiveSearch"
RabinKarp = require "CSCEAS3needleInTheHaystack/RabinKarp"
Knuth = require "CSCEAS3needleInTheHaystack/KMP"
-----------------------------------------------------------------------------------------------------------------------
-- Set your own variable here.
-- Setup for command line arguments right now.
-- If you can't figure those out hard code your variables.
-- So remove arg[1] and arg[2] replace it with values like the commented out ones.
local file_name = "CSCEAS3needleInTheHaystack/" .. arg[1] -- "minitest.txt"
local needle = arg[2] --"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
-------------------------------------------------------------------------------------------------------------------

local open = io.open

--Just used for confirmation
local function print_table(table)
  if type(table) == "table" then
    for k,v in pairs(table) do
      print(table[k])
    end
  else
    print("Not a table")
  end
end
-- Test function, unused.
local function read_as_one_string(path)
  local file = open(path, "rb")
  if file == nil then
    return {} 
  end
  local returnStr = file:read("*a")
  file:close()
  return returnStr
end
-- Reads files
local function read_file(path)
  local file = open(path, "rb")
  if file == nil then
    return {} 
  end
  local stop = false
  local returnVal = {}
  while stop == false do
    local temp = file:read(1)
    if(temp == nil) then
      stop = true
    else
      table.insert(returnVal, temp)
    end
  end
  file:close()
  return returnVal
end
-- Used for testing timer
local function sleep(n)
  if n > 0 then 
    os.execute("ping -n " .. tonumber(n+1) .. " localhost > NUL") 
  end
end

-- Start main program
local n = {} --{ needle:match((needle:gsub(".", "(.)"))) } -- Old way doesn't work for needles greater than 32.
-- Convert needle to string
local x = os.clock()
--Added this so some of the basecases in RabinKarp and KMP are not needed
if(needle == nil) then
  needle = "ab"
end
for i = 1, #needle do
  local c = needle:sub(i,i)
  table.insert(n,c)
end
io.write("It took ")
io.write(os.clock() - x)
print(" seconds to convert your needle to a table. \n")
-- # gives length for tables and strings
--print(#needle)
local lenOfNeedle = #needle
-- Start reading file
print("Currently reading your file.")
x = os.clock()
local Haystack = read_file(file_name)
print("Finished reading file.")
io.write("It took ")
io.write(os.clock() - x)
print(" seconds to read it. \n")
--print(#Haystack)
local lenOfHay = #Haystack
print("Please note that lua tables start at index 1 so everything starts at 1 \n")
--NaiveSearch
print("Start naive section:")
x = os.clock()
-- When I was returning tables
--local MatchingIndecies = 
naiveSearch.Naive(Haystack, n, lenOfHay, lenOfNeedle)
--print_table(MatchingIndecies)
io.write("It took ")
io.write(os.clock() - x)
print(" seconds to run naiveSearch \n")

print("Start Rabin-Karp section:")
x = os.clock()
------------------------------------------------ Any reasonable prime number really
------------------------------------------------ I choose the 1000th prime number
------------------------------------------------ 2^64 - 257 does not work.
------------------------------------------------ Lua gives --> 1.844674407371e+019
RabinKarp.Karp(Haystack, n, lenOfHay, lenOfNeedle, 7919)
io.write("It took ")
io.write(os.clock() - x)
print(" seconds to run Rabin-Karp \n")

print("Start Kunth-Morris-Pratt section:")
x = os.clock()
Knuth.KMP(Haystack, n, lenOfHay, lenOfNeedle)
io.write("It took ")
io.write(os.clock() - x)
print(" seconds to run Kunth-Morris-Pratt")



local function Naive(Hay, Ned, lenHay, lenNed)
  if lenHay == 0 or lenNed == 0 or lenNed > lenHay then
    return
  else
    --Lua starts indexing at 1
    --So there will be some +1s to account for that
    local j = 0
    --local returnTable = {}
    while j < ((lenHay + 1) - lenNed) do
      local b = true
      local i = 0
      while b == true and i < lenNed do
        if(Hay[i + j + 1] ~= Ned[i + 1]) then
          b = false
        else
          i = i + 1
        end
      end
      --table.insert(returnTable,b)
      if(b == true) then
        --Printing the index
        io.write("Index ")
        io.write(j + 1)
        print(" had a match.")
      end
      j = j + 1
    end
  -- Removed return table for size issues.
  -- I was also naive much slower than it should have been.
  --return returnTable
  end
end



return {Naive = Naive}
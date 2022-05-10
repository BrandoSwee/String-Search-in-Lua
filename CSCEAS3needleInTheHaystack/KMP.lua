

local function KMP(Hay, Ned, lenHay, lenNed)
  if lenHay == 0 or lenNed == 0 or lenNed > lenHay then
    return
  else
    local l = {}
    table.insert(l, 0)
    local n = 0
    local m = 1
    local temp = 0
    -- Need to create the table for 
    -- extra values on the needle.
    while m < lenNed do
      if Ned[m + 1] == Ned[n + 1] then
        temp = n + 1
        table.insert(l, temp)
        n = n + 1
        m = m + 1
      else
        if n ~= 0 then
          n = l[n]
        else
          table.insert(l, 0)
          m = m + 1
        end
      end
    end
    local i = 0
    local j = 0
    -- Start the checking for
    -- Kunth-Morris-Pratt
    while i < lenHay do
      if Hay[i + 1] == Ned[j + 1] then
        i = i + 1
        j = j + 1
      else
        if j ~= 0 then
          j = l[j]
        else
          i = i + 1
        end
      end
      if j == lenNed then
        io.write("Index ")
        io.write(i-j+1)
        print(" had a match.")
        j = l[j]
      end
    end
  end
end

return {KMP = KMP}
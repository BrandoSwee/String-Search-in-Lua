

local function Karp(Hay, Ned, lenHay, lenNed, q)
  if lenHay == 0 or lenNed == 0 or lenNed > lenHay then
    return
  else
    ---------------
    -- ASCII right
    local d = 256
    --------------
    local p = 0
    local t = 0
    local h = 1
    local i = 0
    while i < lenNed - 1 do
      h = (h*d)%q
      i = i + 1
    end
    i = 0
    -- Create the hash for the Needle of size x.
    -- And create the hash of the first x characters of Haystack.
    while i < lenNed do
      p = (d*p + string.byte(Ned[i + 1]))%q
      t = (d*t + string.byte(Hay[i + 1]))%q
      i = i + 1
    end
    ----------------
    
    i = 0
    while i <= (lenHay - lenNed) do
      if p == t then
        -------------------------------------
        -- Confirmation section. 
        -- Should this not be done?
        -- And we just accept false positives?
        local j = 0
        local going = true
        while j < lenNed and going == true do
          if Hay[i+j+1] ~= Ned[j+1] then
            going = false
            j = j - 1
          end
          j = j + 1
        end
        if j == lenNed then
          io.write("Index ")
          io.write(i + 1)
          print(" had a match.")
        end
      end
      --------------------------------------
      if i < lenHay - lenNed then
        t = (d*(t - (string.byte(Hay[i + 1])*h)) + string.byte(Hay[(i+1)+lenNed]))%q
        if t < 0 then
          t = (t + q)
        end
      end
      i = i + 1
    end
  end
end


return {Karp = Karp}
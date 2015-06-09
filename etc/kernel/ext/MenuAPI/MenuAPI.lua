--MenuAPI by 1Ridav
--Modified for Debian ComputerCraft by MelnikovSM
local function mprint(array, this, s1, s2, x, y)
   for i = 1, #array do
      term.setCursorPos(x, y)
      --Check if option selected
      if i == this then 
      --Option selected   
         write(s1)
      else 
      --Option NOT selected
         write(s2)
      end
      --Print the string
      print(array[i])
      y = y + 1 
   end
end

function CreateMenu(array, state1, state2, pos_x, pos_y)
   local select = 1
   local x, y = term.getCursorPos()
   
   while true do
      term.setCursorPos(x, y)
      mprint(array, select, state1, state2, pos_x, pos_y)
      event, key = os.pullEvent("key")
      --Enter
      if key == 28 then 
         return select 
      end
      
      if #array > 1 then
         --Arrow UP or W key
         if key == 200 or key == 17 then 
      		    select = select - 1 
			
            if select < 1 then 
               select = #array 
            end
         --Arrow Down or S key
         elseif key == 208 or key == 31 then 
      		    select = select + 1     
        			 if select > #array then select = 1 end
  	      end
      end   
   end
end
local cs=term.isColour()
function select(title, text, a)
term.clear()
if cs==true then
local background=paintutils.loadImage("/system/lib/DialogAPI.data/dialog-select")
paintutils.drawImage(background, 1, 1)
end
term.setCursorPos(15, 1)
print(title)
if cs==false then
term.setCursorPos(10, 2)
print("Black-White-only mode")
end
term.setCursorPos(6, 4)
if cs==true then
term.setBackgroundColor(256)
term.setTextColor(32768)
end
print(text)
local select=MenuAPI.CreateMenu(a, ">", " ", 6, 6)
term.setCursorPos(1,1)
if cs==true then
term.setBackgroundColor(32768)
term.setTextColor(1)
end
term.clear()
return select
end
function enter(title, text)
term.clear()
if cs==true then
local background=paintutils.loadImage("/system/lib/DialogAPI.data/dialog-enter")
paintutils.drawImage(background, 1, 1)
end
term.setCursorPos(15, 1)
print(title)
if cs==false then
term.setCursorPos(10, 2)
print("Black-White-only mode")
end
if cs==true then
term.setBackgroundColor(256)
end
term.setCursorPos(6, 4)
if cs==true then
term.setTextColor(32768)
end
print(text)
if cs==true then
term.setTextColor(1)
end
term.setCursorPos(7, 9)
if cs==true then
term.setBackgroundColor(2048)
term.setTextColor(1)
end
local enter=read()
term.setCursorPos(1,1)
if cs==true then
term.setBackgroundColor(32768)
term.setTextColor(1)
end
term.clear()
return enter
end
function enterPasswd(title, text)
term.clear()
if cs==true then
local background=paintutils.loadImage("/system/lib/DialogAPI.data/dialog-enter")
paintutils.drawImage(background, 1, 1)
end
term.setCursorPos(15, 1)
print(title)
if cs==false then
term.setCursorPos(10, 2)
print("Black-White-only mode")
end
if cs==true then
term.setBackgroundColor(256)
term.setCursorPos(6, 4)
term.setTextColor(32768)
end
print(text)
term.setCursorPos(7, 9)
if cs==true then
term.setBackgroundColor(2048)
term.setTextColor(1)
end
local enter=read("*")
term.setCursorPos(1,1)
if cs==true then
term.setBackgroundColor(32768)
term.setTextColor(1)
end
term.clear()
return enter
end
function request(title, text)
return select(title, text, {"Yes", "No"})
end
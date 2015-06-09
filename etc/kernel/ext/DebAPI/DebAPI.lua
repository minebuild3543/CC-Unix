function reboot_rec()
os.loadAPI("/system/lib/RecEnvAPI")
RecEnvAPI.start()
return
end
function error(errreq)
print("[Error!] ", errreq)
end
function shutdown()
print("Shutting down computer..")
sleep(1)
os.shutdown()
end
function reboot()
print("Rebooting computer..")
sleep(1)
os.reboot()
end
function clear()
term.clear()
term.setCursorPos(1, 1)
end
id=os.getComputerID()
function clearCache()
print("[Debian] Cleaning cache..")
pcall("fs.delete", "/tmp")
pcall("fs.makeDir", "/tmp")
end
function time()
local nTime=os.time()

return textutils.formatTime( nTime, false )
end
day=os.day
function pastebinGet(paste)
    local response = http.get(
        "http://pastebin.com/raw.php?i="..textutils.urlEncode( paste )
    )
        
    if response then
        local sResponse = response.readAll()
        response.close()
        return sResponse
    end
end
function getFile(paste, file)
    local response = http.get(paste)
        
    if response then
        local sResponse = response.readAll()
        response.close()
        local f=fs.open(file, "w")
	f.writeLine(sResponse)
	f.close()
    end
end
function writeLog(text)
local syslogr=fs.open("/var/syslog", "r").readAll()
local syslog=fs.open("/var/syslog", "w")
syslog.writeLine(syslogr)
syslog.writeLine(msg)
syslog.close()
end
function request(req)
write(req .. "? (Y/n) ")
local presel=read()
if presel=="Y" then
reqselect=true
end
if presel=="y" then
reqselect=true
end
if presel=="n" then
reqselect=false
end
return reqselect
end
function write2file(path, array)

  f = fs.open(path, "w")
  for i = 1, #array do
    f.writeLine(array[i])  
  end
  f.close()
end

function readFromFile(path)
  f = fs.open(path, "r")
  local array = {}
  local i = 1
  local temp
  while true do
    temp = f.readLine()
    if not temp then break end
    array[i] = temp
    i = i + 1
  end
  f.close()
  return array
end

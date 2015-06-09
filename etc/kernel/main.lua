--[[
  This is the main upstream file for ccLinux, it handles every system service
  that should be started, and handles controling rc, and the device listener
  and etcetra.
]]

-- Start Device listener
kernel.output('Main is incontrol of threads.', true)

local devlistener = kernel.DIR.."/etc/kernel/devlistener.lua"
local PID = thread.create(devlistener)

-- Do rc
rc.doRunLevel(3)

-- Wait
os.sleep(2)
thread.create(kernel.DIR.."/etc/kernel/hw.lua")

os.sleep(3)
thread.shutdown()

-- Init --
-- Handles processes and starts them uniformly --

rc = {}
function rc.run()
	-- Generate array
	-- Levels: 0, 1, 2, 3, 4, 5
	for i = 1, 5 do
		rc.doRunLevel(i)
	end
end


function rc.doRunLevel(level)
	local path = kernel.DIR..'/etc/rc'..tostring(level)..'.d/'
	if not fs.exists(path) then -- arg, panictrap. Will make the files before panicking.
		fs.makeDir(path)

		-- Use an actual traceback... - Didn't know traceback - <3
		kernel.output('Could not open ' .. path .. ' for a runlevel. Generated.')
	end

	local files = fs.list(path)
	-- Start --
	kernel.output('RC: Started runlevel '..tostring(level), true)



	for i = 1, #files do
		os.run({}, path..files[i])
	end

	-- Exit --
	kernel.output('RC: Exiting runlevel '..tostring(level), true)

	return true
end

return rc

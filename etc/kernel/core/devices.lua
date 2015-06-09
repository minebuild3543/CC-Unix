devices = {}
devices.ids = { }
devices.dev = { nil }

-- Generate a device id.
function devices.genId(side, tp)
	local ids = Set (devices.ids)
	local id=getRandomString('xxxyxyxyxxyxxxyxyxx')
	if ids[id] then
		kernel.output('Notice: got a already used ID')
		return devices.genId(side, tp)
	else
        -- Create device object
		local obj = {}
		obj.type=tp
		obj.id=id
		obj.side=side
		kernel.output('obj.side='..side..' / obj.type='..tp, true);
		table.insert(devices.ids, id)
		table.insert(devices.dev, obj)
		return id
	end
end

-- Return the side of a currently registered device, if it's registered it exists.
-- otherwise return null
function devices.get(type)
	for i, dev in ipairs(devices.dev) do
		if(dev.type==type) then
			-- NTS: Path to return a table if multiple ones.
			return dev.side
		end
	end
end

-- Get all devices on this machine, and register them.
function devices.getAll(this)
	sides = {'front', 'back', 'left', 'right', 'bottom', 'top'}
	for i, side in ipairs(sides) do
		if(peripheral.isPresent(side)) then
			tp=peripheral.getType(side)
			id=devices.genId(side, tp)
			kernel.output('['..tp..'] ID: '..id..' registered')
		end
	end
end

-- Unload a device and have no more handles, or etc on it.
function devices.unload()
	for i, dev in ipairs(devices.dev) do
		kernel.output('['..dev.type..'] ID: '..dev.id..' removed')
	end
end

-- This should never be called without some sort of core API requiring and doing something
-- with the object.
function devices.loadDriver(driver, tpe)
	-- Check if it exists, else panic. (essential function presumed)
	if not (fs.exists(kernel.DIR..'/etc/drivers/'..tpe..'/'..driver..'.lua')) then
		kernel.panic('Tried to load a non-existent driver', 19, 'drivers->loadDriver()')
	end

	kernel.output('Dyn loading driver \''..driver..'\'', true)

	local a = loadfile(kernel.DIR..'/etc/drivers/'..tpe..'/'..driver..'.lua')

	-- Check if we had a syntax error.
	if a==nil or type(a)=='string' then
		sleep(1)
		kernel.panic('Couldn\'t load driver, a is '..type(a)..'. Probably a syntax error.', 20,
		string.format('drivers->loadDriver(\'%s\', \'%s\') [a=\'%s\']', driver, tpe, tostring(a)))
	end

	-- Readonly by default, because core.
	local t=a()

	-- Return driver object
    kernel.output('Driver object [t] is type '..type(t), true)
	return t
end

return devices

ram = {}
ram.type = {}

function ram.init()
	if not (fs.exists(kernel.DIR..'/vram')) then
		kernel.panic('./vram missing', 2, 'ram->init()')
	end
end

--[[ram.flush =function()
	-- Use FS object to delete either all files in VRAM folder, or itself and recreate.
	fs.delete(kernel.DIR..'/vram')
	fs.makeDir(kernel.DIR..'/vram')
	kernel.output('/ram/ flushed')
end]]--

-- @return ram object
ram.write = function(data)
	-- NTS: Check confliction --
	local id=getRandomString('xxyxyxyxxxxyxyxxyxyxxyxyxxxxyxxxxyx')

	-- If table, serialize to JSON --
	if(data==table) then
		local data = JSON:encode(data)
		local tpe='table'
	else
		local tpe='plain'
	end

	-- Generate Object for ram.type --
	local obj = {}
	obj.type=tpe
	obj.id=id

	-- Define type --
	table.insert(ram.type, obj)

	-- Write the File --
	local rf = fs.open(kernel.DIR..'/vram/'..id, 'w')
	rf.write(data)
	rf.close()

	-- Return the RAM ID --
	return id
end

ram.get = function(id)
	-- Get Type --
	for i, robj in ipairs(ram.type) do
		if(robj.id==id) then
			local tpe=robj.type
			local exists=true
		end
	end

	-- Open RAM file --
	local rf = fs.open(kernel.DIR..'/vram/'..id, 'r')
	local con = rf.readAll()

	-- Parse JSON, if it's a table --
	if(tpe==table) then
		local con = JSON:decode(con)
	end

	rf.close()

	return con
end

return ram

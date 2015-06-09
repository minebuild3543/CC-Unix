-- http://lua-users.org/wiki/LuaCompilerInLua

luajit = {}
luajit.version = "1"
luajit.header = '{ "luac": { "version": "'..luajit.version..'" } }'.."\n"

function luajit.compile(inf, out)
	local chunk = {}

	if(type(inf)=="table") then
		for _, file in ipairs(inf) do
	  	chunk[#chunk + 1] = assert(loadfile(file))
		end
	else
		if(type(inf)=="string") then
			chunk[1] = assert(loadfile(inf))
		end
	end

	if #chunk == 1 then
	  chunk = chunk[1]
	else
	  -- combine multiple input files into a single chunk
	  for i, func in ipairs(chunk) do
	    chunk[i] = ('loadstring%q(...);'):format(string.dump(func))
	  end
	  chunk = assert(loadstring(table.concat(chunk)))
	end

	-- Return the encoded string
	return luajit.header..base64.enc(string.dump(chunk))
end

function luajit.run(file)
	-- Open the file for reading
	local gc = fs.open(file, "r")

	-- Get the header, and parse it.
	local gchead = gc.readLine()
	local gcheadobj = JSON:decode(gchead)

	-- Check the luac version it was created with
	if not (gcheadobj.luac.version == luajit.version) then
		print("FAIL")
		print("Can't execute luac, not right version")
		return 1
	end

	-- Get 2nd line contents, then return it
	local gccont = base64.dec(gc.readLine())
	gc.close()

	-- Run the file
	os.sleep(1)
	loadstring(gccont)()
end

-- Pass to ext object
return luajit

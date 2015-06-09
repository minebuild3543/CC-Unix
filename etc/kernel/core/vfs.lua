vfs = {}
ofs = {}

-- Hack to get around fs.getSize() not returning REAL file size.
function vfs.getNumBytes(file)
  local hFile
  local byte
  local byteCount = 0

  -- Open file
  local hFile = fs.open(file, 'rb')

  -- Count bytes
  repeat
        byte = hFile.read()
        if byte ~= nil then byteCount = byteCount + 1 end
  until byte == nil

  -- Close file handle
  hFile.close()

  -- Return size
  return byteCount
end

function vfs.genUUID()
	return getRandomString('xxyyxy-xxxxyxxyxyxx-xyyyyx')
end

function vfs.getSize(file)
  -- Get filename-part of file path.
  local name = string.match(file, '[^%s/\.]+$')
  -- Kindly ask fs.getSize for its opinion about the supposed file-size
  local fileSize = fs.getSize(file)

  if fileSize > 512 then
        return fileSize - #name   -- Minus the filename, as fs.getSize() counts that with large files as well.
  else
        -- Need to count the bytes due to behaviour of fs.getSize()
        return vfs.getNumBytes(file)
  end
end

function vfs.register(nfs)
    -- Load the driver
	local afs = devices.loadDriver(nfs, 'fs')

    -- Check if it's the loopback normal driver.
    if not (afs.isNormal==nil) then
        if(afs.isNormal) then
            kernel.output('Registered fs \''..nfs..'\'', true)
            return true
        end
    end
    
	-- Replace fs.write and fs.read + more functions with out <native> vfs driver that's registered.
    -- These will only go into the vfs space scope, so it's safe to keep them.
    ofs = {}
    ofs = copytable(fs)

    -- Check to make surce copy worked.
    if not type(ofs)=='table' then
        kernel.panic('FS Failed too load, ofs not type table', 30, 'vfs->register()')
    end

    -- Print out what type we have.
    kernel.output('FS obj [afs] is type '..type(afs), true)
    kernel.output('FS obj [fs] is type '..type(fs), true)

	-- FS Object overrides for insurance that everything uses this transparently.
    fs = {}
    fs = copytable(afs)

    -- Check to make surce copy worked.
    if not type(afs)=='table' then
        kernel.panic('extFS Failed too load, afs not type table', 30, 'vfs->register()')
    end

    -- Check to see if we can mount this FS anywhere but /
	if(afs.isMountable) then
		fs.mount = afs.mount
	else
		fs.mount = function()
			return false, 'FS doesn\'t support non / mounting.'
		end
	end

	-- Output that we're registering a new fs.
	kernel.output('Registered fs \''..nfs..'\'', true)
end

return vfs

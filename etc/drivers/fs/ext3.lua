-- The active filesystem object.
afs = {}
afs.isMountable = false
afs.drive=false

-- This will overwrite the fs.write object.
function afs.write(data, location)
  if (fs.drive==false) then
      return false, 'DRIVENOTLOADED'
  end

	-- Get filename with regexp
	local filename = location:match('([^/]+)$')
	local filepath = location:match('(.*[/])')

	if (fs.exists(location)) then
		return false, 'FILEALREADYEXISTS'
	end

	-- Generate an INODE with filename.
	local inode={}
	inode.created=timer.getTime()
	inode.mode=000
  inode.isFile=true
	inode.owner='nothing'
	inode.size='nothing'

    -- Get Drive Object
	local d = afs.getDriveObject()
  kernel.output('Drive has \''..type(d.superblock)..'\' type superblock', true)

	-- Check encryption settings
	if(d.superblock.encrypted) then
		inode.data=base64.enc(aeslua.encrypt(afs.password, data))
	else
		inode.data=base64.enc(data)
	end

  -- Write new file inode
  if d.files==nil then
      d.files={}
  end
  d.files[location] = inode

  -- Encode it in JSON
  de = JSON:encode(d)

  kernel.output('Writing: \''..de..'\'', true)

	-- Write the fs object
  kernel.output('Writing data to \''..tostring(fs.drive)..'\' drive', true)
	local dr = ofs.open(fs.drive, 'w')
	dr.write(de)
	dr.close()

  return true, 'FILEWRITTEN'
end

-- Create a new filesystem (partition)
-- size: How big can the FS get?
-- label: What is the name of this FS.
-- Encrypt: true/false on AES encryption.
function afs.new(size, label, encrypt)
  if(ofs.exists(kernel.DIR..'/'..label..'.vfs')) then
    kernel.output('Drive already exists', true)
    return false, 'DRIVEALREADYEXISTS'
  end

	if(label==nil) then
		label=vfs.genUUID()
	end

	if not (encrypt==true) and not(encrypt==false) then
		return false
	end

	kernel.output('Creating ext3 partition with LABEL \''..label..'\'')

  -- Check if need to get password
  if(encrypt==true) then
    term.write('New Volume Password: ')
		password = read('')
  end

  local tef = base64.enc(aeslua.encrypt(password, "ISVALID"))

	-- EXT superblock.
	local superblock = {}
	superblock={}
	superblock.max_size=size
  superblock.fsversion=101
	superblock.size=0
	superblock.label=label
	superblock.files=0
	superblock.dirs=0
	superblock.encrypted=encrypt
  superblock.encryptiontest=tef

	-- Final Object (FS)
	local tw={}
  tw.files={}
	tw.superblock=superblock

	-- Encode the object
	local twj=JSON:encode(tw)

	-- Write the Object. You must save the return value of ofs.open() to a var, then call var.write(stuff), not ofs.write(stuff).
  local file = ofs.open(kernel.DIR..'/'..label..'.vfs', 'w')
	file.write(twj)
	file.close()
	return true
end

function afs.delete(location)
  if(fs.exists(location)) then
    local d = afs.getDriveObject()
    d.files[location]=nil

    -- Write the new drive object
    local dr = ofs.open(fs.drive, 'w')
    dr.write(de)
    dr.close()
  end
end

-- Reads drive object from disk.
function afs.getDriveObject()
	if not (fs.drive==false) then
    kernel.output('Getting drive object for drive \''..tostring(fs.drive)..'\'', true)

    -- Put drive object into memory aka whole drive.
		local d = ofs.open(fs.drive, 'r')
		local dc = d.readAll()
		local dp = JSON:decode(dc)

    -- Return drive object
		return dp
	else
    return false, 'DRIVENOTOPEN'
  end
end

function afs.exists(location)
	local drive = afs.getDriveObject()

	-- One dir only right now.
	if(filename==nil) or (filename=='') then
    if not (drive.files[location]==nil) then
      kernel.output("File exists", true)
      return true, 'FILEEXISTS'
    end
  end

	-- If it existed, it would've returned, so that must mean it doesnt (if we have reached this point)
	return false, 'FILEDOESNTEXIST'
end

--[[
    @desc  Gets the final component of a pathname.
    @param {string} path
]]--
function afs.getName(path)
	return path:match('([^/]+)$')
end

function afs.open(location, mode)
  local d = afs.getDriveObject()
  local obj = {}
  obj.location=location

  if mode=='r' then
    obj.readAll = function(this)
    if(this==nil) then
      return false, "DIDDNTUSECOLON"
    end

    if not (fs.exists(this.location)) then
      return false, 'FILENOTFOUND'
    end

    -- Put drive into memory.
    local d = fs.getDriveObject()

    if(fs.exists(this.location)) then
      if(d.superblock.encrypted) then
        return aeslua.decrypt(afs.password, base64.dec(d.files[this.location].data))
      else
        return base64.dec(d.files[this.location].data)
      end
    end

    obj.close = function()
      return true
    end

    return obj
  end

  if mode=='rb' then
    obj.write = function()
      return true
    end

    return obj
  end

  if mode=='w' then
    obj.write = function(this, data)
      if(this==nil) then
        return false, "DIDDNTUSECOLON"
      end
      fs.write(data, this.location)
    end
    obj.writeLine = function(data)
      if(this==nil) then
        return false, "DIDDNTUSECOLON"
      end
      fs.write(data+'\n', this.location)
    end
    obj.close = function()
      return true
    end

    return obj
  end

  if mode=='wb' then
      obj.close = function()
        return true
      end

      return obj
  end
end

-- Creates a directory
function afs.makeDir(location)
	if not (afs.exists(location)) then
    local inode={}
    inode.created=timer.getTime()
    inode.mode=000
    inode.isFile=false
    inode.owner='nothing'
	  afs.files[location]=inode

    -- Write new file inode
    if d.files==nil then
      d.files={}
    end
    d.files[location] = inode

    -- Encode it in JSON
    de = JSON:encode(d)

    kernel.output('Creating directory \''..location..'\'', true)
    local dr = ofs.open(fs.drive, 'w')
    dr.write(de)
    dr.close()

		return true
	end

  -- Exists, don't make and return false
	return false
end

function afs.loadDrive(drive)
	if(ofs.exists(drive)) then
    fs.drive=drive
    local d = afs.getDriveObject()

    -- Check if drive is actually a drive.
    if(d==false) or (d==nil) then
      kernel.output('Could not load drive \''..drive..'\'!')
      return false, 'DRIVENOTLOADED'
    end

    -- Check if drive is encrypted
		if(d.superblock.encrypted) then
		  term.write('Volume Password: ')
			local pass = read('')
			afs.password = pass
		end

    local dc = aeslua.decrypt(afs.password, base64.dec(d.superblock.encryptiontest))
    if not (dc=="ISVALID") then
      -- Remove drive object.
      fs.drive=false
      term.write('Not mounting drive, incorrect password')
      return false, "INCORRECTPASSWORD"
    end

    kernel.output('Drive \''..drive..'\' loaded')
    return true, 'DRIVELOADED'
	else
		return false, 'DRIVENOTFOUND'
	end
end

return afs

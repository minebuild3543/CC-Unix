-- (c) 2014 RDashINC
--
-- Linux kernel, in computercraft.
-- Will at one point adheed to Linux Kernel standards.
-- Open Source, and object oriented.
--
-- License: MIT
-- Author: RainbowDashDC
-- Contributors: see CREDITS
-- URL: http://github.com/ccLinux/kernel
--
-- Specifications & Planning moved to: http://bit.ly/11Fx45o

-- Main Functions of the kernel --

-- Using Globals, so incase we're in a developer env (no reboot to clear _G),
-- we clear it ourselves
-- os.pullEvent = os.pullEventRaw
_G['debug_flag']=false
_G['quiet_flag']=false
_G['root_flag']=false
_G['shell_flag']=false
_G['log_flag']=false

local Args={...}

-- Helper Functions --
_G['Set'] = function(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

-- @see http://bit.ly/1FI4PSn
_G['copytable'] = function(source)
    local function copyTableInternal(source, seen)
        if type(source) ~= 'table' then return source end
        if seen[source] then return seen[source] end

        local rv = {}
        seen[source] = rv
        for k,v in pairs(source) do
            rv[copyTableInternal(k, seen)] = copyTableInternal(v, seen)
        end
        return rv
    end

    return copyTableInternal(source, {})
end

-- @see https://gist.github.com/jrus/3197011
local random = math.random
_G['getRandomString'] = function(template)
	return string.gsub(template, '[xy]', function (c)
	local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
		return string.format('%x', v)
	end)
end
--[[
  Split has been deprecated in favor of <string>:split.

  This will be removed in 0.1.0.3
]]--
_G['split'] = function(s,re)
  kernel.output("_G[\"split\"] is deprecated.")
	local i1 = 1
	local ls = {}
	local append = table.insert
	if not re then re = '%s+' end
		if re == '' then return {s} end
		while true do
			local i2,i3 = s:find(re,i1)
			if not i2 then
				local last = s:sub(i1)
				if last ~= '' then append(ls,last) end
				if #ls == 1 and ls[1] == '' then
					return {}
				else
					return ls
				end
			end
			append(ls,s:sub(i1,i2-1))
			i1 = i3+1
		end
end

--[[
  <string>:split

  @desc seperate a string by delimiter
  @param delimiter - delimiter to split with
  @returns class
]]--
function string:split( delimiter )
    if type( delimiter ) == "string" then
        local result = { }
        local from = 1
        local delim_from, delim_to = string.find( self, delimiter, from )
        while delim_from do
            table.insert( result, string.sub( self, from , delim_from-1 ) )
            from = delim_to + 1
            delim_from, delim_to = string.find( self, delimiter, from )
        end
        table.insert( result, string.sub( self, from ) )
        return result
    elseif type( delimiter ) == "number" then
        return self:gmatch( (".?"):rep( delimiter ) )
    end
end

_G['getRandomNumber'] = function(min, max)
	return math.random(min, max)
end

_G['readonlytable'] = function(table)
   return setmetatable({}, {
     __index = table,
     __newindex = function(table, key, value)
                    kernel.panic('Attempt to modify a readonlytable', 12,
                     debug.traceback())
                  end,
     __metatable = false
   });
end

--[[
    The main method in the new class system.
    (please consult /doc/classes.md for a more in-depth explanation)

    Creates a class out of an optional subclass and a constructor method.
    This returns a table that can be modified normally.
    The constructor does not provide the self variable by itself:
    You'll need to add in a parameter.
    For example, if you need to pass a name and age to a constructor
    the params will be instance, name and age.

    The markdown documentation contains more information about this specific
    method.
]]--
function _G.class(base, init)
    local c = {}    -- a new class instance
    if not init and type(base) == 'function' then
        init = base
        base = nil
        elseif type(base) == 'table' then
            -- our new class is a shallow copy of the base class!
            for i,v in pairs(base) do
                c[i] = v
            end
            c._base = base
        end
        -- the class will be the metatable for all its objects,
        -- and they will look up their methods in it.
        c.__index = c

    -- expose a constructor which can be called by <classname>(<args>)
    local mt = {}

        mt.__call = function(class_tbl, ...)
        local obj = {}
        setmetatable(obj,c)
        if init then
            init(obj,...)
        else
            -- make sure that any stuff from the base class is initialized!
            if base and base.init then
                base.init(obj, ...)
            end
        end
        return obj
    end

    c.init = init
    c.isSubclassOf = function(self, klass)
        local m = getmetatable(self)
        while m do
            if m == klass then return true end
            m = m._base
        end
        return false
    end

    function c:equals (otherObject)
        if not otherObject:isSubclassOf(self) then
            return false
        else
            for i = 1, #otherObject do
                if not otherObject[i] == self[i] then
                    return false
                end
            end
        end

        return true
    end

    function c:clone ()
        return c
    end

    function c:toString ()
        local mt = getmetatable(self)
        if mt.__tostring then
            return mt.__tostring()
        end

        return tostring(self)
    end

    function c:include ( mixin )
        for k,v in pairs(mixin) do
            c[k] = mixin[k]
        end
    end

    setmetatable(c, mt)
    return c
end

function printf (fmt, ...)
    print(string.format(fmt, ...))
end


-- End --

-- Kernel --
kernel         = {}
computer       = {}
kernel.apis    = {}
kernel.DIR     = '/kernel' -- blank for root directory. (no trailing slashes)
kernel.dir     = kernel.DIR
kernel.version ='0.1.0.2-rc2'

function kernel.output(msg, debug)
  -- Log the output no matter what flags.
  kernel.log(msg)

	if not (_G['quiet_flag']) then
    if not (debug_flag) then
      if(debug) then
        return false
      end
    end

		term.write('['..tostring(timer.getTime())..']: '..tostring(msg))
		kernel.newline()

    -- We were outputed.
    return true
  else
    return false
  end
end

function kernel.log(msg)
  msg='['..timer.getTime()..']: '..tostring(msg).."\n"

  local log = fs.open(kernel.DIR..'/kernel.log', 'a')
  log.write(msg)
  log.close()

  return true;
end

function kernel.newline()
	print('')
end

function kernel.cleanup()
  -- Reset Term
  pcall(term.clear)
  term.setCursorPos(1,1)

	-- Unload Devices, de-register them, etc --
	pcall(devices.unload)

	-- Flush vRAM --
  pcall(ram.flush)

	-- Write stopped to STDIN --
	kernel.output('Will now halt')

	-- End --
	if not (_G['shell_flag']) then
		os.shutdown()
	end
end

function kernel.getType()
	if not (term.isColour()) then
    if (pocket) then
      computer.type='pc'
		  return 'pocket computer'
    else
      computer.type='c'
      return 'standard computer'
    end

    -- Set color
    computer.isColor=false
  else
    if (pocket) then
      computer.type='advpc'
      return 'advanced pocket computer'
		else
      computer.type='advc'
      return 'advanced computer'
		end

		-- Set color
		computer.isColor=true
	end
end


function kernel.loadAPI(api, t)
	-- Core or ext
	local path = '/etc/kernel/'..(t == 'core' and 'core' or 'ext/'..api )

  if(t=='class') then
    kernel.output('kernel: API is using class wrapper', true)
    path = '/etc/kernel/core/classes'
  end

	if not (fs.exists(kernel.DIR..path..'/'..api..'.lua')) then
    -- Return false because file doesn't exist, or isn't setup correctly.

    kernel.output('kernel: Failed to load api \''..api..'\'')
    kernel.output('kernel: path='..kernel.DIR..path..'/'..api..'.lua', true)
		return false
	else
		if(t=='core') then

			kernel.output('Loading core api \''..api..'\'', true)

			local i,err = loadfile(kernel.DIR..path..'/'..api..'.lua')
            -- print(kernel.DIR..path..'/'..api..'.lua')
			if(i==nil) then
				kernel.panic(
         string.format('kernel: Couldn\'t load API, i is \'%s\'.Syntax error?',
         type(i)),27,err)
			end

      local coi=copytable(_G)
      coi.kernel        = kernel
      coi.timer         = timer
      coi.devices       = devices
      coi.thread        = thread
      coi.threads       = threads
      coi.base64        = base64
			setfenv(i, coi)

			-- Readonly by default, because core.
			local t=i()

      -- Add too loaded APIs List
      table.insert(kernel.apis, api)

      if (type(t)=='table') then
        if not (t[api]==nil) then
          kernel.output("Returned multiple objects.", true)

          for i, k in pairs(t) do
            kernel.output('Adding object \''..tostring(i)..'\'', true)

            if not (kernel.apis[i]==nil) then
              kernel.panic('API confliction, '..tostring(i)..' is SET', 22, 'kernel->loadApi('..api..')')
            end

            -- Add to loaded APIs
            table.insert(kernel.apis, i)

            -- Return object
            _G[i]=k
          end
        else
          _G[api]=readonlytable(t)
        end
      else
        _G[api]=readonlytable(t)
      end
		else
			if(t=='ext') then
				kernel.output('Loading external api \''..api..'\'', true)

				local i,err = loadfile(kernel.DIR..path..'/'..api..'.lua')

				-- Check if we had some sort of load issue.
				if(i==nil) then
						kernel.panic(
             string.format('Couldn\'t load API, i is  \'%s\'. Syntax error?',
             type(i)),27,err)
				end

				setfenv(i, _G)

				_G[api]=i()

        -- Add too loaded APIs List
        table.insert(kernel.apis, api)
			else
          kernel.output('Loading class api \''..api..'\'', true)

          -- Load API
          local i,err = loadfile(kernel.DIR..path..'/'..api..'.lua')

          -- Check if an error occured.
          if(i==nil) then
            kernel.panic(
            string.format('Couldn\'t load API, i is  \'%s\'. Syntax error?',
            type(i)),27,err)
          end

          -- Set enviroment
          setfenv(i, _G)

          -- Execute
          local t=i()

          if (type(t)=='table') then
            if not (t[api]==nil) then
              kernel.output("Returned multiple objects.", true)

              for i, k in pairs(t) do
                kernel.output('Adding object \''..tostring(i)..'\'', true)

                if not (kernel.apis[i]==nil) then
                  kernel.panic('API confliction, '..tostring(i)..' is SET', 22, 'kernel->loadApi('..api..')')
                end

                -- Add to loaded APIs
                table.insert(kernel.apis, i)

                -- Return object
                _G[i]=k
              end
          else
            kernel.output('t is not table, t=type('..type(t)..')')
            _G[api]=readonlytable(t)
          end

          -- Add too loaded APIs List
          table.insert(kernel.apis, api)
        end
      end
		end

		-- No error
		return true
	end
end



function kernel.panic(msg, code, traceback)
  -- Reset Term
  pcall(term.clear)
  term.setCursorPos(1,1)

	-- Kernel Panic Info
	local kpt=timer.getTime()

	-- Error exit
	-- pcall must have name of function not function()
  -- (Otherwise you run it beforehand!)
	if not (devices==nil) then
		pcall(devices.unload)
	end
	if not (ram==nil) then
		pcall(ram.flush)
	end
	pcall(timer.stop)

  -- Display panic
	print('('..code..') Kernel panic - at time ' .. kpt)
	kernel.newline()
	print('('..code..') Kernel panic - not syncing: '..tostring(msg))
	kernel.newline()
	if(debug_flag) then
		print('('..code..') Trace: ')
		print(traceback)
	else
		print('('..code..')',  'Stack trace witheld, run with \'debug\' for one')
	end
    kernel.newline()
    term.write('('..code..') Invoked: ')
    for i, v in ipairs(Args) do
        term.write(v)
        term.write(' ')
    end
    kernel.newline()
	print('('..code..') kernel.DIR: '..kernel.DIR)
    print('('..code..') Version: '..kernel.version)

	-- The linux kernel doesn't exit, nor does it return
	-- Thus we make a loop that can only be terminated via reboot.
	while true do sleep(0) end
end
-- End --

-- Timer --
timer = {}
function timer.start()
	timer.startTime=os.clock()
end

function timer.getTime()
	if not (timer.startTime==nil) then
		return tostring(os.clock()-timer.startTime)
	else
		return nil
	end
end
-- End --

-------------------------------------------------------------------------
-- ccLinux
-------------------------------------------------------------------------

if not fs.exists(kernel.dir .. '/vram') then
    fs.makeDir(kernel.dir .. '/vram')
end

-- Start Execution --
timer.start()
for i, v in ipairs(Args) do
  -- fixes split bug/
  v=v..'='

  -- Singluar no argument args
	if(v=='quiet=') then
		_G['quiet_flag']=true
	else
		if(v=='debug=') then
			_G['debug_flag']=true
			_G['shell_flag']=true
		else
			if(v=='shell_dump=') then
				_G['shell_flag']=true
			else
        if(v=='log=') then
          _G['log_flag']=true
        end
      end
		end

    -- Use arguments ones
    local a = v:split('=')
    if not (a==nil) then
      -- Change device root
      if(a[1]=="root") then
        kernel.DIR=a[2]
        kernel.dir=kernel.DIR
      end
    end
	end
end

-- Remove old logs if they exists
-- should be in var at one point
if (fs.exists(kernel.DIR..'/kernel.log')==true) then
  fs.delete(kernel.DIR..'/kernel.log')
end

-- Create a new log.
local l = fs.open(kernel.DIR..'/kernel.log', 'w')
l.write('')
l.close()

kernel.output('ccLinux v'..kernel.version);

-- Where are we? --
kernel.output('Base: '..kernel.DIR)

-- What are we? --
kernel.output('Got '..kernel.getType())

-- Set globals, yes they are apparently different!
-- Helps with scopes. APIs and threads will have access to only _G functions.
_G['kernel'] = readonlytable(kernel)
_G['timer'] = readonlytable(timer)
_G['shell'] = shell
_G['os'] = os
_G['fs'] = fs

-- Load Core APIs
-- Notice the 2nd parameter 'core', it's different than ext.
kernel.loadAPI('ram', 'core')
kernel.loadAPI('devices', 'core')
kernel.loadAPI('thread', 'core')
kernel.loadAPI('links', 'core')
kernel.loadAPI('debug', 'core')
kernel.loadAPI('vfs', 'core')
kernel.loadAPI('rc', 'core')

-- Load external APIs
kernel.loadAPI('aeslua', 'ext')
kernel.loadAPI('JSON', 'ext')
kernel.loadAPI('luajit', 'ext')
kernel.loadAPI('base64', 'ext')
kernel.loadAPI('sha', 'ext')
kernel.loadAPI('libcomp', 'ext')

-- Load MatAlcDev class APIs
kernel.loadAPI("utils", "class")

-- Initalize RAM --
kernel.output('Initializing RAM', true)
ram.init()


-- Running INIT --
-- Run 0 before anything for updates and etc --
rc.doRunLevel(0)

-- Initialize devices, and objects --
devices.getAll();

-- Thread Test --
thread.start(function()
  local tid=thread.getThreadID()
  thread.listener(kernel.DIR..'/etc/kernel/main.lua', tid)
end)

-- Return to shell, we must've not shutdown
return true

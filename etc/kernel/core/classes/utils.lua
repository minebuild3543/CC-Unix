local Object = class( function() end )

function Object:include ( otherClass )
    function c:include ( mixin )
        for k,v in  pairs(mixin) do
            c[k] = mixin[k]
        end
    end
end

function Object:toString ()
    local mt = getmetatable(self)
    if mt.__tostring then
        return mt.__tostring()
    end

    return tostring(self)
end

function Object:clone ()
    return self
end

function Object:equals (otherObject)
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

local File = class(Object,
    function (c, path)
        c.path = path
    end
)

function File:write (data)
    local handle = fs.open( self.path, (fs.exists( self.path ) and 'a' or 'w' ))
    if type(data) == 'string' then
        handle.write (data)
    elseif type(data) == 'number' then
        handle.write (tostring(data))
    elseif type(data) == 'table' then
        for i = 1, #data do
            handle.write (data[i])
        end
    end
    handle.close()
end

function File:create ()
    self:write(' ')
end


function File:read ()
    local handle = fs.open( self.path, 'r' )
    local data = handle.read()
    handle.close()

    return data
end

function File:print (data)
    local handle = fs.open( self.path, (fs.exists( self.path ) and 'a' or 'w' ))

    if type(data) == 'string' then
        handle.write (data .. '\n')
    elseif type(data) == 'number' then
        handle.write (tostring(data) .. '\n')
    elseif type(data) == 'table' then
        handle.write (table.concat(data, ' '))
        handle.write('\n')
    end

    handle.close()
end

function File:writeBin(data)
    assert(type(data) == 'number', 'Must pass a number to File:writeBin(). ')
    local handle = fs.open( self.path, 'wb' )
    handle.write(data)
    handle.close()
end

function File:read ()
    local handle = fs.open( self.path, 'rb' )
    local data = handle.read()
    handle.close()

    return data
end

function File:readLine ()
    local handle = fs.open( self.path, 'r' )
    local data = handle.readLine()
    handle.close()

    return data
end

function File:readAll ()
    if not fs.exists(self.path) then
        self:create()
    end

    local handle = fs.open( self.path, 'r' )
    local data = handle.readAll()
    handle.close()

    return data
end

function File:readJSON ()
    if not fs.exists(self.path) then
        self:create()
    end

    local handle = fs.open( self.path, 'r' )
    local data = JSON:decode(handle.readAll())
    handle.close()

    return data
end

function File:writeJSON (data)
    local handle = fs.open( self.path, (fs.exists( self.path ) and 'a' or 'w' ))
    handle.write(JSON:encode (data))

    handle.close()
end


function File:delete ()
    fs.delete (self.path)
    self = nil
end

function File:size ()
    return fs.getSize (self.path)
end

function File:isReadOnly ()
    return fs.isReadOnly (self.path)
end

function File:isReadWrite ()
    return not self:isReadOnly()
end

function File:getName ()
    return fs.getName (self.path)
end

function File:getDrive ()
    return fs.getDrive (self.path)
end

function File:exists ()
    return fs.exists (self.path)
end

local Logger = class (File,
    function (c, path)

        c.file = File(path)
    end
)

function Logger:print (...)
    self.file:print( {'[', textutils.formatTime(os.time(), false), '] ', ...} )
    print('[', textutils.formatTime(os.time(), false), '] ', ...)
end

function Logger:write (...)
    self.file:write( {'[', textutils.formatTime(os.time(), false), '] ', ...} )
    io.write('[', textutils.formatTime(os.time(), false), '] ', ...)
end

function Logger:wipe ()
    self.file:delete()
end

local obj = {}
obj.Logger=Logger
obj.File=File
obj.Object=Object

return obj

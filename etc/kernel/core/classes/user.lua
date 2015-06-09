if not File then
    kernel.loadAPI("utils", "class")
    if not File then
        error('Failed to load File class.')
    end
end

User = class(
    function (c,id, name, pass, group)
        local passwd = File(kernel.dir .. '/etc/passwd'):readJSON() or {}

        if not passwd[id] then
            self.name = name
            self.id = id
            self.pass = sha.sha256(pass)
            self.group = group
            passwd[id] = {['name'] = self.name, ['pass'] = self.id, ['group'] = self.group}
        else
            self.name = passwd[id]['name']
            self.pass = passwd[id]['pass']
            self.group = passwd[id]['group']
        end

        File(kernel.dir .. '/etc/passwd'):delete()
        File(kernel.dir .. '/etc/passwd'):writeJSON(passwd)

    end

)

function User:identify(password)
    local hash = sha.sha256(password)
    if self.pass == hash then
        return true
    end

    return false
    --[[
    Simple function to compare a given password with the stored one.
    ]]
end

function User:destroy ()
    local passwd = File(kernel.dir .. '/etc/passwd'):readJSON()

    if not passwd[id] then
        --[[
            No-op.
        ]]
    else
        passwd[id] = nil
    end

    File(kernel.dir .. '/etc/passwd'):delete()
    File(kernel.dir .. '/etc/passwd'):writeJSON(passwd)
end

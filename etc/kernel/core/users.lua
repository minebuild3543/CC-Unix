users = {}
users.userdata = {}

users.loadusers = function()
	local passwd = io.open(kernel.DIR..'/etc/passwd', 'r')
	for line in passwd:lines() do
		uid, username, passhash, group = split(':', line)
		users.userdata[uid] = {}
		users.userdata[uid]['username'] = username
		users.userdata[uid]['passhash'] = passhash
		users.userdata[uid]['group'] = group
	end
	passwd:close()
end

users.newuser = function(username, password, group)
	local passwd = io.open(kernel.DIR..'/etc/passwd', 'a')

	-- Do more, then write it

	return true
end

-- end Core API
return users

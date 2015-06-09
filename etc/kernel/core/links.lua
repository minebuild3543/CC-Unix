links = {}

links.getLink = function(f)
	-- restrict scope
	local file = fs.open(f, 'r')

	-- Check if it's a link file or not.
	if file.readLine()=='link' then
		local contents = file.readLine()
		file:close()

		-- use conventional contents return
		return contents
	else
		-- conventional return false on error
		return false
	end
end

return links

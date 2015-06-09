-- Wraps lsd_main, easier than creating a custom class
-- Import functions & etc
dofile(kernel.DIR.."/etc/kernel/ext/lsd/lsd_main.lua")

lsd = {}
lsd.run = function(params)
    lsd.paramaters=params
    main()
end

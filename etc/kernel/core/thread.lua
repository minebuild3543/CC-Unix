thread = {}
threads = {}
threads.tid = 0
threads.lastid=nil
threads.pid = {}
threads.sch = {}
threads.pid_env = {}
threads.thr_env = {}
threads.sch.start = nil
threads.isRunning=nil
threads.sch.w=false

--[[
 Notice: The current architecture does NOT allow a running process to be
 stopped, it may only stop itself.

 Why? Because when you have 2 functions only, you can't have the listener
 always 'listening', the upstream one will always need to be running
 (what if it has a program on it!? That would kill it!),
 thus programs can't be stopped because of how parallel works.

 You may ask, why not just use coroutines, well we did. Well, no, we *attempted*
 too use them, however we could not start unlimited processes with them able to
 yeild, thus breaking thee event system.

 It's not perfect, but in the end it works and is the first.
]]--
function thread.kill(pid)
	threads.pid[pid].status='TERM'
	kernel.output('* Sent TERM to '..tostring(pid))

	return
end

function thread.killed(pid)
	kernel.output('thread: '..pid..' terminated')

	-- Put TERMD and kill PID_ENV, if it still exists, it went ZOMBIE
	threads.pid[pid].status='TERMD'
	threads.pid_env[pid]=nil

	if not (threads.pid_env[pid]==nil) then
		kernel.output(pid..' became a zombie process.')
		threads.pid[pid].status='ZOMBIE'
	end

	return false
end

function thread.status(pid)
	-- No more looping required.

	return threads.pid[pid].status
end

function thread.run(app, pid)
	kernel.output('Creating \''..app..'\' env object', true)
	threads.pid_env[pid] = {}
	-- Add all the loaded APIs to their respective objects
	for i, api in pairs(kernel.apis) do
		kernel.output('thread: Adding \''..api..'\' to obj.', true)
		threads.pid_env[pid][api]=copytable(_G[api])
	end
	threads.pid_env[pid].signal = nil
	threads.pid[pid].status = 'RUNNING'

	kernel.output('Starting \''..app..'\' PID: '..pid)

	-- Run the new object
	kernel.output('Running program \''..app..'\'', true)
	os.run(threads.pid_env[pid], app)

	-- When it finishes executing, it dies.
	thread.killed(pid)
end

function thread.genPid(app)
	function getRandomNumberPID(min, max)
		local pids = Set (threads.pid)
		local pid=getRandomNumber(min, max)
		if pids[pid] then
			kernel.output('Notice: got a already used PID, getting new', true)
			return getRandomNumberPID(min, max)
		else
			return pid
		end
	end

	-- PID object
	local pid = getRandomNumberPID(100, 5000)
	threads.pid[pid] = {}
	threads.pid[pid].pid = pid
	threads.pid[pid].app = app
	threads.pid[pid].ec = 0
	threads.pid[pid].started = timer.getTime()
	threads.pid[pid].status = 'INIT'
	return threads.pid[pid].pid

end

-- Schedule a task to be created --
function thread.create(bin)
	kernel.output('thread: Last ThreadID: '..tostring(threads.lastid), true)

	-- Send it to the last PID's enviroment.
	threads.thr_env[threads.lastid].sch.w=true
	threads.thr_env[threads.lastid].sch.start=bin
	threads.thr_env[threads.lastid].sch.pid=thread.genPid(bin)

	-- Return the new process ID
	return threads.thr_env[threads.lastid].sch.pid
end

-- Get thread ID
function thread.getThreadID()
	threads.tid=threads.tid+1

	threads.thr_env[threads.tid]={}
	threads.thr_env[threads.tid].sch={}
	threads.thr_env[threads.tid].running=true
	threads.thr_env[threads.tid].sch.start=nil
	threads.thr_env[threads.tid].sch.w=false
	threads.thr_env[threads.tid].halt=false

	return threads.tid
end

function thread.listener(app, threadid)
	-- Get PID & set ownership (thread over process)
	threads.thr_env[threadid].pid = thread.genPid(app)
	threads.pid[threads.thr_env[threadid].pid].owner=threadid

	-- Write OUR ID as the last created thread (for upstream threads)
	threads.lastid=threadid

	parallel.waitForAny(function()
		thread.run(app, threads.thr_env[threadid].pid)
		end, function()
			kernel.output('New thread ['..app..'] / ['..threadid..']', true)
			while true do
				-- Define process halt, which should be overwritten at some point.
				-- If not, die.
				threads.thr_env[threadid].halt=true

				-- Start other processes
				if(threads.thr_env[threadid].sch.w) then
					if(threads.thr_env[threadid].sch.start==nil) then
						-- Incase we had some sort of middle of execution issue,
						-- we'd try to recover from it.
						kernel.output('thread: Got a stray threads... sch.start, not fatal.')
						threads.thr_env[threadid].sch.w=false
					else
						-- Get a threadID from thread.getThreadID()
						local tid = thread.getThreadID()

						-- Fixes the loop bug
						threads.thr_env[threadid].sch.w=false

						-- Give the new thread the PID we were given by thread.create()
						threads.thr_env[tid].sch.pid=threads.thr_env[threadid].sch.pid

						-- Start a new listener alongside the app.
						thread.listener(threads.thr_env[threadid].sch.start, tid)

						-- Start accepting connections again
					  -- (if, somehow, we go back a trace? It seems feasible.)
						threads.lastid=threadid
					end
				end

				-- Check if the PID is not already dead or scheduled to die.
				if not (thread.status(threads.thr_env[threadid].pid)=='TERMD') or not
				 (thread.status(threads.thr_env[threadid].pid)=='TERM') then
					threads.thr_env[threadid].halt=false
				end

				-- If we are told to halt.
				if(threads.thr_env[threadid].halt==true) then
					kernel.output('Thread Listen end ['..threadid..']', true)
					threads.thr_env[threadid].running=false
					break
				end

				os.sleep(0)
			end

			-- Return
			return
			end)
		end

		function thread.sendSignal(sig, pid)

		-- If not defined or a signal is already set, then return false.
		if(threads.pid_env[pid]==nil) or
		 not (threads.pid_env[pid].signal==nil) then
			return false
		end

		threads.pid_env[pid].signal = sig

		return true
	end

	function thread.removeSignal(pid)
		if(threads.pid_env[pid]==nil) then
			return false
		else
			threads.pid_env[pid].signal=nil
			return true
		end
	end

	function thread.waitForSignal(sig, pid)
		if(threads.pid_env[pid]==nil) then
			return false
		end

		-- Loop until condition is met
		while true do
			-- If signal equals the one we want, then break
			if(threads.pid_env[pid].signal==sig) then
				break
			else
				-- If we were waiting for <any> signal, then break if we have one.
				if(sig=='any') and not (threads.pid_env[pid].signal==nil) then
					break
				else

					-- Prevents yeild issues.
					os.sleep(0)
				end
			end
		end

		-- Loop broken, true
		return sig, true
	end

	function thread.shutdown()
		kernel.output('thread: Told Main to shutdown', true)

		-- Tell thread we have stopped running, however this has no effect currently
		threads.isRunning=false

	  -- Announce to processes we intend to shutdown within 3 seconds
		kernel.output('thread: Queued KERNELSHUTDOWN event', true)
		os.queueEvent('KERNELSHUTDOWN')

		-- Wait 3 seconds
		os.sleep(3)

		-- Shutdown if not in debug/shell_flag --
		kernel.output('thread: Calling kernel.cleanup')
		pcall(kernel.cleanup)
	end

	function thread.start(main)
		-- Main Loop --
		main()
	end

local wrapper = {}
wrapper.thread = thread
wrapper.threads = threads
return wrapper

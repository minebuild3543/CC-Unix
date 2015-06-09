--debug
local debug={}
local error=_G._error or _G.error

local function wrap(text, limit) --from Kingdaroo
        local lines = {''}
        for word, space in text:gmatch('(%S+)(%s*)') do
                local temp = lines[#lines] .. word .. space:gsub('\n','')
                if #temp > limit then
                        table.insert(lines, '')
                end
                if space:find('\n') then
                        lines[#lines] = lines[#lines] .. word

                        space = space:gsub('\n', function()
                                table.insert(lines, '')
                                return ''
                        end)
                else
                        lines[#lines] = lines[#lines] .. word .. space
                end
        end
        return lines
end

function debug.step_print(s,_term)
  local term=_term or term
  local x,y=term.getSize()
  y=y-1
  local t=wrap(s,x)
  local r=#t%y
  local n=(#t-r)/y
  for i=0,n-1 do
    if i~=0 then write'\n' end
    write(table.concat(t,'\n',i*y+1,(i+1)*y))
    write('\nPress any key to continue')
    os.pullEvent('key')
  end
  write('\n')
  write(table.concat(t,'\n',n*y+1,n*y+r))
  write('\n')
end

function debug.printError( ... )
  if term.isColour() then
    term.setTextColour( colours.red )
  end
  local t={...}
  for i=1,#t do t[i]=tostring(t[i]) end
  debug.step_print(table.concat(t,''),term)
  term.setTextColour( colours.white )
end

--debug.traceback
do
--[[ Notes:
getfenv(1)=getfenv()~=getfenv(0)~~_G
error('',1)~=error('',0)
]]
rawset(_G,'loadfile',function( _sFile )
  local file = fs.open( _sFile, 'r' )
  if file then
    local func, err = loadstring( file.readAll(),_sFile)
    file.close()
    return func, err
  end
  return nil, 'File not found'
end)
local traceback=function(level,terr)
  local terr=terr or {}
  local passed={}
  local err,ok=terr
  local j=2+(level or 0)
  repeat
    j=j+1
    passed[err]=true
    ok,err=pcall(error,'',j)
    if err:match('^[^:]+')=='bios' then break end
    table.insert(terr,err)
  until (passed[err])

  return terr
end

local function classify(t,f)
  local bins={}
  local c
  for i,v in ipairs(t) do
    local fi,r=f(v)
    if fi~=nil then
      if c==nil or c.n~=fi then
        table.insert(bins,c)
        c={n=fi}
      end
      table.insert(c,r)
    end
  end
  table.insert(bins,c)
  return bins
end
local function get_chunks(terr)
  return classify(terr,function(v) return v:match('^([^:]+):(.*)') end)
end

local function get_lines(terr)
  return classify(terr,function(v) return v:match('^(%d+):(.*)') end)
end

local function put_lines(path,diameter,ts,l)
  local ok,f=pcall(fs.open,path,'r')
  if not ok or not f then table.insert(ts,'  (could not open file)')
  else
    for i=1,l-diameter-1 do
      f.readLine()
    end
    for i=1,diameter do
      table.insert(ts,'  '..f.readLine())
    end
    table.insert(ts,'->'..f.readLine())
    for i=1,diameter do
      local l=f.readLine()
      if l then table.insert(ts,'  '..l)
      else break end
    end
  end
end

local function format_traceback(terr)
  local ts={}
  for i,v in ipairs(get_chunks(terr)) do
    local name=v.n or '(no name)'
    local path
    if fs.exists(name) then
      name,dir,path=fs.getName(name),name:match('^(.*)/') or '/',name
      name=name..' ('..(dir or 'unknown')..')'
    elseif false then
      --shell has input string; modify to behave as file?
    end
    table.insert(ts,name)
    for j,line in ipairs(get_lines(v)) do
      table.insert(ts,' line '..(line.n or '(no line)')..', *'..(#line))
      local n=line.n and tonumber(line.n) or 1
      if path and n then
        put_lines(path,1,ts,n)
      end
    end
  end
  return ts
end

function debug.traceback(msg,level)
  local level=level or 0
  local ts=format_traceback(traceback(level+1,{}))
  msg='['..(msg or 'debug.traceback')
  table.insert(ts,1,msg)
  return table.concat(ts,'\n')..'\n]'
end

function debug.printTraceback(msg,level)
  debug.printError(debug.traceback(msg,(level or 0)+1))
end

end


function debug.override()
  rawset(_G,'_error',error)
  rawset(_G,'error',debug.traceback)
  rawset(_G,'printError',debug.printError)
end


return debug

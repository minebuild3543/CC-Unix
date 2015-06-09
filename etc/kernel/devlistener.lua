-- Device listener
-- by MatAlcDev

kernel.output('Device listener started', true)
while true do
  local data = {os.pullEvent()}
  if data[1] == 'peripheral' then
    local id = devices.genId(data[2], peripheral.getType(data[2]))
    printf ("Registered peripheral of type \'%s\' with ID \'%s\'.",
    peripheral.getType(data[2]),
    id
    )
  end
end

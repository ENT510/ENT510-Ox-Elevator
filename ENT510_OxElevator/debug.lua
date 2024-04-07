function debugging(...)
    if Elevator.DebugEnabled then
        local args = { ... }
        local numArgs = select("#", ...)

        for i, arg in ipairs(args) do
            if type(arg) == 'table' then
                table.insert(args, i, json.encode(arg, { sort_keys = true, indent = true }))
                table.remove(args, i + 1)
            else
                args[i] = '^0' .. tostring(arg) 
            end
        end

        local formattedMessage = '^5[DEBUG] ^7' .. table.concat(args, '\t')
        print(formattedMessage)
    end
end
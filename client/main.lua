CreateThread(function()
    local Player = PlayerPedId()
    local shown = false
    local inDistance = false

    while true do 
        local sleep = 1500
        local PVec = GetEntityCoords(Player)
        inDistance = false

        for location, coords in pairs(Config.EnterLocation) do 
            local dist = #(PVec - coords.enter) 
            
            if dist <= 10 then 
                sleep = 0
                DrawMarker(1, coords.enter.x, coords.enter.y, coords.enter.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 66, 165, 245, 255, false, true, 2, false, false, false, false)        
            end

            if dist <= 1 then
                sleep = 0 
                inDistance = true
                if IsControlJustPressed(0, 46) then 
                    ESX.ShowNotification("You have entered the Lab", "success", 3000)
                    SetEntityCoords(Player, coords.inter)
                end
            end
        end

        if not shown and inDistance then 
            ESX.TextUI('Press ~r~[E] ~s~ to enter the Lab')
            shown = true
        end
            
        if shown and not inDistance then 
            ESX.HideUI()
            shown = false
        end
        
    Wait(sleep)
    end
end)

CreateThread(function()
    local Player = PlayerPedId()
    local shown = false
    local inDistance = false

    while true do 
        local sleep = 1500
        local PVec = GetEntityCoords(Player)
        inDistance = false

        for location, coords in pairs(Config.EnterLocation) do 
            local dist = #(PVec - coords.inter) 
            
            if dist <= 10 then 
                sleep = 0
                DrawMarker(1, coords.inter.x, coords.inter.y, coords.inter.z - 1, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 66, 165, 245, 255, false, true, 2, false, false, false, false)        
            end

            if dist <= 1 then
                sleep = 0 
                inDistance = true
                if IsControlJustPressed(0, 46) then 
                    ESX.ShowNotification("You have left the Lab", "success", 3000)
                    SetEntityCoords(Player, coords.enter)
                end
            end
        end

        if not shown and inDistance then 
            ESX.TextUI('Press ~r~[E] ~s~ to leave the Lab')
            shown = true
        end
            
        if shown and not inDistance then 
            ESX.HideUI()
            shown = false
        end
        
    Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end
end)

---- MENU ----

local open = false
local Mainmenu = RageUI.CreateMenu("~p~Location", "~p~Menu")
Mainmenu.Display.Glare = true
Mainmenu.Closed = function() 
    open = false 
end 


---- Function Location ----


function batoplocation()
    if open then 
        open = false 
            RageUI.Visible(Mainmenu, false)
        return 
    else 
        open = true 
            RageUI.Visible(Mainmenu, true)
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(Mainmenu, function()
                    RageUI.Separator("_________ Voiture _________")
                    RageUI.Button("~p~→~s~ Sultan", nil, {RightLabel = "~g~10$"}, true, {
                        onSelected = function()
                            TriggerServerEvent('batop:sultan')
                        end
                    })
                    RageUI.Separator(" _________ Moto _________")
                    RageUI.Button("~p~→~s~ Sanchez", nil, {RightLabel = "~g~10$"}, true, {
                        onSelected = function()
                            TriggerServerEvent('batop:sanchez')
                        end
                    })
                end)
            Wait(0)
            end
        end)
    end
end

---- Marker ----


local position = {
 {x = 487.26, 	y =  -238.08, 	z = 52.80},
}




Citizen.CreateThread(function()
    while true do
      local wait = 900
        for k,v in pairs(position) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, v.x, v.y, v.z)
            if dist <= 1.8 then
                wait = 1
                Visual.Subtitle('Appuyez sur ~p~[E]~s~ pour ~p~Intéragir~s~', 1)
                if IsControlJustPressed(1,51) then
                    batoplocation()
                end
            end 
        end
    Citizen.Wait(wait)
    end
end)

---- BLIPS ----
 
Citizen.CreateThread(function() 
    for k, v in pairs(position) do 
        local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite  (blip, 227)
            SetBlipDisplay (blip, 4)
            SetBlipScale   (blip, 0.5)
            SetBlipColour  (blip, 50)
            SetBlipAsShortRange(blip, true) 
            BeginTextCommandSetBlipName('STRING') 
            AddTextComponentSubstringPlayerName('BatOP - Location')
            EndTextCommandSetBlipName(blip) 
    end 
end)

---- PED ----

Citizen.CreateThread(function()
    local hash = GetHashKey("g_m_m_armboss_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "g_m_m_armboss_01", 487.26, -238.08, 52.80, 78.00, false, true)
    SetBlockingOfNonTemporaryEvents(ped, 1)
    FreezeEntityPosition(ped, 1)
    SetEntityInvincible(ped, 1)
end)




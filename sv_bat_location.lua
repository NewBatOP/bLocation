ESX = nil   

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

---- Voiture ----

RegisterNetEvent('batop:sultan')
AddEventHandler('batop:sultan', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local prix = 10
  local argent = xPlayer.getMoney()
    if argent >= prix then
      xPlayer.removeMoney(prix)
      SetVehicleNumberPlateText(CreateVehicle(GetHashKey("sultan"), 510.12, -244.59, 48.39, 145.4600, true, false), "bLocation")
      TriggerClientEvent('esx:showNotification', source, "~g~Voiture Sortie !")
    else
      TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d\'argent")
    end
end)


---- Moto ----

RegisterNetEvent('batop:sanchez')
AddEventHandler('batop:sanchez', function()
  local xPlayer = ESX.GetPlayerFromId(source)  
  local prix = 10
  local argent = xPlayer.getMoney()
    if argent >= prix then
      xPlayer.removeMoney(prix)
      SetVehicleNumberPlateText(CreateVehicle(GetHashKey("sanchez"), 510.12, -244.59, 48.39, 145.4600, true, false), "bLocation")
      TriggerClientEvent('esx:showNotification', source, "~g~Moto Sortie !")
    else
      TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d\'argent")
    end
end)
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

 
RegisterServerEvent('trains:buying')
AddEventHandler('trains:buying', function()
    local xPlayer = ESX.GetPlayerFromId(source)
	local money = xPlayer.getMoney()
	
	if money > 40 then
		xPlayer.addInventoryItem('ticket', 1)
	else 
		TriggerClientEvent('notification', source, 'You dont have enough money.', 2)
	end
end)

--

ESX.RegisterUsableItem('ticket', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('AskForTrain', source) 
	xPlayer.removeInventoryItem('ticket', 1)
end)
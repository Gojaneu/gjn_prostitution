RegisterServerEvent('gjn_stripter:pay')
AddEventHandler('gjn_stripter:pay', function(boolean)
    local Name = GetPlayerName(source)
    if (boolean == true) then
        if GetMoney(Config.BlowjobPrice, source) then
            RemoveMoney(Config.BlowjobPrice, source)
            TriggerClientEvent('gjn_stripter:startBlowjob', source)
            Logs(source, "Player: **" .. Name .. "**, > Stripter - He paid " .. Config.BlowjobPrice .. " (BLOW JOB)")
        else
            TriggerClientEvent("gjn_stripter:notify", source, "info", "", locale("not_enough_money"))
            TriggerClientEvent('gjn_stripter:noMoney', source)
        end
    else
        if GetMoney(Config.SexPrice, source) then
            RemoveMoney(Config.SexPrice, source)
            TriggerClientEvent('gjn_stripter:startSex', source)
            Logs(source, "Player: **" .. Name .. "**, > Stripter - He paid " .. Config.SexPrice .. " (SEX)")
        else
            TriggerClientEvent("gjn_stripter:notify", source, "info", "", locale("not_enough_money"))
            TriggerClientEvent('gjn_stripter:noMoney', source)
        end
    end
end)
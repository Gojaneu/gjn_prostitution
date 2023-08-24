RegisterServerEvent('gjn_prostitution:pay')
AddEventHandler('gjn_prostitution:pay', function(boolean)
    local Name = GetPlayerName(source)
    if (boolean == true) then
        if GetMoney(Config.BlowjobPrice, source) then
            RemoveMoney(Config.BlowjobPrice, source)
            TriggerClientEvent('gjn_prostitution:startBlowjob', source)
            Logs(source, "Player: **" .. Name .. "**, > prostitution - He paid " .. Config.BlowjobPrice .. " (BLOW JOB)")
        else
            TriggerClientEvent("gjn_prostitution:notify", source, "info", "", locale("not_enough_money"))
            TriggerClientEvent('gjn_prostitution:noMoney', source)
        end
    else
        if GetMoney(Config.SexPrice, source) then
            RemoveMoney(Config.SexPrice, source)
            TriggerClientEvent('gjn_prostitution:startSex', source)
            Logs(source, "Player: **" .. Name .. "**, > prostitution - He paid " .. Config.SexPrice .. " (SEX)")
        else
            TriggerClientEvent("gjn_prostitution:notify", source, "info", "", locale("not_enough_money"))
            TriggerClientEvent('gjn_prostitution:noMoney', source)
        end
    end
end)
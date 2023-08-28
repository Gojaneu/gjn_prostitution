lib.locale()
local target          = Target()

local Keys            = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

local spawn           = 0
local HookerSpawned   = false
local OnRouteToHooker = false
local HookerInCar     = false

for i = 1, #Config.Locationprostitution do
    target:AddBoxZone(i .. "_prostitution_gojan", Config.Locationprostitution[i].coords, 1.0, 1.0, {
        name = i .. "_prostitution_gojan",
        heading = Config.Locationprostitution[i].heading,
        debugPoly = Config.Debug,
        minZ = Config.Locationprostitution[i].coords.z - 1.5,
        maxZ = Config.Locationprostitution[i].coords.z + 0.5
    }, {
        options = {
            {
                event = 'gjn_prostitution:OpenPimpMenu',
                icon = 'fas fa-person',
                label = locale("prostitution")
            }
        },
        distance = 1.5
    })
end

RegisterNetEvent("gjn_prostitution:OpenPimpMenu")
AddEventHandler("gjn_prostitution:OpenPimpMenu", function()
    lib.registerContext({
        id = 'OpenPimpMenu',
        title = "Menu",
        options = {
            {
                title = 'Cathrine',
                description = locale("price") .. ': 200 USD',
                event = 'gjn_prostitution:ChooseCathrine'
            },
            {
                title = 'Tatiana',
                description = locale("price") .. ': 200 USD',
                event = 'gjn_prostitution:ChooseTatiana'
            },
            {
                title = 'Bootylicious',
                description = locale("price") .. ': 200 USD',
                event = 'gjn_prostitution:ChooseBootylicious'
            },
            {
                title = 'Vennesa',
                description = locale("price") .. ': 200 USD',
                event = 'gjn_prostitution:ChooseVennesa'
            }
        }
    })
    lib.showContext('OpenPimpMenu')
end)

RegisterNetEvent("gjn_prostitution:OpenHookerMenu")
AddEventHandler("gjn_prostitution:OpenHookerMenu", function()
    lib.registerContext({
        id = 'OpenHookerMenu',
        title = 'Prostitution',
        options = {
            {
                title = 'Blowjob',
                description = locale("price") .. ': 200 USD',
                event = 'gjn_prostitution:ChooseBlowjob',
                args = {
                    blowjob = true
                }
            },
            {
                title = 'Sex',
                description = locale("price") .. ': 200 USD',
                event = 'gjn_prostitution:ChooseSex',
                args = {
                    sex = true
                }
            }
        }
    })
    lib.showContext('OpenHookerMenu')
end)

RegisterNetEvent("gjn_prostitution:ChooseCathrine")
AddEventHandler("gjn_prostitution:ChooseCathrine", function()
    TriggerEvent("gjn_prostitution:ChosenHooker", "s_f_y_hooker_01") -- Cathrine
    Notify("info", "", locale("prostitute_gps"))
    OnRouteToHooker = true
end)

RegisterNetEvent("gjn_prostitution:ChooseTatiana")
AddEventHandler("gjn_prostitution:ChooseTatiana", function()
    TriggerEvent("gjn_prostitution:ChosenHooker", "s_f_y_hooker_02")
    Notify("info", "", locale("prostitute_gps"))
    OnRouteToHooker = true
end)

RegisterNetEvent("gjn_prostitution:ChooseBootylicious")
AddEventHandler("gjn_prostitution:ChooseBootylicious", function()
    TriggerEvent("gjn_prostitution:ChosenHooker", "s_f_y_hooker_03")
    Notify("info", "", locale("prostitute_gps"))
    OnRouteToHooker = true
end)

RegisterNetEvent("gjn_prostitution:ChooseVennesa")
AddEventHandler("gjn_prostitution:ChooseVennesa", function()
    TriggerEvent("gjn_prostitution:ChosenHooker", "s_f_y_hooker_02")
    Notify("info", "", locale("prostitute_gps"))
    OnRouteToHooker = true
end)

RegisterNetEvent("gjn_prostitution:ChooseBlowjob")
AddEventHandler("gjn_prostitution:ChooseBlowjob", function(data)
    HookerInCar = false
    TriggerServerEvent("gjn_prostitution:pay", true)
end)

RegisterNetEvent("gjn_prostitution:ChooseSex")
AddEventHandler("gjn_prostitution:ChooseSex", function(data)
    HookerInCar = false
    TriggerServerEvent("gjn_prostitution:pay", false)
end)

RegisterNetEvent("gjn_prostitution:noMoney")
AddEventHandler("gjn_prostitution:noMoney", function()
    HookerInCar = true
end)

RegisterNetEvent("gjn_prostitution:startBlowjob")
AddEventHandler("gjn_prostitution:startBlowjob", function()
    local ped = PlayerPedId()
    hookerAnim(Hooker, "oddjobs@towing", "f_blow_job_loop")
    playerAnim(ped, "oddjobs@towing", "m_blow_job_loop")

    Citizen.Wait(2000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Finished", "Speech_Params_Force_Shouted_Clear")
    ClearPedTasks(ped)
    ClearPedTasks(Hooker)
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Hooker_Offer_Again", "Speech_Params_Force_Shouted_Clear")
    HookerInCar = true
end)

RegisterNetEvent("gjn_prostitution:startSex")
AddEventHandler("gjn_prostitution:startSex", function()
    local ped = PlayerPedId()
    hookerAnim(Hooker, "mini@prostitutes@sexlow_veh", "low_car_sex_loop_female")
    playerAnim(ped, "mini@prostitutes@sexlow_veh", "low_car_sex_loop_player")

    Citizen.Wait(2000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic", "Speech_Params_Force_Normal_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic", "Speech_Params_Force_Normal_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic", "Speech_Params_Force_Normal_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Finished", "Speech_Params_Force_Shouted_Clear")
    ClearPedTasks(ped)
    ClearPedTasks(Hooker)
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Hooker_Offer_Again", "Speech_Params_Force_Shouted_Clear")
    HookerInCar = true
end)

Citizen.CreateThread(function()
    for _, v in pairs(Config.Locationprostitution) do
        loadmodel(v.model)
        loaddict("mini@strip_club@idles@bouncer@base")

        pimp = CreatePed(1, v.model, v.coords.x, v.coords.y, v.coords.z, v.heading, false, true)
        FreezeEntityPosition(pimp, true)
        SetEntityInvincible(pimp, true)
        SetBlockingOfNonTemporaryEvents(pimp, true)
        TaskPlayAnim(pimp, "mini@strip_club@idles@bouncer@base", "base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    end
end)

function CreateHooker(model)
    print("1")
    spawn = math.random(1, 12)

    loadmodel(model)
    loaddict("switch@michael@parkbench_smoke_ranger")

    Hooker = CreatePed("PED_TYPE_PROSTITUTE", model, Config.Mistaprodevky[spawn].x, Config.Mistaprodevky[spawn].y,
        Config.Mistaprodevky[spawn].z, Config.Mistaprodevky[spawn].heading, true, true)

    FreezeEntityPosition(Hooker, true)
    SetEntityInvincible(Hooker, true)
    SetBlockingOfNonTemporaryEvents(Hooker, true)
    TaskStartScenarioInPlace(Hooker, "WORLD_HUMAN_SMOKING", 0, false)

    HookerBlip = AddBlipForCoord(Config.Mistaprodevky[spawn].x, Config.Mistaprodevky[spawn].y,
        Config.Mistaprodevky[spawn].z)
    SetBlipSprite(HookerBlip, 280)
    SetNewWaypoint(Config.Mistaprodevky[spawn].x, Config.Mistaprodevky[spawn].y)
end

RegisterNetEvent("gjn_prostitution:ChosenHooker")
AddEventHandler("gjn_prostitution:ChosenHooker", function(model)
    if HookerSpawned then
        Notify('error', '', locale("alredy_chosen_hooker"))
    else
        HookerSpawned = true
        CreateHooker(model)
        Citizen.CreateThread(function()
            local alreadyEnteredZone = false
            while true do
                local inZone = false
                Citizen.Wait(5)
                local Coords, letSleep = GetEntityCoords(PlayerPedId()), true
                if OnRouteToHooker then
                    if GetDistanceBetweenCoords(Coords, Config.Mistaprodevky[spawn].x, Config.Mistaprodevky[spawn].y, Config.Mistaprodevky[spawn].z, true) < Config.DrawMarker then
                        if DoesEntityExist(Hooker) then
                        else
                            Hooker = CreatePed("PED_TYPE_PROSTITUTE", model, Config.Mistaprodevky[spawn].x,
                                Config.Mistaprodevky[spawn].y, Config.Mistaprodevky[spawn].z,
                                Config.Mistaprodevky[spawn].heading, true, true)
                        end
                        letSleep = false
                        local ped = GetPlayerPed(PlayerId())
                        local vehicle = GetVehiclePedIsIn(ped, false)
                        if GetPedInVehicleSeat(vehicle, -1) and IsPedInVehicle(ped, vehicle, true) and IsVehicleSeatFree(vehicle, 0) and not IsVehicleSeatFree(vehicle, -1) then
                            inZone = true

                            TextUIShow(locale("give_signal_girl"))
                            if IsControlJustPressed(0, Keys["E"]) then
                                RemoveBlip(HookerBlip)
                                signalHooker()
                                PlayAmbientSpeech1(Hooker, "Generic_Hows_It_Going", "Speech_Params_Force")
                                HookerInCar = true
                                OnRouteToHooker = false
                            end
                        end
                    end
                end
                if HookerInCar then
                    local ped = GetPlayerPed(PlayerId())
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    if GetPedInVehicleSeat(vehicle, -1) and IsPedInVehicle(ped, vehicle, true) and not IsVehicleSeatFree(vehicle, 0) and not IsVehicleSeatFree(vehicle, -1) then
                        letSleep = false
                        local ped = GetPlayerPed(PlayerId())
                        if IsVehicleStopped(vehicle) then
                            inZone = true

                            TextUIShow(locale("choose"))
                            if IsControlJustPressed(0, Keys["E"]) then
                                PlayAmbientSpeech1(Hooker, "Hooker_Offer_Service", "Speech_Params_Force_Shouted_Clear")
                                TriggerEvent("gjn_prostitution:OpenHookerMenu")
                            end
                            if IsControlJustPressed(0, Keys["H"]) then
                                HookerInCar = false
                                PlayAmbientSpeech1(Hooker, "Hooker_Had_Enough", "Speech_Params_Force_Shouted_Clear")
                                hookerGoHome()
                                break
                            end
                        else
                            inZone = true
                            TextUIShow(locale("somewhere_we_wont_be_disturbed"))
                        end
                    end
                end
                if letSleep then
                    Citizen.Wait(1000)
                end
                if inZone and not alreadyEnteredZone then
                    alreadyEnteredZone = true
                end
                if not inZone and alreadyEnteredZone then
                    alreadyEnteredZone = false
                    TextUIHide()
                end
            end
        end)
    end
end)

function hookerGoHome()
    TextUIHide()
    TaskLeaveVehicle(Hooker, vehicle, 0)
    SetPedAsNoLongerNeeded(Hooker)
    HookerSpawned = false
end

function signalHooker()
    local ped = PlayerPedId()
    FreezeEntityPosition(Hooker, false)
    SetEntityAsMissionEntity(Hooker)
    SetBlockingOfNonTemporaryEvents(Hooker, true)
    TaskEnterVehicle(Hooker, GetVehiclePedIsIn(ped, false), -1, 0, 1.0, 1, 0)
end

function hookerAnim(Hooker, animDictionary, animationName, time)
    if (DoesEntityExist(Hooker) and not IsEntityDead(Hooker)) then
        loaddict(animDictionary)
        TaskPlayAnim(Hooker, animDictionary, animationName, 1.0, -1.0, -1, 1, 1, true, true, true)
    end
end

function playerAnim(ped, animDictionary, animationName, time)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
        loaddict(animDictionary)
        TaskPlayAnim(ped, animDictionary, animationName, 1.0, -1.0, -1, 1, 1, true, true, true)
    end
end

function loadmodel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(10)
    end
end

function loaddict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

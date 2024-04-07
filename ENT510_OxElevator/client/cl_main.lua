local ESX = false
local esxFrame = GetResourceState('es_extended')
if esxFrame == 'started' then
    ESX = exports['es_extended']:getSharedObject()
end

local QBCore = false
local qbFrame = GetResourceState('qb-core')
if qbFrame == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
end

if QBCore and Elevator.Framework ~= 'qbcore' then
    debugging("[^1QBCore^7] Framework started but Elevator.Framework is not set to '^2qbcore^7'.")
elseif QBCore and Elevator.Framework == 'qbcore' then
    debugging("[^2QBCore^7] Framework started and Elevator.Framework is set to '^2qbcore^7' correctly.")
end

if ESX and Elevator.Framework ~= 'newEsx' then
    debugging("[^1ESX^7] Framework started but Elevator.Framework is not set to '^1newEsx^7'.")
elseif ESX and Elevator.Framework == 'newEsx' then
    debugging("[^2ESX^7] Framework started and Elevator.Framework is set to '^2newEsx^7' correctly.")
end



function onlyMenuPlans(k)
    local enterPed = nil
    local exitPed = nil
    local enterPedModel = nil
    local exitPedModel = nil
    for zoneName, zoneData in pairs(Elevator.ElevatorZone) do
        if zoneName == k then
            local enterPedPosition = zoneData.PedElevatorEnter
            local exitPedPosition = nil
            enterPedModel = lib.RequestModel(zoneData.PedElevatorModel)
            enterPed = CreatePed(4, enterPedModel, enterPedPosition.x, enterPedPosition.y,
                enterPedPosition.z - 1, enterPedPosition.w, false, true)
            FreezeEntityPosition(enterPed, true)
            SetModelAsNoLongerNeeded(enterPedModel)
            FreezeEntityPosition(enterPed, true)
            SetEntityInvincible(enterPed, true)
            SetBlockingOfNonTemporaryEvents(enterPed, true)
            if zoneData.Blip.Enabled then
                local blip = AddBlipForCoord(enterPedPosition.x, enterPedPosition.y, enterPedPosition.z)
                SetBlipSprite(blip, zoneData.Blip.Sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, zoneData.Blip.Scale)
                SetBlipAsShortRange(blip, true)
                SetBlipColour(blip, zoneData.Blip.Color)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(zoneData.Blip.Name)
                EndTextCommandSetBlipName(blip)
            end
            
            exports.ox_target:addLocalEntity(enterPed, {
                {
                    icon = 'fa-solid fa-building',
                    label = Traduction.TargetOpenMainMenu,
                    onSelect = function()
                        CamEnabled(enterPed)
                        ShowElevatorMenu(zoneData.Plans)
                    end
                }
            })

            for _, planData in ipairs(zoneData.Plans) do
                exitPedPosition = planData.PedPosExitPlans

                exitPedModel = lib.RequestModel(zoneData.PedElevatorModel)
                exitPed = CreatePed(4, exitPedModel, exitPedPosition.x, exitPedPosition.y,
                    exitPedPosition.z - 1, exitPedPosition.w, false, true)
                SetModelAsNoLongerNeeded(exitPedModel)
                FreezeEntityPosition(exitPed, true)
                SetEntityInvincible(exitPed, true)
                SetBlockingOfNonTemporaryEvents(exitPed, true)
                exports.ox_target:addLocalEntity(exitPed, {
                    {
                        icon = 'fa-solid fa-building',
                        label = Traduction.TargetOpenExitMenu,
                        onSelect = function()
                            ShowElevatorMenuExit(zoneData, zoneName)
                            debugging(zoneData.Plans)
                        end
                    }
                })
            end
        end
    end
end

function ShowElevatorMenu(plans)
    local menuOptions = {}
    for _, planData in ipairs(plans) do
        local icon
        local iconColor

        if planData.UsePasswordPlans then
            icon = "fas fa-lock"
            iconColor = "#FF6B6B"
        else
            icon = "fas fa-lock-open"
            iconColor = "#00BFFF"
        end

        local hashKey = GetStreetNameAtCoord(planData.TeleportSpawnEnter.x, planData.TeleportSpawnEnter.y,
            planData.TeleportSpawnEnter.z)
        local streetName = GetStreetNameFromHashKey(hashKey)
        local statusTitle = Traduction.MenuStatus
        local streetTitle = Traduction.MenuZone
        local statusDescription = (planData.UsePasswordPlans and Traduction.BlockedPlan .. ' ' .. "🔴" or Traduction.FreePlan .. ' ' .. "🟢")
        local streetDescription = streetName
        local descriptionDescription = planData.DescriptionPlans
        local ImagePlanes = planData.Image

        table.insert(menuOptions, {
            title = planData.PlansName,
            description = descriptionDescription,
            icon = icon,
            iconColor = iconColor,
            image = ImagePlanes,
            onSelect = function()
                if planData.UsePasswordPlans then
                    local input = lib.inputDialog(Traduction.TitleDialog, {
                        {
                            type = "input",
                            label = Traduction.EnterPass,
                            password = true,
                            icon = 'lock'
                        },
                    })
                    if not input then return CamDisbled() end
                    local pass = input[1]
                    if pass == planData.PasswordPlans then
                        NotifyClient('Success Password', Traduction.NotifyCorrectPass, 'success', "fa-solid fa-check")
                        CamDisbled()
                        DoScreenFadeOut(1000)
                        Wait(1000)
                        if ESX then
                            if Elevator.Framework == 'newEsx' then
                                ESX.Game.Teleport(PlayerPedId(), planData.TeleportSpawnEnter, function()
                                    Wait(1000)
                                    DoScreenFadeIn(1000)
                                    debugging(planData.TeleportSpawnEnter)
                                end)
                                NotifyClient(planData.PlansName, Traduction.NotifyCorrectTeleported, 'success',
                                    "fa-solid fa-check")
                                debugging(Elevator.Framework)
                            end
                        elseif Elevator.Framework == 'qbcore' then
                            if QBCore then
                                debugging('switch qbcore')
                                debugging(Elevator.Framework)
                                SetEntityCoords(PlayerPedId(), planData.TeleportSpawnEnter)
                                Wait(1000)
                                DoScreenFadeIn(1000)
                                NotifyClient(planData.PlansName, Traduction.NotifyCorrectTeleported, 'success',
                                    "fa-solid fa-check")
                            end
                        end
                    else
                        debugging('Wrong password')
                        NotifyClient('Error Password', Traduction.NotifyPassWrong, 'error',
                            "fa-solid fa-triangle-exclamation")
                        CamDisbled()
                    end
                else
                    CamDisbled()
                    DoScreenFadeOut(1000)
                    Wait(1000)

                    if Elevator.Framework == 'newEsx' then
                        if ESX then
                            ESX.Game.Teleport(PlayerPedId(), planData.TeleportSpawnEnter, function()
                                Wait(1000)
                                DoScreenFadeIn(1000)
                                debugging(planData.TeleportSpawnEnter)
                                NotifyClient(planData.PlansName, Traduction.NotifyCorrectTeleported, 'success',
                                    "fa-solid fa-check")
                            end)
                            debugging(Elevator.Framework)
                        end
                    elseif Elevator.Framework == 'qbcore' then
                        if QBCore then
                            debugging('switch qbcore')
                            debugging(Elevator.Framework)
                            SetEntityCoords(PlayerPedId(), planData.TeleportSpawnEnter)
                            Wait(1000)
                            DoScreenFadeIn(1000)
                            NotifyClient(planData.PlansName, Traduction.NotifyCorrectTeleported, 'success',
                                "fa-solid fa-check")
                        end
                    end
                end
                CamDisbled()
            end,
            metadata = {
                { label = statusTitle, value = statusDescription },
                { label = streetTitle, value = streetDescription }
            }
        })
    end

    local menuId = 'elevator_menu'
    lib.registerContext({
        id = menuId,
        title = Traduction.TitleSelectFloor,
        options = menuOptions,
        onExit = function()
            CamDisbled()
        end
    })

    lib.showContext(menuId)
end

function ShowElevatorMenuExit(zoneData, k)
    for nomezone, stocazz in pairs(Elevator.ElevatorZone) do
        if nomezone == k then
            local menuId = 'menu_uscita_elevator' .. nomezone
            local exitMenuOptions = {
                {
                    title = Traduction.TargetOpenExitMenu,
                    icon = 'fas fa-sign-out-alt',
                    onSelect = function()
                        DoScreenFadeOut(1000)
                        Wait(1000)
                        if Elevator.Framework == 'newEsx' then
                            if ESX then
                                ESX.Game.Teleport(PlayerPedId(), stocazz.TeleportCoordsExit, function()
                                    Wait(1000)
                                    DoScreenFadeIn(1000)
                                    debugging(Elevator.Framework)
                                    NotifyClient('Success', Traduction.NotifyCorrectTeleported, 'success',
                                        "fa-solid fa-check")
                                end)
                            end
                        elseif Elevator.Framework == 'qbcore' then
                            if QBCore then
                                debugging('switch qbcore')
                                debugging(Elevator.Framework)
                                SetEntityCoords(PlayerPedId(), stocazz.TeleportCoordsExit)
                                Wait(1000)
                                DoScreenFadeIn(1000)
                                NotifyClient('Success', Traduction.NotifyCorrectTeleported, 'success',
                                    "fa-solid fa-check")
                            end
                        end
                    end
                }
            }

            lib.registerContext({
                id = menuId,
                title = nomezone,
                options = exitMenuOptions,
                onExit = function()
                    CamDisbled()
                end
            })

            lib.showContext(menuId)
        end
    end
end

for shopName, _ in pairs(Elevator.ElevatorZone) do
    onlyMenuPlans(shopName)
    -- debugging(_)
end

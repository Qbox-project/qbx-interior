function TeleportToInterior(x, y, z, h)
    CreateThread(function()
        SetEntityCoords(cache.ped, x, y, z, false, false, false, false)
        SetEntityHeading(cache.ped, h)

        Wait(100)

        DoScreenFadeIn(1000)
    end)
end

exports('DespawnInterior', function(objects, cb)
    CreateThread(function()
        for _, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end

        cb()
    end)
end)

RegisterNetEvent('qb-interior:client:screenfade', function()
	DoScreenFadeOut(250)
    while not IsScreenFadedOut() do Wait(50) end
	DoScreenFadeIn(500)
end)

---@param spawn vector4 Use Proper Coordinate Scaling
---@param exitXYZH vector4 Do json.decode('{"x": num, "y": num, "z": num, "h": num}')
---@param model string | integer Use any Model Name or Hash | 'furnitured_lowapart' or `furnitured_lowapart`
---@return table
local function CreateShell(spawn, exitXYZH, model) -- New Export for Creating Internal Shells / Custom Shells
    local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = exitXYZH
    DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

    lib.requestModel(model)

    local house = CreateObject(model, spawn.x, spawn.y, spawn.z, false, false, false)

    local spawnPointX = 0.089353
    local spawnPointY = -2.67699
    local spawnPointZ = 0.760894
    local spawnPointH = 270.76

    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(model)

	objects[#objects+1] = house
    TeleportToInterior(spawn.x + spawnPointX, spawn.y + spawnPointY, spawn.z + spawnPointZ, spawnPointH)

    return { objects, POIOffsets }
end

exports('CreateShell', function(spawn, exitXYZH, model)
    return CreateShell(spawn, exitXYZH, model)
end)

-- Starting Apartment

---@param spawn vector4
---@return table
exports('CreateApartmentFurnished', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -1.50, "y": 10.0, "z": 1.3, "h":358.50}')
	POIOffsets.clothes = json.decode('{"x": -6.028, "y": -9.5, "z": 1.2, "h":2.263}')
	POIOffsets.stash = json.decode('{"x": -7.305, "y": -3.922, "z": 0.5, "h":2.263}')
	POIOffsets.logout = json.decode('{"x": -0.8, "y": 1.0, "z": 1.0, "h":2.263}')
    DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`furnitured_midapart`)

	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`furnitured_midapart`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + 1.5, spawn.y - 8.0, spawn.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateHouseRobbery', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`furnitured_midapart`)

	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`furnitured_midapart`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

-- Shells (in order by tier starting at 1)

---@param spawn vector4
---@return table
exports('CreateApartmentShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.693, "y": -6.015, "z": 1.11, "h":358.634}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_v16low`)

	local house = CreateObject(`shell_v16low`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_v16low`)

	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateTier1House', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.561, "y": -14.305, "z": 1.147, "h":2.263}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_v16mid`)

	local house = CreateObject(`shell_v16mid`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_v16mid`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateTrevorsShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.374, "y": -3.789, "z": 2.428, "h":358.633}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_trevor`)

	local house = CreateObject(`shell_trevor`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_trevor`)

	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateCaravanShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":3.3, "y":-2.1, "x":-1.4, "h":358.633972168}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_trailer`)

	local house = CreateObject(`shell_trailer`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_trailer`)

	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateLesterShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.780, "y":-0.795, "z":1.1,"h":270.30}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_lester`)

	local house = CreateObject(`shell_lester`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_lester`)

	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateRanchShell', function(spawn)
	local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"x":-1.257, "y":-5.469, "z":2.5, "h":270.57,}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_ranch`)

	local house = CreateObject(`shell_ranch`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_ranch`)

	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateContainer', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.08, "y": -5.73, "z": 1.24, "h": 359.32}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`container_shell`)

	local house = CreateObject(`container_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`container_shell`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateFurniMid', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`furnitured_midapart`)

	local house = CreateObject(`furnitured_midapart`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`furnitured_midapart`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateFurniMotelModern', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.98, "y": 4.35, "z": 1.16, "h": 179.79}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`modernhotel_shell`)

	local house = CreateObject(`modernhotel_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`modernhotel_shell`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateFranklinAunt', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -0.36, "y": -5.89, "z": 1.70, "h": 358.21}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_frankaunt`)

	local house = CreateObject(`shell_frankaunt`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_frankaunt`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateGarageMed', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 13.90, "y": 1.63, "z": 1.0, "h": 87.05}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_garagem`)

	local house = CreateObject(`shell_garagem`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_garagem`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateMichael', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -9.49, "y": 5.54, "z": 9.91, "h": 270.86}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_michael`)

	local house = CreateObject(`shell_michael`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_michael`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateOffice1', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 1.88, "y": 5.06, "z": 2.05, "h": 180.07}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_office1`)

	local house = CreateObject(`shell_office1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_office1`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateStore1', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -2.61, "y": -4.73, "z": 1.08, "h": 1.0}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end


	lib.requestModel(`shell_store1`)

	local house = CreateObject(`shell_store1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_store1`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateWarehouse1', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -8.95, "y": 0.51, "z": 1.04, "h": 268.82}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`shell_warehouse1`)

	local house = CreateObject(`shell_warehouse1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`shell_warehouse1`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)


    return { objects, POIOffsets }
end)

---@param spawn vector4
---@return table
exports('CreateFurniMotelStandard', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": -0.43, "y": -2.51, "z": 1.0, "h": 271.29}')
	DoScreenFadeOut(500)

    while not IsScreenFadedOut() do Wait(10) end

	lib.requestModel(`standardmotel_shell`)

	local house = CreateObject(`standardmotel_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	SetModelAsNoLongerNeeded(`standardmotel_shell`)

    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)

    return { objects, POIOffsets }
end)

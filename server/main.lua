local QBCore = exports['qbx-core']:GetCoreObject()

local Apartments = {
	[`furnitured_midapart`] = {
		exit = vector4(1.46, -10.33, 1.06, 0.39),
		clothes = vector2(6.03, 9.3),
		stash = vector2(6.91, 3.94),
		logout = vector2(4.07, 7.89)
	},
	['IntegrityWayApt30'] = {
		exit = vector4(-18.16, -582.02, 90.11, 71.5),
		clothes = vector3(-38.11, -583.48, 83.92),
		stash = vector3(-26.95, -588.61, 90.12),
		logout = vector3(-37.28, -577.89, 83.91)
	},
	['DellPerroHeightsApt7'] = {
		exit = vector4(-1457.71, -520.23, 56.93, 127.71),
		clothes = vector3(-1467.46, -537.28, 50.73),
		stash = vector3(-1457.44, -531.26, 56.94),
		logout = vector3(-1471.83, -533.47, 50.72)
	},
	['GTAOHouseMid1'] = {
		exit = vector4(346.55, -1012.83, -99.2, 5.8),
		clothes = vector3(350.84, -993.9, -99.2),
		stash = vector3(351.98, -998.8, -99.2),
		logout = vector3(349.24, -995.09, -99.2)
	},
	['GTAOHouseLow1'] = {
		exit = vector4(266.11, -1007.61, -101.01, 357.68),
		clothes = vector3(260.4, -1003.27, -99.01),
		stash = vector3(265.96, -999.37, -99.01),
		logout = vector3(262.91, -1002.92, -99.01)
	},
	['DellPerroHeightsApt4'] = {
		exit = vector4(-1456.79, -534.14, 74.04, 27.01),
		clothes = vector3(-1449.88, -549.25, 72.84),
		stash = vector3(-1454.65, -549.33, 72.84),
		logout = vector3(-1454.08, -553.25, 72.84)
	},
}

local Interiors = {
	[`furnitured_midapart`] = {
		exit = vector4(1.46, -10.33, 1.06, 0.39)
	},
	['IntegrityWayApt30'] = {
		exit = vector4(-18.16, -582.02, 90.11, 71.5)
	},
	['DellPerroHeightsApt7'] = {
		exit = vector4(-1457.71, -520.23, 56.93, 127.71)
	},
	['GTAOHouseMid1'] = {
		exit = vector4(346.55, -1012.83, -99.2, 5.8)
	},
	['GTAOHouseLow1'] = {
		exit = vector4(266.11, -1007.61, -101.01, 357.68)
	},
	['DellPerroHeightsApt4'] = {
		exit = vector4(-1456.79, -534.14, 74.04, 27.01)
	},
	['3655WildOatsDrive'] = {
		exit = vector4(-174.32, 497.87, 137.65, 189.36)
	},
	['2874HillcrestAvenue'] = {
		exit = vector4(-859.93, 691.23, 152.86, 187.66)
	},
	[`shell_v16low`] = {
		exit = vector4(4.693, -6.015, 1.11, 358.634)
	},
	[`shell_v16mid`] = {
		exit = vector4(1.561, -14.305, 1.147, 2.263)
	},
	[`shell_trevor`] = {
		exit = vector4(0.374, -3.789, 2.428, 358.633)
	},
	[`shell_trailer`] = {
		exit = vector4(-1.36, -1.94, 22.9, 357.09)
	},
	[`shell_lester`] = {
		exit = vector4(-1.62, -5.98, 21.11, 357.42)
	},
	[`shell_ranch`] = {
		exit = vector4(-0.78, -5.45, 22.4, 270.94)
	},
	[`container_shell`] = {
		exit = vector4(0.01, -5.38, 21.12, 2.13)
	},
	[`modernhotel_shell`] = {
		exit = vector4(4.92, 4.04, 21.17, 185.36)
	},
	[`shell_frankaunt`] = {
		exit = vector4(-0.34, -5.6, 21.71, 1.83)
	},
	[`shell_garagem`] = {
		exit = vector4(13.48, 1.61, 21.0, 91.0)
	},
	[`shell_michael`] = {
		exit = vector4(-9.13, 5.57, 29.92, 268.3)
	},
	[`shell_office1`] = {
		exit = vector4(1.28, 4.75, 22.05, 189.15)
	},
	[`shell_store1`] = {
		exit = vector4(-2.71, -4.37, 21.09, 357.69)
	},
	[`shell_warehouse1`] = {
		exit = vector4(-8.71, 0.08, 21.04, 269.18)
	},
	[`standardmotel_shell`] = {
		exit = vector4(-0.32, -2.46, 21.01, 271.93)
	},
}

local function TeleportToInterior(Ped, Coords)
	SetEntityCoords(Ped, Coords.exit.x, Coords.exit.y, Coords.exit.z)
	SetEntityHeading(Ped, Coords.exit.w)
end

exports('CreateDefaultApartment', function(Source, ApartmentName, Routingbucket, Coords)
	if not Apartments[ApartmentName] then error(string.format('%s, passed %s. But that apartment name doesn\'t exist.', GetInvokingResource(), ApartmentName)) return end

	if type(ApartmentName) == 'number' then
		local InteractCoords = {
			exit = vector4(Coords.x + Apartments[ApartmentName].exit.x, Coords.y + Apartments[ApartmentName].exit.y, Coords.z + 1.0, Apartments[ApartmentName].exit.w),
			clothes = vector3(Coords.x + Apartments[ApartmentName].clothes.x, Coords.y + Apartments[ApartmentName].clothes.y, Coords.z + 1.0),
			stash = vector3(Coords.x + Apartments[ApartmentName].stash.x, Coords.y + Apartments[ApartmentName].stash.y, Coords.z + 1.0),
			logout = vector3(Coords.x + Apartments[ApartmentName].logout.x, Coords.y + Apartments[ApartmentName].logout.y, Coords.z + 1.0)
		}
		local Shell = CreateObject(ApartmentName, Coords.x, Coords.y, Coords.z, true, false, false)
		while not DoesEntityExist(Shell) do Wait(0) end
		FreezeEntityPosition(Shell, true)
		TriggerClientEvent('qb-interior:client:screenfade', Source)
		Wait(300)
		TeleportToInterior(GetPlayerPed(Source), InteractCoords)
		QBCore.Functions.SetEntityBucket(Shell, Routingbucket)
		QBCore.Functions.SetPlayerBucket(Source, Routingbucket)
		return InteractCoords, Shell
	elseif type(ApartmentName) == 'string' then
		local InteractCoords = {
			exit = vector4(Apartments[ApartmentName].exit.x, Apartments[ApartmentName].exit.y, Apartments[ApartmentName].exit.w),
			clothes = vector3(Apartments[ApartmentName].clothes.x, Apartments[ApartmentName].clothes.y,  Apartments[ApartmentName].clothes.z),
			stash = vector3(Apartments[ApartmentName].stash.x, Apartments[ApartmentName].stash.y, Apartments[ApartmentName].stash.z),
			logout = vector3(Apartments[ApartmentName].logout.x, Apartments[ApartmentName].logout.y, Apartments[ApartmentName].logout.z)
		}
		TriggerClientEvent('qb-interior:client:screenfade', Source)
		Wait(300)
		TeleportToInterior(GetPlayerPed(Source), InteractCoords)
		QBCore.Functions.SetPlayerBucket(Source, Routingbucket)
		return InteractCoords
	end
end)

exports('CreateDefaultInterior', function(Source, InteriorName, Routingbucket, Coords)
	if not Interiors[InteriorName] then error(string.format('%s, passed %s. But that apartment name doesn\'t exist.', GetInvokingResource(), InteriorName)) return end

	if type(InteriorName) == 'number' then
		local InteractCoords = {
			exit = vector4(Coords.x + Interiors[InteriorName].exit.x, Coords.y + Interiors[InteriorName].exit.y, Coords.z + 1.0, Interiors[InteriorName].exit.w)
		}
		local Shell = CreateObject(InteriorName, Coords.x, Coords.y, Coords.z, true, false, false)
		while not DoesEntityExist(Shell) do Wait(0) end
		FreezeEntityPosition(Shell, true)
		TriggerClientEvent('qb-interior:client:screenfade', Source)
		Wait(300)
		TeleportToInterior(GetPlayerPed(Source), InteractCoords)
		QBCore.Functions.SetEntityBucket(Shell, Routingbucket)
		QBCore.Functions.SetPlayerBucket(Source, Routingbucket)
		return InteractCoords, Shell
	elseif type(InteriorName) == 'string' then
		local InteractCoords = {
			exit = vector4(Interiors[InteriorName].exit.x, Interiors[InteriorName].exit.y, Interiors[InteriorName].exit.w)
		}
		TriggerClientEvent('qb-interior:client:screenfade', Source)
		Wait(300)
		TeleportToInterior(GetPlayerPed(Source), InteractCoords)
		QBCore.Functions.SetPlayerBucket(Source, Routingbucket)
		return InteractCoords
	end
end)

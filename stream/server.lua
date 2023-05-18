-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local VehicleList = {}

-- Functions
QBCore.Commands.Add("unlockcar", "Use Slimjim to Unlock Car", {{name = "id", help = "Player id"}}, true, function(source, args)
	local src = source
    local target = tonumber(args[1])
    TriggerClientEvent('vehiclekeys:client:GiveKeys', src, target)
end)


-- SET_VEHICLE_DOORS_LOCKED
SetVehicleDoorsLocked(
	vehicle --[[ Vehicle ]], 
	doorLockStatus --[[ integer ]]
)

---// Source GTA VC miss2 leak, matching constants for 0/2/4, testing // They use 10 in am_mp_property_int, don't know what it does atm. 
--- enum eCarLock { CARLOCK_NONE = 0, CARLOCK_UNLOCKED = 1, CARLOCK_LOCKED = 2, CARLOCK_LOCKOUT_PLAYER_ONLY = 3, CARLOCK_LOCKED_PLAYER_INSIDE = 4, 
--- CARLOCK_LOCKED_INITIALLY = 5, CARLOCK_FORCE_SHUT_DOORS = 6, CARLOCK_LOCKED_BUT_CAN_BE_DAMAGED = 7 };

---This is the server-side RPC native equivalent of the client native SET_VEHICLE_DOORS_LOCKED.


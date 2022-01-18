mst_fnc_handleRopeDetach = {
	_heli = nearestObjects [player, ["Air"], 2] select 0;
	vehicle player addEventHandler ["RopeBreak",{
		params ["_object1", "_rope", "_object2"];
		{
			ropeDestroy _x;
		} forEach ropes vehicle player;
		deleteVehicle basket;
		hasDeployedBasket = false;
		publicVariable "hasDeployedBasket";
		vehicle player animateSource ['hoist_hook_hide', 0];
	}];
};

mst_fnc_addUSCGEH = {
	params ["_AI"];
	_AI addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		if (typeOf _vehicle == "MS_Stretcher") then {
			[_unit, "hubwoundedprone_idle2"] remoteExec ["switchMove"];
		};
		if (typeOf _vehicle == "MS_CoastguardBasketNew") then {
			[_unit, "acts_civilhiding_1"] remoteExec ["switchMove"];
		};
	}];
};

{
	[_x] call mst_fnc_addUSCGEH;
} forEach allUnits;

addMissionEventHandler ["GroupCreated", {
	params ["_group"];
	[_group] spawn
    {
        params ["_group"];
        sleep 1;
        {
            [_x] call mst_fnc_addUSCGEH;
        } foreach units _group;
    };
}];


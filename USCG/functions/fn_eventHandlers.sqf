mst_fnc_addUSCGEH = {
	params ["_AI"];
	_AI addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		if (typeOf _vehicle == "MS_Stretcher") then {
			[_unit, "hubwoundedprone_idle2"] remoteExec ["switchMove"];
		};
		if (typeOf _vehicle == "MS_CoastguardBasketV3") then {
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

mst_fnc_handleRopeDetach = {
	_heli = nearestObjects [player, ["Air"], 2] select 0;
	vxf_vehicle addEventHandler ["RopeBreak",{
		params ["_object1", "_rope", "_object2"];
		{
			ropeDestroy _x;
		} forEach ropes vxf_vehicle;
		deleteVehicle basket;
		hasDeployedBasket = false;
		publicVariable "hasDeployedBasket";
		vxf_vehicle animateSource ['hoist_hook_hide', 0]; // unhide hook
	}];
};

mst_fnc_handleEject = {
	player addEventHandler ["GetOutMan", { 
		params ["_unit", "_role", "_vehicle", "_turret"];
		ply = _unit;
		ply switchMove "GetOutHeli_Light_01bench";
		ply removeEventHandler ["GetOutMan", _thisEventHandler];
		[] spawn {sleep 1.2,
			ply switchMove "AswmPercMstpSnonWnonDnon"; 
		}; 
	}];
};
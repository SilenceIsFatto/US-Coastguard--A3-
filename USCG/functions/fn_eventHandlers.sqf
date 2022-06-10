mst_fnc_addUSCGEH = {
	params ["_AI"];
	_AI addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		if (typeOf _vehicle == "MS_Stretcher") then {
			[_unit, "USCG_anim_stretcher"] remoteExec ["switchMove"];
		};
		if (typeOf _vehicle == "MS_Stretcher_V3") then {
			[_unit, "USCG_anim_stretcher"] remoteExec ["switchMove"];
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
	params ["_heli"];
	_heli addEventHandler ["RopeBreak",{
		params ["_object1", "_rope", "_object2"];
		{
			ropeDestroy _x;
		} forEach ropes _heli;
		deleteVehicle hook;
		hasDeployedHook = false;
		publicVariable "hasDeployedHook";
		hookDeployed = false;
		publicVariable "hookDeployed";
		_heli animateSource ['hoist_hook_hide', 0]; // unhide hook
		if (hasDeployedStretcher) then {
			deleteVehicle stretcher_hook;
			hasDeployedStretcher = false;
			publicVariable "hasDeployedStretcher";
		};
	}];
};

mst_fnc_handleEject = {
	player addEventHandler ["GetOutMan", { 
		params ["_unit", "_role", "_vehicle", "_turret"];
		ply = _unit;
		[ply, "GetOutHeli_Light_01bench"] remoteExec ["switchMove"];
		ply removeEventHandler ["GetOutMan", _thisEventHandler];
		[] spawn {sleep 1.2,
			[ply, "AswmPercMstpSnonWnonDnon"] remoteExec ["switchMove"];
		}; 
	}];
};
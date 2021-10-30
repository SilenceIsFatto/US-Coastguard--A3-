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


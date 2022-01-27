// Variables (Defaults)
hasDeployedBasket = false;

_allowedHooks =
[
	"MS_CoastguardBasketNew", 
	"MS_Stretcher",
	"vtx_hook"
];

mst_fnc_getDataReadings = {
	_objPosition = getPosATL player;

	_x = _objPosition select 0;
	_y = _objPosition select 1;

	_meters = vxf_vehicle distance [_x,_y,0];
	hint format ["This helicopter is approximately %1m away from the ground. \n \n \n This helicopter currently has %2 people in the basket. \n \n \n The ropes length is approximately %3.",_meters, count crew basket, ropeLength (ropes vxf_vehicle select 0)];
};

mst_fnc_setRopeLength = {
	createDialog "uscg_RopeMeter";
};

mst_fnc_spawnHookSelectionMenu = {
	createDialog "uscg_hookSelection";
	[] call USCG_fnc_handleDialog;
};

mst_fnc_deleteBasket = {
	{
		ropeDestroy _x;
	} forEach ropes vxf_vehicle;
	deleteVehicle basket;
	titleText ["Equipment has been unhooked!","PLAIN DOWN"];
	hasDeployedBasket = false;
	publicVariable "hasDeployedBasket";
};

mst_fnc_moveIntoBasket = {
	/*
	_basket = nearestObjects [player, ["Ship"], 20] select 0;
	if (typeOf _basket in _allowedHooks) then {
		player moveInAny _basket;
	} else {
		hint "The rescue basket is not close enough, or non-existent.";
	};
	*/
	player moveInAny basket;
};

mst_fnc_moveInAllOccupants = {
	{
		_x moveInAny vxf_vehicle;
	} forEach crew basket;
	titleText ["Crew Of Basket Is Secure!","PLAIN DOWN"];
};

mst_fnc_changeRopeLength = {
	_ropeDistance = player getVariable "ropeDistance";
	hint _ropeDistance;
	{
		ropeUnwind [_x, 6, parseNumber _ropeDistance];
	} forEach ropes vxf_vehicle;
	titleText ["Ropes have been lengthened!","PLAIN DOWN"];
	basket setDir (getDir vxf_vehicle);
};
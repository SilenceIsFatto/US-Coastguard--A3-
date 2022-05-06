// Variables (Defaults)
hasDeployedBasket = false;
hasDeployedStretcher = false;
hasDeployedHook = false;

_allowedHooks =
[
	"MS_CoastguardBasketNew", 
	"MS_Stretcher",
	"vtx_hook"
];

mst_fnc_spawnHookSelectionMenu = {
	createDialog "uscg_hookSelection";
	[] call USCG_mod_fnc_handleDialog;
};

mst_fnc_moveIntoBasket = {
	uscgheli = vehicle player;
	player moveInAny currentVehicle;
};

mst_fnc_moveInAllOccupants = {
	{
		_x moveInAny vxf_vehicle;
	} forEach crew basket;
	titleText ["Crew Of Basket Is Secure!","PLAIN DOWN"];
};

mst_fnc_moveToHelicopter = {
	player moveInAny uscgheli;
};
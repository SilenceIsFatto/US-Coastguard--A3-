params ["_vehicle"];

if (hasDeployedStretcher) then {
	{
		ropeDestroy _x;
	} forEach ropes vxf_vehicle;
	deleteVehicle stretcher_hook;
	titleText ["Equipment has been unhooked!","PLAIN DOWN"];
	hasDeployedStretcher = false;
	publicVariable "hasDeployedStretcher";
	hookDeployed = false;
	publicVariable "hookDeployed";
};

if (hasDeployedBasket) then {
	{
		ropeDestroy _x;
	} forEach ropes vxf_vehicle;
	deleteVehicle basket_hook;
	titleText ["Equipment has been unhooked!","PLAIN DOWN"];
	hasDeployedBasket = false;
	publicVariable "hasDeployedBasket";
	hookDeployed = false;
	publicVariable "hookDeployed";
};

{
	ropeDestroy _x;
} forEach ropes vxf_vehicle;
deleteVehicle _vehicle;
titleText ["Equipment has been unhooked!","PLAIN DOWN"];
hasDeployedBasket = false;
publicVariable "hasDeployedBasket";
hasDeployedHook = false;
publicVariable "hasDeployedHook";
hookDeployed = false;
publicVariable "hookDeployed";
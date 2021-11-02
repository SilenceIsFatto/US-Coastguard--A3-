// Variables (Defaults)
hasDeployedBasket = false;
allowedVehicles = ["MS_CoastguardBasket", "MS_CoastguardBasketNew", "MS_Stretcher", "vtx_hook", "litter_civ"];
EMSRopes = false;
normalRopes = false;
// Variables (Defaults)

mst_fnc_startCameraFeed = {
	cam = "camera" camCreate (position basket);
	cam cameraEffect ["External", "BACK"];

	cam camSetFocus [50, 1];

	//vic = "plp_PaneClear_05x05_45" createVehicle position basket;
	//vic setPos [0,0,-5];
	//vic attachTo [basket];

	cam camSetTarget vic; 
	cam camSetRelPos [0,0,5];
	cam camSetRelPos getPos basket;
	isUsingCamera = true;

	0 = [] spawn {
		while {isUsingCamera} do {
			cam camSetTarget basket;
			cam camSetRelPos [0,0,1.5];
			cam camCommit 0;
		};
	};
};

mst_fnc_destroyCameraFeed = {
	cam cameraEffect ["terminate","back"];
	camDestroy cam;
};

mst_fnc_handleRopeAttach = {
	vehicle player addEventHandler ["RopeAttach", {
		params ["_object1", "_rope", "_object2"];
		if (typeOf _object2 in allowedVehicles) then {
			hasDeployedBasket = true;
			publicVariable "hasDeployedBasket";
		};
	}];
};

mst_fnc_handleRopeDetach = {
	_heli = nearestObjects [player, ["Air"], 2] select 0;
	vehicle player addEventHandler ["RopeBreak",{
		params ["_object1", "_rope", "_object2"];
		{
			ropeDestroy _x;
		} forEach ropes vehicle player;
		hasDeployedBasket = false;
		publicVariable "hasDeployedBasket";
	}];
};

mst_fnc_getDataReadings = {
	_objPosition = getPosASL player;

	_x = _objPosition select 0;
	_y = _objPosition select 1;

	_meters = vehicle player distance [_x,_y,0];
	hint format ["This helicopter is approximately %1m away from the ground. \n \n \n This helicopter currently has %2 people in the basket. \n \n \n The ropes length is approximately %3.",_meters,count crew basket, ropeLength (ropes vehicle player select 0)];
};

mst_fnc_setRopeLength = {
	createDialog "uscg_RopeMeter";
};

mst_fnc_swapRopePoints = {
	{ 
		ropeDestroy _x;
	} forEach ropes vehicle player;

	if (EMSRopes && typeOf basket == "MS_CoastguardBasketNew") then {
		vehicle player removeEventHandler ["RopeBreak",0];
		myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
		call mst_fnc_handleRopeDetach;
	};
	if (EMSRopes && typeOf basket == "MS_Stretcher") then {
		vehicle player removeEventHandler ["RopeBreak",0];
		myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo1", 4, [], ["RopeEnd", [0,0,0]]];
		myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo2", 4, [], ["RopeEnd", [0,0,0]]];
		myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo3", 4, [], ["RopeEnd", [0,0,0]]];
		myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo4", 4, [], ["RopeEnd", [0,0,0]]];
		call mst_fnc_handleRopeDetach;
	};
	if (normalRopes && typeOf basket == "MS_Stretcher") then {
		vehicle player removeEventHandler ["RopeBreak",0];
		myRope = ropeCreate [vehicle player, [1.2, 2.03, -2.2], basket, "SlingLoadCargo1", 4, [], ["RopeEnd", [0,0,0]]];
		myRope = ropeCreate [vehicle player, [1.2, 2.03, -2.2], basket, "SlingLoadCargo2", 4, [], ["RopeEnd", [0,0,0]]];
		myRope = ropeCreate [vehicle player, [1.2, 2.03, -2.2], basket, "SlingLoadCargo3", 4, [], ["RopeEnd", [0,0,0]]];
		myRope = ropeCreate [vehicle player, [1.2, 2.03, -2.2], basket, "SlingLoadCargo4", 4, [], ["RopeEnd", [0,0,0]]];
		call mst_fnc_handleRopeDetach;
	};
	if (normalRopes && typeOf basket == "MS_CoastguardBasketNew") then {
		vehicle player removeEventHandler ["RopeBreak",0];
		myRope = ropeCreate [vehicle player, [1.2, 2.03, -2.2], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
		call mst_fnc_handleRopeDetach;
	};
	if (EMSRopes && typeOf basket == "vtx_hook") then {
		vehicle player removeEventHandler ["RopeBreak",0];
		myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
		call mst_fnc_handleRopeDetach;
	};
	if (normalRopes && typeOf basket == "vtx_hook") then {
		vehicle player removeEventHandler ["RopeBreak",0];
		myRope = ropeCreate [vehicle player, [1.2, 2.03, -2.2], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
		call mst_fnc_handleRopeDetach;
	};
};

mst_fnc_deployHelicopterBasket = {
	basket = "MS_CoastguardBasketNew" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2, -1]);
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, basket is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	normalRopes = true;
	publicVariable "hasDeployedBasket";
	publicVariable "normalRopes";
};

mst_fnc_deployHelicopterStretcher = {
	basket = "MS_Stretcher" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo1", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo2", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo3", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo4", 4, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, stretcher is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	normalRopes = true;
	publicVariable "hasDeployedBasket";
	publicVariable "normalRopes";
};

mst_fnc_deployHelicopterHook = {
	basket = "vtx_hook" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, [0,0,0.2], 5, []];
	titleText ["Ropes have been deployed, stretcher is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	EMSRopes = true;
	publicVariable "hasDeployedBasket";
	publicVariable "EMSRopes";
};

/*
mst_fnc_shortenRope = {
	{
		ropeUnwind [_x, 3, 3];
	} forEach ropes vehicle player;
	titleText ["Ropes have been shortened to 3m!","PLAIN DOWN"];
};

mst_fnc_lengthenRope = { 
	{
		ropeUnwind [_x, 6, 30];
	} forEach ropes vehicle player;
	titleText ["Ropes have been lengthened to 30m!","PLAIN DOWN"];
};
*/

mst_fnc_moveInAllOccupants = {
	{
		_x moveInAny vehicle player;
	} forEach crew basket;
	titleText ["Crew Of Basket Is Secure!","PLAIN DOWN"];
};

mst_fnc_deleteBasket = {
	{
		ropeDestroy _x;
	} forEach ropes vehicle player;
	deleteVehicle basket;
	titleText ["Basket Has Been Secured!","PLAIN DOWN"];
	hasDeployedBasket = false;
	publicVariable "hasDeployedBasket";
};

mst_fnc_moveIntoBasket = {
	_basket = nearestObjects [player, ["Ship"], 20] select 0;
	if (typeOf _basket in allowedVehicles) then {
		player moveInAny _basket;
	} else {
		hint "The rescue basket is not close enough, or non-existent.";
	};
};

// These are the functions for the helicopter/baskets. ^^
 
_action = ['mst_deployBasket','Rescue Basket',"\USCG\textures\icon_basket.paa",{},
{"AS" in typeOf vehicle player}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['mst_etcFunctions','Equipment Functions',"\USCG\textures\icon_basket.paa",{},
{"AS" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
 
_action = ['mst_cameraFunctions','Camera Functions',"\USCG\textures\icon_basket.paa",{},
{"AS" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
 
_action = ['swapRopeLength','Set Rope Length (WIP)','',{call mst_fnc_setRopeLength},
{"AS" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['getDataReadings','Read Data','',{call mst_fnc_getDataReadings},
{"AS" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass; 
 
_action = ['deployBasket','Deploy Rescue Basket','',{call mst_fnc_deployHelicopterBasket, call mst_fnc_handleRopeDetach, call mst_fnc_handleRopeAttach},
{"AS" in typeOf vehicle player && !hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['deployStretcher','Deploy Rescue Stretcher','',{call mst_fnc_deployHelicopterStretcher, call mst_fnc_handleRopeDetach, call mst_fnc_handleRopeAttach},
{"AS" in typeOf vehicle player && !hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

if (isClass (configFile >> "cfgVehicles" >> "vtx_hook")) then {
	_action = ['deployHook','Deploy Rescue Hook','',{call mst_fnc_deployHelicopterHook, call mst_fnc_handleRopeDetach, call mst_fnc_handleRopeAttach},
	{"AS" in typeOf vehicle player && !hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
	["AS_365_base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;
};

_action = ['startCameraFeed','Start Camera Feed','',{call mst_fnc_startCameraFeed},
{"AS" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['terminateCameraFeed','Terminate Camera Feed','',{call mst_fnc_destroyCameraFeed},
{"AS" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['startNVFeed','Camera Feed > NVG','',{camUseNVG true},
{"AS" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['startTIFeed','Camera Feed > Thermal','',{true setCamUseTI 0},
{"AS" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['Restart Camera Feed','Camera Feed > Normal','',{false setCamUseTI 0, camUseNVG false},
{"AS" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['raiseBasket','Raise Rescue Basket','',{call mst_fnc_shortenRopeHH60},
{"AS" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) != 3 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['lowerBasket','Lower Rescue Basket','',{call mst_fnc_lengthenRopeHH60},
{"AS" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) != 30 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

/*
_action = ['swapHookEMS','Hook Point - EMS','',{EMSRopes = true, normalRopes = false; call mst_fnc_swapRopePoints, publicVariable "EMSRopes"; publicVariable "normalRopes";},
{"AS" in typeOf vehicle player, ropeLength (ropes vehicle player select 0) == 3, normalRopes, hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['swapHookNormal','Hook Point - Standard','',{normalRopes = true, EMSRopes = false; call mst_fnc_swapRopePoints, publicVariable "EMSRopes"; publicVariable "normalRopes";},
{"AS" in typeOf vehicle player, ropeLength (ropes vehicle player select 0) == 3, EMSRopes, hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
*/

_action = ['moveBasketCrew','Move Basket Crew Into Vehicle','',{call mst_fnc_moveInAllOccupants},
{"AS" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) == 3 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['moveIntoBasket','Move Into Rescue Basket','',{call mst_fnc_moveIntoBasket},
{"AS" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) == 3 && driver vehicle player != player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['secureBasket','Secure Rescue Basket','',{call mst_fnc_deleteBasket},
{"AS" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) == 3 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["AS_365_base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// These actually add the actions, making them functional.
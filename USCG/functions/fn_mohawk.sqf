// Variables (Defaults)
hasDeployedBasket = false;
allowedVehicles = ["MS_CoastguardBasket", "MS_CoastguardBasketNew", "MS_Stretcher", "vtx_hook", "litter_civ"];
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

mst_fnc_deployHelicopterBasketMohawk = {
	basket = "MS_CoastguardBasketNew" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2, -1]);
	myRope = ropeCreate [vehicle player, [2.41, 0.3, 3.1], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, basket is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
};

mst_fnc_deployHelicopterStretcherMohawk = {
	basket = "MS_Stretcher" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [vehicle player, [2.41, 0.3, 3.1], basket, "SlingLoadCargo1", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [2.41, 0.3, 3.1], basket, "SlingLoadCargo2", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [2.41, 0.3, 3.1], basket, "SlingLoadCargo3", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [2.41, 0.3, 3.1], basket, "SlingLoadCargo4", 4, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, stretcher is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
};

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
	if (typeOf _basket in allowedVehicles && driver vehicle player != player) then {
		player moveInAny _basket;
	} else {
		hint "The rescue basket is not close enough, or non-existent.";
	};
};

// These are the functions for the helicopter/basket. ^^

_action = ['mst_deployBasket','Rescue Basket',"\USCG\textures\icon_basket.paa",{},
{"CUP" in typeOf vehicle player}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['mst_etcFunctions','Equipment Functions',"\USCG\textures\icon_basket.paa",{},
{"CUP" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['mst_cameraFunctions','Camera Functions',"\USCG\textures\icon_basket.paa",{},
{"CUP" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
 
_action = ['deployBasket','Deploy Rescue Basket','',{call mst_fnc_deployHelicopterBasketMohawk, call mst_fnc_handleRopeDetach, call mst_fnc_handleRopeAttach},
{"CUP" in typeOf vehicle player && !hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

//_action = ['deployBasket','Deploy Alternate Rescue Basket','',{call mst_fnc_deployHelicopterAltBasketHH60, call mst_fnc_handleRopeDetach, call mst_fnc_handleRopeAttach},
//{"CUP" in typeOf vehicle player && !hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
//["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['startCameraFeed','Start Camera Feed','',{call mst_fnc_startCameraFeed},
{"CUP" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['terminateCameraFeed','Terminate Camera Feed','',{call mst_fnc_destroyCameraFeed},
{"CUP" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['startNVFeed','Camera Feed > NVG','',{camUseNVG true},
{"CUP" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['startTIFeed','Camera Feed > Thermal','',{true setCamUseTI 0},
{"CUP" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['Restart Camera Feed','Camera Feed > Normal','',{false setCamUseTI 0, camUseNVG false},
{"CUP" in typeOf vehicle player && hasDeployedBasket && isUsingCamera}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_cameraFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['swapRopeLength','Set Rope Length (WIP)','',{call mst_fnc_setRopeLength},
{"CUP" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['getDataReadings','Read Data','',{call mst_fnc_getDataReadings},
{"CUP" in typeOf vehicle player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['deployStretcher','Deploy Rescue Stretcher','',{call mst_fnc_deployHelicopterStretcherMohawk, call mst_fnc_handleRopeDetach, call mst_fnc_handleRopeAttach},
{"CUP" in typeOf vehicle player && !hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['raiseBasket','Raise Rescue Basket','',{call mst_fnc_shortenRopeHH60},
{"CUP" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) >= 3 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['lowerBasket','Lower Rescue Basket','',{call mst_fnc_lengthenRopeHH60},
{"CUP" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) <= 5 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['moveBasketCrew','Move Basket Crew Into Vehicle','',{call mst_fnc_moveInAllOccupants},
{"CUP" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) <= 5 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['moveIntoBasket','Move Into Rescue Basket','',{call mst_fnc_moveIntoBasket},
{"CUP" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) <= 5 && driver vehicle player != player && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_etcFunctions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_action = ['secureBasket','Secure Rescue Basket','',{call mst_fnc_deleteBasket},
{"CUP" in typeOf vehicle player && ropeLength (ropes vehicle player select 0) <= 5 && hasDeployedBasket}] call ace_interact_menu_fnc_createAction;
["CUP_Merlin_Rescue_Base", 1, ["ACE_SelfActions", "mst_deployBasket"], _action, true] call ace_interact_menu_fnc_addActionToClass;

// These actually add the actions, making them functional.
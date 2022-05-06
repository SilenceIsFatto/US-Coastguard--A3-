mst_fnc_deployHelicopterBasketH60 = {
	basket = "MS_CoastguardBasketV3" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2, -1]);
	myRope = ropeCreate [vehicle player, [1.405, 2.03, 0.45], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, basket is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
	publicVariable "basket";
	vehicle player animateSource ['hoist_hook_hide', 1];
	call mst_fnc_handleRopeDetach;
	currentVehicle = basket;
	hookDeployed = true;
	publicVariable "hookDeployed";
};

mst_fnc_deployHelicopterStretcherH60 = {
	basket = "MS_Stretcher" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [vehicle player, [1.405, 2.03, 0.45], basket, "SlingLoadCargo1", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.405, 2.03, 0.45], basket, "SlingLoadCargo2", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.405, 2.03, 0.45], basket, "SlingLoadCargo3", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.405, 2.03, 0.45], basket, "SlingLoadCargo4", 4, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, stretcher is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
	publicVariable "basket";
	vehicle player animateSource ['hoist_hook_hide', 1]; // hide hook
	call mst_fnc_handleRopeDetach;
	currentVehicle = basket;
	hookDeployed = true;
	publicVariable "hookDeployed";
};

mst_fnc_deployHelicopterHookH60 = {
	hook = "vtx_hook" createVehicle position player;
	hook setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [vehicle player, [1.405, 2.03, 0.45], hook, [0,0,0.2], 5, []];
	titleText ["Ropes have been deployed, harness is ready!","PLAIN DOWN"];
	hasDeployedHook = true;
	publicVariable "hasDeployedHook";
	publicVariable "hook";
	vehicle player animateSource ['hoist_hook_hide', 1];
	call mst_fnc_handleRopeDetach;
	
	currentVehicle = hook;
	hookDeployed = true;
	publicVariable "hookDeployed";
};

mst_fnc_deployHelicopterStretcherWithHookH60 = {
	call mst_fnc_deployHelicopterHookH60;
	stretcher_hook = "MS_Stretcher" createVehicle position player;
	stretcher_hook setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo1", 0.2, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo2", 0.2, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo3", 0.2, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo4", 0.2, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, stretcher_hook is ready!","PLAIN DOWN"];
	hasDeployedStretcher = true;
	publicVariable "hasDeployedStretcher";
	publicVariable "stretcher_hook";
	vehicle player animateSource ['hoist_hook_hide', 1]; // hide hook
	call mst_fnc_handleRopeDetach;
	hookDeployed = true;
	publicVariable "hookDeployed";
};
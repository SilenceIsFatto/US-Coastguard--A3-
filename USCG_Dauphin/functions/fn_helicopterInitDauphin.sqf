mst_fnc_deployHelicopterBasketDauphin = {
	basket = "MS_CoastguardBasketV3" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2, -1]);
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, basket is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
	publicVariable "basket";
	vehicle player animateSource ["ems", 1];
	[] call mst_fnc_handleRopeDetach;
};

mst_fnc_deployHelicopterHookDauphin = {  
	hook = "vtx_hook" createVehicle position player;  
	hook setPos (vehicle player modelToWorld [3,2,-1]);

	_rope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], hook, [0,0,0.2], 3];  

	titleText ["Ropes have been deployed, harness is ready!","PLAIN DOWN"];  
	hasDeployedHook = true;  
	publicVariable "hasDeployedHook";  
	vehicle player animateSource ['ems', 1]; 
	[vehicle player] call mst_fnc_handleRopeDetach;  

	hookDeployed = true;  
	publicVariable "hookDeployed"; 
	publicVariable "hook";  
};

mst_fnc_deployHelicopterStretcherWithHookDauphin = {
	call mst_fnc_deployHelicopterHookDauphin;
	stretcher_hook = "MS_Stretcher_V3" createVehicle position player;
	stretcher_hook setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo1", 1, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo2", 1, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo3", 1, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo4", 1, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, stretcher_hook is ready!","PLAIN DOWN"];
	hasDeployedStretcher = true;
	publicVariable "hasDeployedStretcher";
	publicVariable "stretcher_hook";
	[vehicle player] call mst_fnc_handleRopeDetach;
};
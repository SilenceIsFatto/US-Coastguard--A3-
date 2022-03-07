mst_fnc_deployHelicopterBasketDauphin = {
	basket = "MS_CoastguardBasketV3" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2, -1]);
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, basket is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
	publicVariable "basket";
	vehicle player animateSource ["ems", 1]
	call mst_fnc_handleRopeDetach;
};

mst_fnc_deployHelicopterStretcherDauphin = {
	basket = "MS_Stretcher" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo1", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo2", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo3", 4, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, "SlingLoadCargo4", 4, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, stretcher is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
	publicVariable "basket";
	vehicle player animateSource ["ems", 1]
	call mst_fnc_handleRopeDetach;
};

mst_fnc_deployHelicopterHookDauphin = {
	basket = "vtx_hook" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2,-1]);
	myRope = ropeCreate [vehicle player, [1.5, 4.15, -0.2], basket, [0,0,0.2], 5, []];
	titleText ["Ropes have been deployed, harness is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
	publicVariable "basket";
	vehicle player animateSource ["ems", 1]
	call mst_fnc_handleRopeDetach;
	
	hint "get debugged lol"
};

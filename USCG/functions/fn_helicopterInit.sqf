mst_fnc_deployHelicopterBasketH60 = {
	basket = "MS_CoastguardBasketV3" createVehicle position player;
	basket setPos (vehicle player modelToWorld [3,2, -1]);
	myRope = ropeCreate [vehicle player, [1.405, 2.03, 0.45], basket, [0,-0.2,1], 5, [], ["RopeEnd", [0,0,0]]];
	titleText ["Ropes have been deployed, basket is ready!","PLAIN DOWN"];
	hasDeployedBasket = true;
	publicVariable "hasDeployedBasket";
	publicVariable "basket";
	vehicle player animateSource ['hoist_hook_hide', 1];
	[vehicle player] call mst_fnc_handleRopeDetach;
	hookDeployed = true;
	publicVariable "hookDeployed";
};

mst_fnc_deployHelicopterHookH60 = {  
	//_dummy = "vtx_hook_helper" createVehicle [3,2,-1]; //local to pilot for reliability  
	//_dummy setMass 1;  
	//_dummy attachTo [vehicle player, [3,2,-1]];  
	//_dummy allowDamage false;  

	// ampersand, you're a life saver  

	hook = "vtx_hook" createVehicle position player;  
	hook setPos (vehicle player modelToWorld [3,2,-1]); // [3,2,-1]  
	//_hookSP = hook selectionPosition "sling_point";  
	//hook attachTo [_dummy, _hookSP vectorMultiply -1];  
	//hook allowDamage false;  

	//detach _dummy;  
	//_dummy setVelocity velocity vehicle player;  

	_rope = ropeCreate [vehicle player, [1.402, 2.03, 0.45], hook, [0,0,0.2], 3];  

	//vehicle player setVariable ["vtx_uh60_hoist_vars", [_rope, _dummy, hook], true];  
	//hook setVariable ["vtx_uh60_hoist_heli", vehicle player, true];  

	titleText ["Ropes have been deployed, harness is ready!","PLAIN DOWN"];  
	hasDeployedHook = true;  
	publicVariable "hasDeployedHook";  
	vehicle player animateSource ['hoist_hook_hide', 1];  
	[vehicle player] call mst_fnc_handleRopeDetach;

	hookDeployed = true;  
	publicVariable "hookDeployed"; 
	publicVariable "hook";  
	//[vehicle player] call vtx_uh60_hoist_fnc_stabilizeHook;  
};

mst_fnc_deployHelicopterStretcherWithHookH60 = {
	call mst_fnc_deployHelicopterHookH60;
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

mst_fnc_detachStretcher = {
	{
		ropeDestroy _x;
	} forEach ropes hook;
	hasDetachedStretcher = true;
	publicVariable "hasDetachedStretcher";
};

mst_fnc_attachStretcher = {
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo1", 1, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo2", 1, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo3", 1, [], ["RopeEnd", [0,0,0]]];
	myRope = ropeCreate [hook, [0, 0, 0], stretcher_hook, "SlingLoadCargo4", 1, [], ["RopeEnd", [0,0,0]]];
	hasDetachedStretcher = false;
	publicVariable "hasDetachedStretcher";
};
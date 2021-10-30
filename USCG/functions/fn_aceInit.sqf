// Variables (Defaults)
inBasket = false;
hasDeployedBasket = false;
allowedVehicles = ["MS_CoastguardBasket", "MS_CoastguardBasketNew", "MS_Stretcher"];

mst_fnc_swapBasketAnimation = {
	[player, "amovpercmstpsnonwnondnon"] remoteExec ["switchMove"];
};

mst_fnc_swapBasketAnimationKneel = {
	[player, "amovpknlmstpsnonwnondnon"] remoteExec ["switchMove"]; // Swap their animation to this one
};

mst_fnc_swapBasketAnimationBrace = {
	[player, "acts_civilhiding_1"] remoteExec ["switchMove"];
};

mst_fnc_swapBasketAnimationStand = {
	[player, "acts_briefing_sa_startloop"] remoteExec ["switchMove"];
};

mst_fnc_swapBasketAnimationDead = {
	[player, "hubwoundedprone_idle2"] remoteExec ["switchMove"];
};

_action = ['basketStand','Swap Animation - Stand','',{
	call mst_fnc_swapBasketAnimation;
},
{typeOf vehicle player in allowedVehicles}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['basketKneel','Swap Animation - Kneel','',{
	call mst_fnc_swapBasketAnimationKneel
},
{typeOf vehicle player in allowedVehicles}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['basketBrace','Swap Animation - Brace','',{
	call mst_fnc_swapBasketAnimationBrace
},
{typeOf vehicle player in allowedVehicles}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['basketWatch','Swap Animation - Watch','',{
	call mst_fnc_swapBasketAnimationStand
},
{typeOf vehicle player in allowedVehicles}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ['basketInjured','Swap Animation - Injured','',{
	call mst_fnc_swapBasketAnimationDead
},
{typeOf vehicle player in allowedVehicles}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

// This is for the baskets, to fix your animations! ^^
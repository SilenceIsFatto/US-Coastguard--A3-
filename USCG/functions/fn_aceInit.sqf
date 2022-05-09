_actionInfo = [
	"detachStretcher",  // 0: Action name <STRING>
	"Detach Stretcher",                  // 1: Name of the action shown in the menu <STRING>
	"",                                 // 2: Icon <STRING>
	// Statement <CODE>
	{
		params ["_target", "_player", "_params"];
		[] call mst_fnc_detachStretcher;
	},
	// Condition <CODE>
	{ 
		params ["_target", "_player", "_params"];
		(!hasDetachedStretcher) && {hasDeployedStretcher}
	}
];

_action = _actionInfo call ace_interact_menu_fnc_createAction;
["vtx_hook", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

_actionInfo = [
	"attachStretcher",  // 0: Action name <STRING>
	"Attach Stretcher",                  // 1: Name of the action shown in the menu <STRING>
	"",                                 // 2: Icon <STRING>
	// Statement <CODE>
	{
		params ["_target", "_player", "_params"];
		[] call mst_fnc_attachStretcher;
	},
	// Condition <CODE>
	{ 
		params ["_target", "_player", "_params"];
		(hasDetachedStretcher) && {hasDeployedStretcher} && {hook distance stretcher_hook <= 6}
	}
];

_action = _actionInfo call ace_interact_menu_fnc_createAction;
["vtx_hook", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
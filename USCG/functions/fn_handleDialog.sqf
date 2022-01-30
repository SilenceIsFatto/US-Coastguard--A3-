_allowedHooks =
[
	"MS_CoastguardBasketV3", 
	"MS_Stretcher",
	"vtx_hook"
];

{
	_hookName = getText (configFile >> "cfgVehicles" >> _x >> "displayName");
	lbAdd [2200, _hookName];
	lbSetData [2200, _forEachIndex, _x];
} forEach _allowedHooks;
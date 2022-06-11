_allowedHooks =
[
	"MS_Stretcher",
	"USCG_RescueBasket",
	"vtx_hook"
];

{
	_hookName = getText (configFile >> "cfgVehicles" >> _x >> "displayName");
	lbAdd [2200, _hookName];
	lbSetData [2200, _forEachIndex, _x];
} forEach _allowedHooks;
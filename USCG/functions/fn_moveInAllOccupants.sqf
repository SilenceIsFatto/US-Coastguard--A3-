params ["_vehicle"];

{
	_x moveInAny vxf_vehicle;
} forEach crew _vehicle;
titleText ["Crew Of Hook Is Secure!","PLAIN DOWN"];

if (hasDeployedStretcher) then {
	{
		_x moveInAny vxf_vehicle;
	} forEach crew stretcher_hook;
	titleText ["Crew Of Hook Is Secure!","PLAIN DOWN"];
};

if (hasDeployedBasket) then {
	{
		_x moveInAny vxf_vehicle;
	} forEach crew basket_hook;
	titleText ["Crew Of Hook Is Secure!","PLAIN DOWN"];
};
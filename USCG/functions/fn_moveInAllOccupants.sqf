params ["_vehicle"];

if (hasDeployedStretcher) then {
	{
		_x moveInAny vxf_vehicle;
	} forEach crew stretcher_hook;
	titleText ["Crew Of Hook Is Secure!","PLAIN DOWN"];
};

{
	_x moveInAny vxf_vehicle;
} forEach crew _vehicle;
titleText ["Crew Of Hook Is Secure!","PLAIN DOWN"];
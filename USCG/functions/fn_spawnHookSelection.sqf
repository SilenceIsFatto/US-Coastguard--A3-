// Don't mind the confusing name, the functions for spawning actual hooks are in fn_helicopterInit.sqf.

_index = lbCurSel 2200;
_hook = lbData [2200, _index];


if ("vtx" in typeOf vehicle player) then {

	switch (_hook) do 
	{
		case "MS_CoastguardBasketV3": {[] call mst_fnc_deployHelicopterBasketH60};
		
		case "MS_Stretcher": {[] call mst_fnc_deployHelicopterStretcherWithHookH60};
		
		case "vtx_hook": {[] call mst_fnc_deployHelicopterHookH60};
	};
	
};

if ("AS_" in typeOf vehicle player) then {

	switch (_hook) do 
	{
		case "MS_CoastguardBasketV3": {[] call mst_fnc_deployHelicopterBasketDauphin};
		
		case "MS_Stretcher": {[] call mst_fnc_deployHelicopterStretcherWithHookDauphin};
		
		case "vtx_hook": {[] call mst_fnc_deployHelicopterHookDauphin};
	};

};

if ("jayhawk" in typeOf vehicle player) then {

	switch (_hook) do 
	{
		case "USCG_RescueBasket": {[] call uscg_jayhawkrescue_fnc_deployBasket};
	
		case "MS_Stretcher": {[] call uscg_jayhawkrescue_fnc_deployStretcher};
		
		case "vtx_hook": {[] call uscg_jayhawkrescue_fnc_deployHook};
	};

};
// Don't mind the confusing name, the functions for spawning actual hooks are in fn_helicopterInit.sqf.

_index = lbCurSel 2200;
_hook = lbData [2200, _index];

switch (_hook) do 
{
	case "MS_CoastguardBasketV3": {[] call mst_fnc_deployHelicopterBasketH60};
	
	case "MS_Stretcher": {[] call mst_fnc_deployHelicopterStretcherH60};
	
	case "vtx_hook": {[] call mst_fnc_deployHelicopterHookH60};
};

/*
switch (true) do
{
	case " 'vtx' in typeOf vehicle player ": 
	{
		switch (_hook) do 
		{
			case "MS_CoastguardBasketV3": {[] call mst_fnc_deployHelicopterBasketH60};
			
			case "MS_Stretcher": {[] call mst_fnc_deployHelicopterStretcherH60};
			
			case "vtx_hook": {[] call mst_fnc_deployHelicopterHookH60};
		};
	};
	case " 'AS' in typeOf vehicle player ": 
	{
		switch (_hook) do 
		{
			case "MS_CoastguardBasketV3": {[] call mst_fnc_deployHelicopterBasketDauphin};
			
			case "MS_Stretcher": {[] call mst_fnc_deployHelicopterStretcherDauphin};
			
			case "vtx_hook": {[] call mst_fnc_deployHelicopterHookDauphin};
		};
	};
};
*/
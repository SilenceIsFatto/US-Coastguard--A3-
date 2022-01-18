class CfgFunctions
{
	class USCG
	{
		class functions
		{
			class helicopterInit
			{
				file="\USCG\functions\fn_helicopterInit.sqf";
				postInit=1;
			};
			class eventHandlers 
			{
				file="\USCG\functions\fn_eventHandlers.sqf";
				postInit=1;
			};
			class commonFunctions
			{
				file="\USCG\functions\fn_commonFunctions.sqf";
				postInit=1;
			};
			
			class handleDialog
			{
				file="\USCG\functions\fn_handleDialog.sqf";
				postInit=1;
			};
			class spawnHookSelection
			{
				file="\USCG\functions\fn_spawnHookSelection.sqf";
				postInit=1;
			};
			class aceInit
			{
				file="\USCG\functions\fn_aceInit.sqf";
				postInit=1;
			};
		};
	};
};

class CfgPatches
{
	class USCG
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F", "cba_settings"};
	};
};

#include "\USCG\dialogs\defines.hpp"
#include "\USCG\dialogs\dialogs.hpp"

class cfgVehicles 
{
	class Heli_Transport_01_base_F;
	class vtx_H60_base : Heli_Transport_01_base_F 
	{
		class vxf_cargo
		{
			class interaction
			{
				class transferBasketHelicopter
				{
					condition = "hasDeployedBasket && ropeLength (ropes vehicle player select 0) <= 3";
					positionType = "coordinates";
					position[] = {0.719326,5.13598,-0.377507};
					label = "Move Hoist Crew - Helicopter";
					radius = 0.2;
					buttonDown = "call mst_fnc_moveInAllOccupants";
				};
				class readDataPilot
				{
					clickSound = "vxf_Switch_Sound";
					condition = "hasDeployedBasket";
					positionType = "coordinates";
					position[] = {0.719166,5.09165,-0.493864};
					label = "Read Rescue Hoist Data";
					radius = 0.2;
					buttonDown = "call mst_fnc_getDataReadings";
				};
				class readDataCoPilot
				{
					clickSound = "vxf_Switch_Sound";
					condition = "hasDeployedBasket";
					positionType = "coordinates";
					position[] = {-0.730867,5.09079,-0.491695};
					label = "Read Hoist Data";
					radius = 0.2;
					buttonDown = "call mst_fnc_getDataReadings";
				};
				class deployHook
				{
					condition = "!hasDeployedBasket";
					positionType = "coordinates";
					position[] = {1.3946,2.03228,0.269152};
					label = "Deploy Hoist";
					radius = 0.3;
					buttonDown = "call mst_fnc_deployHelicopterHookH60, call mst_fnc_handleRopeDetach";
				};
				class undeployHook
				{
					condition = "hasDeployedBasket && ropeLength (ropes vehicle player select 0) <= 3";
					positionType = "coordinates";
					position[] = {1.43148,2.02815,0.46699};
					//position[] = {1.3946,2.03228,0.269152};
					label = "Retrieve Hoist";
					radius = 0.3;
					buttonDown = "call mst_fnc_deleteBasket && vehicle player animateSource ['hoist_hook_hide', 0];";
				};
				class changeRopeLength
				{
					condition = "hasDeployedBasket";
					positionType = "coordinates";
					position[] = {1.06538,2.71681,-0.347432};
					label = "Set Rope Length";
					radius = 0.1;
					buttonDown = "call mst_fnc_setRopeLength";
				};
				class transferToBasket
				{
					condition = "hasDeployedBasket && ropeLength (ropes vehicle player select 0) <= 3";
					positionType = "coordinates";
					position[] = {1.10092,1.61088,-1.22764};
					label = "Move Onto Hoist";
					radius = 0.2;
					buttonDown = "call mst_fnc_moveIntoBasket";
				};
				class pickRescueEquipment
				{
					clickSound = "vxf_Switch_Sound";
					condition = "!hasDeployedBasket";
					positionType = "coordinates";
					position[] = {1.06762,2.64015,-0.351893};
					label = "Choose Rescue Equipment";
					radius = 0.1;
					buttonDown = "call mst_fnc_spawnHookSelectionMenu";
				};
			};
		};
	};
};

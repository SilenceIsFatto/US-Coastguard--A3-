class CfgPatches
{
	class USCG_Dauphin
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F", "cba_settings"};
	};
};

class CfgFunctions
{
	class USCG_Dauphin
	{
		class functions
		{
			class helicopterInit
			{
				file="\USCG_Dauphin\functions\fn_helicopterInitDauphin.sqf";
				postInit=1;
			};
		};
	};
};

class cfgVehicles 
{
	class Heli_Transport_01_base_F;
	class AS_365_base : Heli_Transport_01_base_F 
	{
		class vxf_copilot
		{
			class interaction 
			{
				class readDataCoPilot
				{
					clickSound = "vxf_Switch_Sound";
					condition = "hasDeployedBasket";
					positionType = "coordinates";
					position[] = {0.186051,5.0142,-1.30048};
					label = "Read Hoist Data";
					radius = 0.2;
					buttonDown = "[player] call uscg_mod_fnc_getDataReadings";
				};
				class transferBasketHelicopter
				{
					condition = "ropeLength (ropes vxf_vehicle select 0) <= 3";
					positionType = "coordinates";
					position[] = {-0.0553411,5.10352,-1.03599};
					label = "Move Hoist Crew - Helicopter";
					radius = 0.1;
					buttonDown = "[hook] call uscg_mod_fnc_moveInAllOccupants";
				};
			};
		};
		class vxf_driver
		{
			class interaction
			{
				class transferBasketHelicopter
				{
					condition = "ropeLength (ropes vxf_vehicle select 0) <= 3";
					positionType = "coordinates";
					position[] = {-0.0553411,5.10352,-1.03599};
					label = "Move Hoist Crew - Helicopter";
					radius = 0.1;
					buttonDown = "[hook] call uscg_mod_fnc_moveInAllOccupants";
				};
				class setLengthPilot
				{
					condition = "hasDeployedBasket";
					positionType = "coordinates";
					position[] = {0.550992,4.50562,-1.16447};
					label = "Set Rope Length";
					radius = 0.2;
					buttonDown = " createDialog 'uscg_RopeMeter' ";
				};
				class readDataPilot
				{
					clickSound = "vxf_Switch_Sound";
					condition = "hasDeployedBasket";
					positionType = "coordinates";
					position[] = {0.186051,5.0142,-1.30048};
					label = "Read Rescue Hoist Data";
					radius = 0.2;
					buttonDown = "[player] call uscg_mod_fnc_getDataReadings";
				};
			};
		};
		class vxf_cargo
		{
			class interaction
			{
				class deployHook
				{
					condition = "!hasDeployedBasket";
					positionType = "coordinates";
					position[] = {1.50174,3.97061,-0.20901};
					label = "Deploy Hoist";
					radius = 0.3;
					buttonDown = "call mst_fnc_deployHelicopterHookDauphin";
				};
				class getOutDiver
				{
					condition = "";
					positionType = "coordinates";
					position[] = {-1.08513,2.58426,-0.996463};
					label = "Jump Into Water";
					radius = 0.3;
					buttonDown = "call mst_fnc_handleEject, player action ['Eject', vehicle player];";
				};
				class undeployHook
				{
					condition = "hasDeployedBasket";
					positionType = "coordinates";
					position[] = {1.50174,3.97061,-0.20901};
					//position[] = {1.3946,2.03228,0.269152};
					label = "Retrieve Hoist";
					radius = 0.3;
					buttonDown = "[hook] call uscg_mod_fnc_deleteHook && vehicle player animateSource ['ems', 0];";
				};
				class transferToBasket
				{
					condition = "ropeLength (ropes vxf_vehicle select 0) <= 3";
					positionType = "coordinates";
					position[] = {1.16947,2.59366,-1.82843};
					label = "Move Onto Hoist";
					radius = 0.1;
					buttonDown = "[] call mst_fnc_moveIntoBasket";
				};
				/*
				class pickRescueEquipment
				{
					clickSound = "vxf_Switch_Sound";
					condition = "!hasDeployedBasket";
					positionType = "coordinates";
					position[] = {1.16947,2.59366,-1.82843};
					label = "Choose Rescue Equipment";
					radius = 0.1;
					buttonDown = "call mst_fnc_spawnHookSelectionMenu";
				};
				*/
			};
		};
	};
};

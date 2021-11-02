class CfgFunctions
{
	class USCG
	{
		class functions
		{
			class aceInit
			{
				file="\USCG\functions\fn_aceInit.sqf";
				postInit=1;
			};
			class helicopterInit
			{
				file="\USCG\functions\fn_helicopterInit.sqf";
				postInit=1;
			};
			class H60JInit
			{
				file="\USCG\functions\fn_h60jInit.sqf";
				postInit=1;
			};
			class dauphinInit
			{
				file="\USCG\functions\fn_dauphinInit.sqf";
				postInit=1;
			};
			class mohawkInit
			{
				file="\USCG\functions\fn_mohawk.sqf";
				postInit=1;
			};
			class bell_Init
			{
				file="\USCG\functions\fn_bell.sqf";
				postInit=1;
			};
			class eventHandlers 
			{
				file="\USCG\functions\fn_eventHandlers.sqf";
				postInit=1;
			};
		};
	};
};

class CfgPatches
{
	class MS_USCG
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
	class Boat_F;
	class B_Boat_Transport_01_F;
	class Rubber_duck_base_F;
	class EventHandlers;
	/*
	class MS_CoastguardBasket: Rubber_duck_base_F
	{
		class EventHandlers : EventHandlers 
		{
			init = "(_this select 0) lockCargo [1, true]; (_this select 0) lockCargo [2, true]; (_this select 0) lockCargo [3, true]; (_this select 0) lockCargo [4, true]; (_this select 0) lockCargo [5, true];";
		};
		scope = 2;
		scopeCurator = 2;
		side = 1;
		faction = "BLU_F";
		displayName = "[MS] Coastguard Basket";  /// displayed in Editor
		model = "\USCG\basket";/// simple path to model
		picture = "\USCG\ms_logo.jpg"; /// just some icon in command bar
		Icon = "\USCG\ms_logo.jpg"; /// icon in map
		airCapacity = 9999999999999999999999;
		driverAction = "Zodiac_Driver"; 	/// what action is going the driver take inside the vehicle. Non-existent action makes the vehicle inaccessible
		cargoAction[] = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		gunnerAction = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		transportSoldier = 1; /// number of cargo except driver
		ejectDeadDriver = true;			/// use this if you don't have proper dead pose for the driver, it will eject him from boat if he dies
		simulation = "shipx";
		maxSpeed = 75;
		slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"};
	};
	*/
};

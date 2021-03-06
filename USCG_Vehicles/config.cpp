class CfgPatches
{
	class USCG_Basket
	{
		units[] = {"MS_CoastguardBasketV3"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F"};
	};
};

class cfgVehicles 
{
	class Boat_F;
	class B_Boat_Transport_01_F;
	class Rubber_duck_base_F;
	class EventHandlers;
	class MS_CoastguardBasketV3: Rubber_duck_base_F
	{
		class EventHandlers : EventHandlers 
		{
			init = "(_this select 0) lockCargo [1, true]; (_this select 0) lockCargo [2, true]; (_this select 0) lockCargo [3, true]; (_this select 0) lockCargo [4, true]; (_this select 0) lockCargo [5, true];";
		};
		scope = 2;
		scopeCurator = 2;
		side = 1;
		faction = "BLU_F";
		displayName = "Coastguard Basket (USCG/V3)";  /// displayed in Editor
		model = "\USCG_Vehicles\basket_v3";/// simple path to model
		picture = "\USCG\ms_logo.jpg"; /// just some icon in command bar
		Icon = "\USCG\ms_logo.jpg"; /// icon in map
		airCapacity = 9999999999999999999999;
		driverAction = "Zodiac_Driver"; 	/// what action is going the driver take inside the vehicle. Non-existent action makes the vehicle inaccessible
		cargoAction[] = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		gunnerAction = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		transportSoldier = 1; /// number of cargo except driver
		ejectDeadDriver = true;			/// use this if you don't have proper dead pose for the driver, it will eject him from boat if he dies
		simulation = "shipx";
		maxSpeed = 75;
		slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"};
	};
	/*
	class MS_CoastguardBasketNew: Rubber_duck_base_F
	{
		class EventHandlers : EventHandlers 
		{
			init = "(_this select 0) lockCargo [1, true]; (_this select 0) lockCargo [2, true]; (_this select 0) lockCargo [3, true]; (_this select 0) lockCargo [4, true]; (_this select 0) lockCargo [5, true];";
		};
		scope = 2;
		scopeCurator = 2;
		side = 1;
		faction = "BLU_F";
		displayName = "[MS] Coastguard Basket (USCG)";  /// displayed in Editor
		model = "\USCG_Vehicles\basketNew";/// simple path to model
		picture = "\USCG\ms_logo.jpg"; /// just some icon in command bar
		Icon = "\USCG\ms_logo.jpg"; /// icon in map
		airCapacity = 9999999999999999999999;
		driverAction = "Zodiac_Driver"; 	/// what action is going the driver take inside the vehicle. Non-existent action makes the vehicle inaccessible
		cargoAction[] = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		gunnerAction = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		hiddenSelections[] = {"roof", "floats", "bottom"};
		hiddenSelectionsTextures[] = {};
		transportSoldier = 1; /// number of cargo except driver
		ejectDeadDriver = true;			/// use this if you don't have proper dead pose for the driver, it will eject him from boat if he dies
		simulation = "shipx";
		maxSpeed = 75;
		slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4"};
	};
	*/
};

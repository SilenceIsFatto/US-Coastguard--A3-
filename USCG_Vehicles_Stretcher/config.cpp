class CfgPatches
{
	class MS_USCG_Vehicles_Stretcher
	{
		units[] = {"MS_Stretcher", "MS_Stretcher_V3"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F"};
	};
};

class CfgMovesBasic 
{
	class Actions;
};

class CfgMovesMaleSdr: CfgMovesBasic 
{
	class States 
	{
		class CutSceneAnimationBaseSit;
		
		class USCG_anim_stretcher: CutSceneAnimationBaseSit 
		{
			file = "USCG_Vehicles_Stretcher\anim\anim_stretcher.rtm";
			speed = -1e+010;
			looped = "true";
			interpolateFrom[] = {};
			interpolateTo[] = {};
			canPullTrigger = 0;
			disableWeapons = 1;
			disableWeaponsLong = 1;
			weaponLowered = 1;
			weaponIK = 0;
			rightHandIKCurve[] = {0};
			leftHandIKCurve[] = {0};
            canReload = 0;				
		};										
	};
};



class cfgVehicles 
{
	class Boat_F;
	class B_Boat_Transport_01_F;
	class Rubber_duck_base_F;
	class EventHandlers;
	class MS_Stretcher: Rubber_duck_base_F
	{
		class EventHandlers : EventHandlers 
		{
			init = "(_this select 0) lockCargo [0, true]; (_this select 0) lockCargo [1, true]; (_this select 0) lockCargo [2, true]; (_this select 0) lockCargo [3, true]; (_this select 0) lockCargo [4, false]; (_this select 0) lockCargo [5, true];";
		};
		scope = 2;
		scopeCurator = 2;
		side = 1;
		faction = "BLU_F";
		displayName = "Stretcher";
		model = "\USCG_Vehicles_Stretcher\stretcher";
		picture = "\USCG\ms_logo.jpg";
		Icon = "\USCG\ms_logo.jpg";
		airCapacity = 0;
		hasCommander = 0;
		hasDriver = 0;
		hasGunner = 0;
		cargoAction[] = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		getInAction 		= GetInLow; 		/// how does driver look while getting in
		getOutAction 		= GetOutLow; 		/// and out
		cargoGetInAction[] 	= {"GetInLow"}; 	/// and the same for the rest, if the array has fewer members than the count of crew, the last one is used for the rest
		cargoGetOutAction[] = {"GetOutLow"}; 	/// that means all use the same in this case
		destrType = "DestructNo";
		transportSoldier = 1; /// number of cargo except driver
		ejectDeadDriver = true;			/// use this if you don't have proper dead pose for the driver, it will eject him from boat if he dies
		simulation = "shipx";
		maxSpeed = 75;
		slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4", "SlingLoadCargo5"};
	};
	class MS_Stretcher_V3: Rubber_duck_base_F
	{
		class EventHandlers : EventHandlers 
		{
			init = "(_this select 0) lockCargo [0, true]; (_this select 0) lockCargo [1, true]; (_this select 0) lockCargo [2, true]; (_this select 0) lockCargo [3, true]; (_this select 0) lockCargo [4, false]; (_this select 0) lockCargo [5, true];";
		};
		scope = 2;
		scopeCurator = 2;
		side = 1;
		faction = "BLU_F";
		displayName = "Stretcher (USCG/V3)";
		model = "\USCG_Vehicles_Stretcher\stretcherv3";
		picture = "\USCG\ms_logo.jpg";
		Icon = "\USCG\ms_logo.jpg";
		airCapacity = 0;
		hasCommander = 0;
		hasDriver = 0;
		hasGunner = 0;
		cargoAction[] = {"Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver", "Zodiac_Driver"}; /// the same of all the crew
		getInAction 		= GetInLow; 		/// how does driver look while getting in
		getOutAction 		= GetOutLow; 		/// and out
		cargoGetInAction[] 	= {"GetInLow"}; 	/// and the same for the rest, if the array has fewer members than the count of crew, the last one is used for the rest
		cargoGetOutAction[] = {"GetOutLow"}; 	/// that means all use the same in this case
		destrType = "DestructNo";
		transportSoldier = 1; /// number of cargo except driver
		ejectDeadDriver = true;			/// use this if you don't have proper dead pose for the driver, it will eject him from boat if he dies
		simulation = "shipx";
		maxSpeed = 75;
		slingLoadCargoMemoryPoints[] = {"SlingLoadCargo1","SlingLoadCargo2","SlingLoadCargo3","SlingLoadCargo4", "SlingLoadCargo5"};
	};
};

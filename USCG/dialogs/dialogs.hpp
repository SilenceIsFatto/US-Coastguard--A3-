class uscg_hookSelection
{
	idd=7000;
	class controls
	{
		
		class USCG_Hook_Selection_Frame: RscFrame
		{
			idc = 2000;
			x = 0.334999 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.33 * safezoneW;
			h = 0.429 * safezoneH;
			colorText[] = {1,0,0,1};
			colorBackground[] = {1,0,0,1};
			colorActive[] = {1,0,0,1};
		};
		class USCG_Hook_Selection_Frame_1: RscPicture
		{
			idc = 2100;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.253 * safezoneH;
			colorText[] = {0.25,0.25,0.25,1};
			colorBackground[] = {0.25,0.25,0.25,1};
			colorActive[] = {0.25,0.25,0.25,1};
		};
		class USCG_Hook_Selection_List: RscListbox
		{
			idc = 2200;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.108281 * safezoneW;
			h = 0.231 * safezoneH;
			colorText[] = {1,0,0,1};
			colorBackground[] = {0.25,0.25,0.25,0.25};
			colorActive[] = {1,0,0,1};
		};
		class USCG_Hook_Selection_Text: RscText
		{
			idc = 2300;
			text = "Spawn with meds:"; //--- ToDo: Localize;
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.566 * safezoneH + safezoneY;
			w = 0.221719 * safezoneW;
			h = 0.088 * safezoneH;
			sizeEx = 1.35 * GUI_GRID_H;
		};
		class USCG_Hook_Selection_Medbox: RscCheckbox
		{
			idc = 2400;
			x = 0.618593 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,0,0,1};
			colorBackground[] = {1,0,0,1};
			colorActive[] = {1,0,0,1};
		};
		class USCG_Hook_Selection_Frame_2: RscPicture
		{
			idc = 2500;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.525781 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.198 * safezoneH;
			colorText[] = {0.25,0.25,0.25,1};
			colorBackground[] = {0.25,0.25,0.25,1};
			colorActive[] = {0.25,0.25,0.25,1};
		};
		
		class USCG_Hook_Selection_Spawn: RscButton
		{
			idc = 2600;
			text = "Hook Selection To Hoist"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,-1,-1,1};
			colorBackground[] = {-1,-1,-1,1};
			colorActive[] = {1,-1,-1,0.5};
			action = "[] call USCG_mod_fnc_spawnHookSelection";
			sizeEx = 1.8 * GUI_GRID_H;
		};

	};
};

class uscg_RopeMeter
{
	idd=6000;
	class controls
	{
		class uscg_ropeBackground: RscPicture
		{
			idc = 1000;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.11 * safezoneH;
			colorText[] = {0.25,0.25,0.25,1};
			colorBackground[] = {0.25,0.25,0.25,1};
			colorActive[] = {0.25,0.25,0.25,1};
		};
		class uscg_ropeEdit: RscEdit
		{
			idc = 1100;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class uscg_ropeText: RscText
		{
			idc = 1200;
			text = "Rope Length:"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx = 3 * GUI_GRID_H;
		};
		class uscg_ropeTextAlt: RscText
		{
			idc = 1300;
			text = "3-0m for retrieval actions!"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class uscg_ropeSetLength: RscButton
		{
			idc = 1400;
			text = "Set Rope Length"; //--- ToDo: Localize;
			x = 0.432968 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
			action = "[] call uscg_mod_fnc_getRopeLength";
			colorText[] = {0.7,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
	};
};
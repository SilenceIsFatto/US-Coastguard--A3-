class uscg_RopeMeter
{
	idd=6000;
	class controls
	{
		class uscg_ropeBackground: RscPicture
		{
			idc = 1200;
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
			idc = 1400;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.044 * safezoneH;
		};
		class uscg_ropeText: RscText
		{
			idc = 1000;
			text = "Rope Length:"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.055 * safezoneH;
			sizeEx = 3 * GUI_GRID_H;
		};
		class uscg_ropeTextAlt: RscText
		{
			idc = 1001;
			text = "5-0m for retrieval actions!"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.055 * safezoneH;
		};
		class uscg_ropeSetLength: RscButton
		{
			idc = 1600;
			text = "Set Rope Length"; //--- ToDo: Localize;
			x = 0.432968 * safezoneW + safezoneX;
			y = 0.511 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.055 * safezoneH;
			action = "execVM '\USCG\functions\fn_checkRopeLength.sqf' ";
			colorText[] = {0.7,0,0,1};
			colorBackground[] = {0,0,0,0};
			colorActive[] = {0,0,0,0};
		};
	};
};
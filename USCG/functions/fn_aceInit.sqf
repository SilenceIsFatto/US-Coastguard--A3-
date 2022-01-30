// outdated

_allowedHooks =
[
	"MS_CoastguardBasketNew"
];

mst_fnc_swapBasketAnimation = {
	[player, "amovpercmstpsnonwnondnon"] remoteExec ["switchMove"];
};

mst_fnc_swapBasketAnimationKneel = {
	[player, "amovpknlmstpsnonwnondnon"] remoteExec ["switchMove"]; // Swap their animation to this one
};

mst_fnc_swapBasketAnimationBrace = {
	[player, "acts_civilhiding_1"] remoteExec ["switchMove"];
};

mst_fnc_swapBasketAnimationStand = {
	[player, "acts_briefing_sa_startloop"] remoteExec ["switchMove"];
};

mst_fnc_swapBasketAnimationDead = {
	[player, "hubwoundedprone_idle2"] remoteExec ["switchMove"];
};

// This is for the baskets, to fix your animations! ^^
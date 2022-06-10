params ["_unit"];

_1 = count crew stretcher_hook;
_2 = count crew hook;
_3 = count crew basket;

_objPosition = getPosATL _unit;

_x = _objPosition select 0;
_y = _objPosition select 1;

_meters = vehicle _unit distance [_x,_y,0];
hint format ["This helicopter is approximately %1m away from the ground. \n \n \n There are %2 units on the hook. There are %3 units on the stretcher. \n \n \n The ropes length is approximately %4.",_meters, _1, _2, ropeLength (ropes vehicle _unit select 0)];
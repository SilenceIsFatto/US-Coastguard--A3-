params ["_length"];

{
	ropeUnwind [_x, 4, _length];
} forEach ropes vehicle player;
titleText ["Ropes have been lengthened!","PLAIN DOWN"];
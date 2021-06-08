package core;

import Math;

inline function clampf(num:Float, min:Float, max:Float):Float {
	return Math.min(Math.max(num, min), max);
}

inline function clamp(num:Int, min:Int, max:Int):Int {
	return Math.round(Math.min(Math.max(num, min), max));
}

inline function withinRange(num:Int, min:Int, max:Int):Bool {
	return num >= min && num <= max;
}

inline function withinRangef(num:Float, min:Float, max:Float) {
	return num >= min && num <= max;
}

inline function negate(num:Int) {
	return -num;
}

inline function negatef(num:Float) {
	return -num;
}

/**
 * Degrees to radians
 * @return
 */
inline function degToRad(degrees:Float):Float {
	return degrees * Math.PI / 180;
}

/**
 * Applies Linear Interpolation to the variable provided
 * @param start
 * @param end
 * @param amount
 * @return {Float}
 */
function lerp(start:Float, end:Float, amount:Float):Float {
	return start + ((end - start) * amount);
}
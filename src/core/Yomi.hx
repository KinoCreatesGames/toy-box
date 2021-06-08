package core;

import haxe.Json;
import haxe.Constraints.Function;

/**
 * Creates a function that only be run once.
 * @param {Function} f
 * @returns {Function}
 */
function once(f:Function) {
	var count = 0;
	return function() {
		if (count > 0) return null; else {
			count++;
			return f();
		}
	};
}

/**
 * Repeats the code a set number of times
 * similar to a for loop.
 * @param {number} iterations
 * @param {Function} f
 */
function times(iterations:Int, f:Function) {
	for (i in 0...iterations) {
		f();
	}
}

function safeParse(string:String) {
	try {
		return Json.parse(string);
	}
	catch (err) {
		return err;
	}
}
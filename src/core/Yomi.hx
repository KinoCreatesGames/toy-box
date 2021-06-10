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

// Dynamic Piping Function
function pipe<T>(val:T, ...fns:T -> Any) {
	for (fn in fns) {
		val = fn(val);
	}
	return val;
}

/**
 * Abstract Pipe credit of
 * Jeremy Metingtallow
 * https://code.haxe.org/category/abstract-types/pipe.html
 */
abstract Pipe<T>(T) to T {
	public inline function new(s:T) {
		this = s;
	}

	@:op(A | B)
	public inline function pipe1<U>(fn:T -> U):Pipe<U> {
		return new Pipe(fn(this));
	}

	@:op(A | B)
	public inline function pipe2<A, B>(fn:T -> A -> B):Pipe<A -> B> {
		return new Pipe(fn.bind(this));
	}

	@:op(A | B)
	public inline function pipe3<A, B, C>(fn:T -> A -> B -> C):Pipe<A -> B ->
		C> {
		return new Pipe(fn.bind(this));
	}

	@:op(A | B)
	public inline function pipe4<A, B, C, D>(fn:T -> A -> B -> C ->
		D):Pipe<A -> B -> C -> D> {
		return new Pipe(fn.bind(this));
	}
}
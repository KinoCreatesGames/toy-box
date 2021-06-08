package js;

import js.html.Console;

function log(...args:Dynamic) {
	Console.log(args);
}

function warn(...args:Dynamic) {
	Console.warn(args);
}

function info(...args:Dynamic) {
	Console.info(...args);
}

function error(args:Dynamic) {
	Console.error(args);
}
package macros;

#if macro
import haxe.macro.Expr;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.TypeTools;
import sys.FileSystem;

using StringTools;
using Lambda;
#end

#if macro
/**
 * Generates the build date using the out of the box
 * date utilities for Haxe.
 * @return ExprOf<String>
 */
macro function generateBuildDate():ExprOf<String> {
	var date = Date.now();
	return macro $v{"Build Date: " + date.toString()}
}

macro function getSourceOutput():ExprOf<String> {
	var output = Compiler.getOutput();
	// Clean Output and remove extra semicolons
	trace($v{"Compiled File To -> " + output});
	return macro $v{output};
}

/**
 * Path is based on your current root directory.
 * Includes a JS file in your final product.
 * @param path
 * @return Expr
 */
macro function includeJsLib(path:String):Expr {
	var result = switch (FileSystem.exists(path)) {
		case true:
			trace("Found File at path: " + path);
			return Compiler.includeFile(path, "top");
		case false:
			throw "Fail to find file"
				+ path
				+ "\nNote path starts at your root directory.";
			return macro null;
	};
	return result;
}

macro function defineIfNull(value:Expr, def:Expr):Expr {
	return macro @:pos(Context.currentPos()) {
		if ($value == null) $value = $def;
		$value;
	}
}
#end
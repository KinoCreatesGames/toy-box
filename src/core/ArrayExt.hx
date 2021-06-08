package core;

function getByFn<T>(arr:Array<T>, fn:T -> Bool):T {
	var result = arr.filter(fn);
	if (result != null) {
		return result[0];
	} else {
		return null;
	}
}

// array1.isProperSubsetOf(array2)
inline function isProperSubsetOf<T>(array1:Array<T>, array2:Array<T>):Bool {
	return ArrayExt.isSubsetOf(array1, array2)
		&& !ArrayExt.isSubsetOf(array2, array1);
}

// array1.isSupersetOf(array2)
inline function isSupersetOf<T>(array1:Array<T>, array2:Array<T>):Bool {
	return ArrayExt.isSubsetOf(array2, array1);
}

// array1.isSubsetOf(array2)
inline function isSubsetOf<T>(array1:Array<T>, array2:Array<T>):Bool {
	return ArrayExt.isEmpty(ArrayExt.difference(array1, array2));
}

// array.isEmpty()
inline function isEmpty<T>(array:Array<T>):Bool {
	return array.length <= 0;
}

// array1.symmetricDifference(array2)
inline function symmetricDifference<T>(array1:Array<T>,
		array2:Array<T>):Array<T> {
	return ArrayExt.union(ArrayExt.difference(array1, array2),
		ArrayExt.difference(array2, array1));
}

// array1.symmetricDifferenceInPlace(array2)
inline function symmetricDifferenceInPlace<T>(array1:Array<T>,
		array2:Array<T>):Array<T> {
	return ArrayExt.unionInPlace(ArrayExt.differenceInPlace(array1, array2),
		ArrayExt.difference(array2, array1));
}

// array1.union(array2)
inline function union<T>(array1:Array<T>, array2:Array<T>):Array<T> {
	return array1.concat(ArrayExt.difference(array2, array1));
}

// array1.unionInPlace(array2)
inline function unionInPlace<T>(array1:Array<T>, array2:Array<T>):Array<T> {
	array1.concat(ArrayExt.difference(array2,
		array1)); // ... <-- may need to fix to support expand used here
	return array1;
}

// array1.difference(array2)
inline function difference<T>(array1:Array<T>, array2:Array<T>):Array<T> {
	return array1.filter((element:T) -> !array2.contains(element));
}

// array1.differenceInPlace(array2)
inline function differenceInPlace<T>(array1:Array<T>,
		array2:Array<T>):Array<T> {
	// let i=0;; i++
	var i = 0;
	while (array1[i] != null) {
		while (array1[i] != null && array2.contains(array1[i])) {
			array1.remove(array1[i]);
		}
		// !array1[i]
		//  if (array1[i] == null) {
		//   return array1;
		//  }
		i++;
	}

	return array1;
}

// array1.intersection(array2)
inline function intersection<T>(array1:Array<T>, array2:Array<T>):Array<T> {
	// The 2nd argument of includes doesn't match with that of filter
	return array1.filter((element:T) -> array2.contains(element));
	//
}

// array1.intersectionInPlace(array2)
inline function intersectionInPlace<T>(array1:Array<T>,
		array2:Array<T>):Array<T> {
	var i = 0;
	while (array1[i] != null) {
		while (array1[i] != null && !array2.contains(array1[i])) {
			array1.remove(array1[i]);
		}

		if (array1[i] == null) {
			return array1;
		}
		i++;
	}

	return array1;
}
// Sunday, 18 September 2016

/**
 * Returns the permutation of the given string
 *
 * Algorithm:
 * 1. Get each character from the string and remove that character for the original string.
 * 2. Add the character to each position in the spliced string.
 */
function perm(s) {
	var strArr = s.split(""), p = [];
	for (var i = 0; i < s.length; i++) {
		var c = s.charAt(i), arr = strArr.slice();
		arr.splice(i, 1);
		for (var j = 0; j < arr.length; j++) {
			var a1 = arr.slice();
			if (i != j) {
				a1.splice(j, 0, c)
				p.push(a1.join(""));
			}
		}
	}
	p = [...new Set(p)];
	p.push(s);
	return p;
}

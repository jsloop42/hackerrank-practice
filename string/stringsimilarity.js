// Saturday, 17 September 2016

function processData(input) {
    input = input.split("\r\n");	 // on windows
    // input = input.split("\r\n");  // on GNU/Linux
    for (var i = 1; i < input.length; i++) {
    	console.log(input);
    	console.log("inp len "  +input[i].length);
        console.log(sumArr(getZArr(input[i])) + input[i].length);
    }
}

function sumArr(arr) {
	var i = 0; len = arr.length; sum = 0;
	for (i = 0; i < len; i++) {
		if (typeof arr[i] == "number") {
			sum = sum + arr[i];
			console.log(sum);
		}
	}
	return sum;
}

// time out
function findSimilarity(s) {
	var len = s.length, i = 0, sub = "", count = 0;
	for (i = 0; i < len; i++) {
		sub = s.substring(i);
		for (j = 0; j < sub.length; j++) {
			if (sub.charAt(j) == s.charAt(j)) {
				count++;
			} else {
				break;
			}
		}
	}
	console.log(count);
}

// Z function
// http://www.geeksforgeeks.org/z-algorithm-linear-time-pattern-searching-algorithm/
function getZArr(s) {
	var n = s.length, L, R, k, Z = [];
 
    L = R = 0;
    for (var i = 1; i < n; ++i)
    {
        if (i > R)
        {
            L = R = i;
 
            while (R<n && s[R-L] == s[R])
                R++;
            Z[i] = R-L;
            R--;
        }
        else
        {
            k = i-L;
 
            if (Z[k] < R-i+1)
                 Z[i] = Z[k];
 
            else
            {
                L = i;
                while (R<n && s[R-L] == s[R])
                    R++;
                Z[i] = R-L;
                R--;
            }
        }
    }
    //console.log(Z);
    return Z;
}

process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   processData(_input);
});

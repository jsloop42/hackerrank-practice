// Sunday, 18 September 2016

process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();    
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

function main() {
    var a0_temp = readLine().split(' '),
        b0_temp = readLine().split(' ');
    
    var alice = 0, bob = 0;
    for (var i = 0; i < a0_temp.length; i++) {
        if (parseInt(a0_temp[i]) > parseInt(b0_temp[i])) {
            alice++;
        } else if (parseInt(a0_temp[i]) < parseInt(b0_temp[i])) {
            bob++
        }
    }
    console.log(alice + " " + bob);
}

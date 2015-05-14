var crypto = require('crypto');

var inputs = [
 ['', 'ascii'],
 ['abc', 'ascii'],
 ['123', 'ascii'],
 ['123456789abcdef123456789abcdef123456789abcdef123456789abcdef', 'ascii'],
 ['123456789abcdef123456789abcdef123456789abcdef123456789abc', 'ascii'],
 ['123456789abcdef123456789abcdef123456789abcdef123456789ab', 'ascii'],
 ['0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcde', 'ascii'],
 ['0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef', 'ascii'],
 ['foobarbaz', 'ascii']
]

console.log("# hash is the same as node's crypto");
inputs.forEach(function (v) {
  var e = crypto.createHash('sha1').update(v[0], v[1]).digest('hex');
  console.log('["' + v[0] + '", "' + v[1] + '", "' + e + '"], ');
});
console.log("\n");

console.log("# call update multiple times");
inputs.forEach(function (v) {
  var hash = crypto.createHash('sha1');
  for (var i = 0; i < v[0].length; i = (i + 1) * 2) {
    var s = v[0].substring(i, (i + 1) * 2);
    hash.update(s, v[1]);
  }
  var e = hash.digest('hex');
  console.log('["' + v[0] + '", "' + v[1] + '", "' + e + '"], ');
});


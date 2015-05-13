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
].forEach(function (v) {
  var e = crypto.createHash('sha1').update(v[0], v[1]).digest('hex');
  console.log('["' + v[0] + '", "' + v[1] + '", "' + e + '"], ');
});

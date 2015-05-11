var createHash = require('sha.js');

Elm.Native.Sha = {};
Elm.Native.Sha.make = function(elm) {
  elm.Native = elm.Native || {};
  elm.Native.Sha = elm.Native.Sha || {};
  if (elm.Native.Sha.values) {
    return elm.Native.Sha.values;
  }

  function update(data, inputEncoding, algorithm) {
    return algorithm.update(data, inputEncoding);
  }

  function digest(encoding, hash) {
    return hash.digest(encoding);
  }

  return Elm.Native.Sha.values = {
    createHash: createHash,
    update: F3(update),
    digest: F2(digest)
  };
};
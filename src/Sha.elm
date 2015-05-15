module Sha where
{-|

# Definition
@docs Hash

# Function
@docs createHash, update, digest
-}

import Native.Sha

{-| The type for creating hash digests of data.
-}
type Hash = Hash

{-| Creates and return a hash object, a cryptographic hash with the given algorithm which can be used to generate hash digests.
Supported hash algorithms are "sha256", "sha512", "sha1", "sha".

    sha1 = Sha.createHash "sha1"
-}
createHash : String -> Hash
createHash =
  Native.Sha.createHash

{-| Updates the hash content with the given data, the encoding of which is given in inputEncoding and can be "utf8", "ascii" or "binary". If no encoding is provided and the input is a string an encoding of 'binary' is enforced. If data is a Buffer then input_encoding is ignored.

    hash = Sha.update "abc" "utf8" sha1
-}
update : String -> String -> Hash -> Hash
update =
  Native.Sha.update

{-| Calculates the digest of all of the passed data to be hashed. The encoding can be "hex", "binary" or "base64". If no encoding is provided, then a buffer is returned.
-}
digest : String -> Hash -> String
digest =
  Native.Sha.digest

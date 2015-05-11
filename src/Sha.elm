module Sha where
{-|
-}

import Native.Sha

type HashAlgorithm = HashAlgorithm

createHash : String -> HashAlgorithm
createHash =
  Native.Sha.createHash

type Hash = Hash

update : String -> String -> HashAlgorithm -> Hash
update =
  Native.Sha.update

digest : String -> Hash -> String
digest =
  Native.Sha.digest

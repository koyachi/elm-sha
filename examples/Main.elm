import Sha
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Text exposing (..)

-- sha256 = Sha.createHash "sha256"
-- sha512 = Sha.createHash "sha512"

sha1 = Sha.createHash "sha1"
hash = Sha.update "abc" "utf8" sha1
digest = Sha.digest "hex" hash

main : Element
main = show digest


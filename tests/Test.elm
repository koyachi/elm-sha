-- module TestMain where
import ElmTest.Test exposing (test, Test, suite)
import ElmTest.Assertion exposing (assert, assertEqual)
import ElmTest.Runner.Element exposing (runDisplay)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)

--import String
import Sha as S
import Array as A
import Maybe
import String

-- myTest = defaultTest (assertEqual 5 5)

inputs =
  [
   ["", "ascii", "da39a3ee5e6b4b0d3255bfef95601890afd80709"],
   ["abc", "ascii", "a9993e364706816aba3e25717850c26c9cd0d89d"],
   ["123", "ascii", "40bd001563085fc35165329ea1ff5c5ecbdbbeef"],
   ["123456789abcdef123456789abcdef123456789abcdef123456789abcdef", "ascii", "d29c951b6ded5bc695a3e8268f6c069deb626c4c"],
   ["123456789abcdef123456789abcdef123456789abcdef123456789abc", "ascii", "160ce1313a15ae4dbd2c9c45a0bca0223e12ed47"],
   ["123456789abcdef123456789abcdef123456789abcdef123456789ab", "ascii", "f9a5c136c16964d4b2e71a55e66c821ce0cdaea0"],
   ["0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcde", "ascii", "ef717286343f6da3f4e6f68c6de02a5148a801c4"],
   ["0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef", "ascii", "ce4303f6b22257d9c9cf314ef1dee4707c6e1c13"],
   ["foobarbaz", "ascii", "5f5513f8822fdbe5145af33b64d8d970dcf95c6e"]
  ] |> List.map (\i -> A.fromList i)

aGet index array = Maybe.withDefault "" (A.get index array)

testHashIsSameAsNodesCrypto : Test
testHashIsSameAsNodesCrypto =
  let title = "hash is the same as node's crypto"
      digest input encoding =
        S.createHash "sha1"
          |> S.update input encoding
          |> S.digest "hex"

      testInput input encoding expected =
        test ("Sha.createHash 'sha1' |> Sha.update '" ++ input ++ "' '" ++ encoding ++ "' |> Sha.digest 'hex'") (assertEqual (digest input encoding) expected)

  in
    suite title (inputs |> List.map (\i -> testInput (aGet 0 i) (aGet 1 i) (aGet 2 i)))


inputs2 =
  [
   ["", "ascii", "da39a3ee5e6b4b0d3255bfef95601890afd80709"],
   ["abc", "ascii", "a9993e364706816aba3e25717850c26c9cd0d89d"],
   ["123", "ascii", "40bd001563085fc35165329ea1ff5c5ecbdbbeef"],
   ["123456789abcdef123456789abcdef123456789abcdef123456789abcdef", "ascii", "d29c951b6ded5bc695a3e8268f6c069deb626c4c"],
   ["123456789abcdef123456789abcdef123456789abcdef123456789abc", "ascii", "160ce1313a15ae4dbd2c9c45a0bca0223e12ed47"],
   ["123456789abcdef123456789abcdef123456789abcdef123456789ab", "ascii", "f9a5c136c16964d4b2e71a55e66c821ce0cdaea0"],
   ["0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcde", "ascii", "ef717286343f6da3f4e6f68c6de02a5148a801c4"],
   ["0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef", "ascii", "ce4303f6b22257d9c9cf314ef1dee4707c6e1c13"],
   ["foobarbaz", "ascii", "5f5513f8822fdbe5145af33b64d8d970dcf95c6e"]
  ] |> List.map (\i -> A.fromList i)

testCallUpdateMultipleTimes : Test
testCallUpdateMultipleTimes =
  let title = "call update multiple times"
      testInput input encoding expected =
        let hash = S.createHash "sha1"
            updator s i h =
              -- 0,2,6,14,30,62,126,254,...
              let index2 = (i+1)*2
              in
                if i < (String.length s)
                then (updator s index2 (h |> S.update (String.slice i index2 s) encoding))
                else h
            digest =
              (updator input 0 hash) |> S.digest "hex"
        in
          test title (assertEqual digest expected)
  in
    suite title (inputs2 |> List.map (\i -> testInput (aGet 0 i) (aGet 1 i) (aGet 2 i)))

main : Element
main = runDisplay (suite "all tests" [ testHashIsSameAsNodesCrypto
                                     , testCallUpdateMultipleTimes])
